from copy import deepcopy
from .operators import (
    Associativity,
    MathConstant,
    NVarMathFunction,
    BinaryOperator,
    UnaryOperator,
)
from .utils import is_numeric

from .exceptions import OperandException, OperatorException
from .types import NumericType 
from typing import Iterable, TypeAlias, Union


Operator: TypeAlias = Union[UnaryOperator, BinaryOperator]


class MathEvaluator:
    __slots__ = (
        '_operators',
        '_functions',
        '_constants',
        '_implicit_operation',
    )

    def __init__(
        self,
        operators: Iterable[Operator] = [],
        functions: Iterable[NVarMathFunction] = [],
        constants: Iterable[MathConstant] = [],
        implicit_operation_token: str = ''
    ) -> None:
        if not isinstance(operators, Iterable):
            raise TypeError("Operators must be a list of Unary/Binary Operator!")
        if not isinstance(functions, Iterable):
            raise TypeError("Functions must be a list of single-var/n-var Math Function!")
        if not isinstance(constants, Iterable):
            raise TypeError("Constants must be a list of Math Constants!")
        if not isinstance(implicit_operation_token, str):
            raise TypeError("Token of implicit operation must be a string!")
        self._operators = {}
        self._functions = {}
        self._constants = {}
        for operator in operators:
            self.add_operator(operator)
        for func in functions:
            self.add_function(func)
        for const in constants:
            self.add_constant(const)

        if implicit_operation_token in self._operators:
            self._implicit_operation = self._operators[implicit_operation_token]
        else:
            self._implicit_operation = None

    @property
    def operators(self) -> dict[str, Operator]:
        return deepcopy(self._operators)
    def add_operator(self, operator: Operator) -> None:
        if not isinstance(operator, Operator):
            raise TypeError("Operator must be a unary/binary operator!")
        elif operator.token in self._operators:
            raise ValueError(f"Operator token '{operator.token}' already exists!")
        self._operators[operator.token] = operator
    
    @property
    def functions(self) -> dict[str, NVarMathFunction]:
        return deepcopy(self._functions)
    def add_function(self, func: NVarMathFunction) -> None:
        if not isinstance(func, NVarMathFunction):
            raise TypeError("func must be a single-var/muli-var function!")
        elif func.token in self._operators:
            raise ValueError(f"Function token '{func.token}' already exists!")
        self._functions[func.token] = func

    @property
    def constants(self) -> dict[str, MathConstant]:
        return deepcopy(self._constants)
    def add_constant(self, constant: MathConstant) -> None:
        if not isinstance(constant, MathConstant):
            raise TypeError("Constant must be a Math Constant!")
        elif constant.token in self._constants:
            raise ValueError(f"Constant token '{constant.token}' already exists!")
        self._constants[constant.token] = constant

    @property
    def implicit_operation(self) -> BinaryOperator:
        return deepcopy(self._implicit_operation)
    @implicit_operation.setter
    def implicit_operation(self, implicit_operation_token: str) -> None:
        if implicit_operation_token in self._operators:
            self._implicit_operation = self._operators[implicit_operation_token]
        else:
            raise OperatorException(
                f"Token of binary operator does "
                "not exist '{implicit_operation_token}'"
            )

    def parse(self, expr: str) -> list[str]:
        substr = self._shuntyard_format_string(expr)
        opt_stack = []
        val_stack = []

        def check_implicit_operation(index: int) -> None:
            """
            Check for implicit operation.

            Implicit operations are implied operation between a numeric value and
            a function/constant.

            For example: if '*' is an implicit_operation and 'pi' is a constant,
            then there is a hidden '*' between 2 and 'pi' in '2pi' -> '2*pi'.
            This is parsed as '2 pi *' in RPN.
            """
            if (
                index != 0 and 
                is_numeric(substr[index-1]) and
                self._implicit_operation
            ):
                opt_stack.append(self._implicit_operation.token)

        for i, string in enumerate(substr):
            if is_numeric(string):
                val_stack.append(string)
            elif string in self._constants:
                check_implicit_operation(i)
                val_stack.append(string)
            elif string in self._functions:
                check_implicit_operation(i)
                opt_stack.append(string)
            elif string in self._operators:
                while (
                    len(opt_stack) and opt_stack[-1] != '(' and
                    self._op2_has_higher_priority(
                        self._operators[string], self._operators[opt_stack[-1]]
                    )
                ):
                    val_stack.append(opt_stack.pop())
                opt_stack.append(string)
            elif string == ',':
                if not len(opt_stack):
                    raise OperandException("Mismatched parenthesis for '('")
                while opt_stack[-1] != '(':
                    val_stack.append(opt_stack.pop())
                    if not len(opt_stack):
                        raise OperandException("Mismatched parenthesis for '('")
            elif string == '(':
                opt_stack.append(string)
            elif string == ')':
                self._pop_close_paran(val_stack, opt_stack)
            else:
                raise ValueError(f"Unrecognised token, has not been implemented yet '{string}'")
            
        while opt_stack:
            if opt_stack[-1] == '(':
                raise OperandException("Mismatched parenthesis for '('")
            val_stack.append(opt_stack.pop())

        return val_stack

    def postfit_evaluate(self, expr: list[str]) -> NumericType:
        if not isinstance(expr, list):
            raise TypeError("Expecting a list of strings!")
        elif not expr:
            return 0

        values = []
        for char in expr:
            if (
                (opt_found := char in self._operators) or
                char in self._functions
            ):
                refer = self._operators[char] if opt_found else self._functions[char]
                try:
                    temp = [values.pop() for _ in range(refer.n_var)]
                except IndexError:
                    raise OperandException(f"Too few operands to evaluate '{char}'")
                temp.reverse()
                values.append(refer(*temp))
            else:
                try:
                    char = (
                        self._constants[char].value
                        if char in self._constants else float(char)
                    )
                except ValueError:
                    raise OperandException(f"Non-numeric value was given: '{char}'")
                values.append(char)

        if len(values) != 1:
            raise OperandException("Too many operands was given")
        return values.pop()

    def _pop_close_paran(
        self,
        val_stack: list[str],
        opt_stack: list[str],
    ):
        if not len(opt_stack):
            raise OperandException("Mismatched parenthesis for ')'")
        while opt_stack[-1] != '(':
            val_stack.append(opt_stack.pop())
            if not len(opt_stack):
                raise OperandException("Mismatched parenthesis for ')'")
        opt_stack.pop()
        if len(opt_stack) and opt_stack[-1] in self._functions:
            val_stack.append(opt_stack.pop())

    def _op2_has_higher_priority(
        self,
        operator_1: Operator,
        operator_2: Operator,
    ) -> bool:
        """
        Check whether `operator_2` has a higher "priority" than `operator_1`.
        An operator has a higher priority if:
            1. It has the higher precedence.
            2. Or in case both has the same precedence, the other operator
                is left-associactive.
        """
        op1_is_unary = isinstance(operator_1, UnaryOperator)
        op2_is_unary = isinstance(operator_2, UnaryOperator)
        if op1_is_unary or op2_is_unary:
            return (not op1_is_unary) and op2_is_unary
        
        lower_precedence = operator_1.precedence < operator_2.precedence
        left_associative = (
            operator_1.precedence == operator_2.precedence and
            (
                operator_1.associativity == Associativity.LEFT or
                operator_1.associativity == Associativity.SPECIAL
            )
        )
        return lower_precedence or left_associative

    def _shuntyard_format_string(self, string: str) -> list[str]:
        """
        Format string expression for Shunting-Yard parsing algorithm.

        The result should be a list of strings, where each element is
        a number or an existing token.

        For example, passing 'cos(pi + 2) -3' will produce the list:
            ['cos', '(', 'pi', '+', '2', ')', '-', '3']
        """
        recognised_tokens = (
            set(self._operators) | set(self._functions) | set(self._constants)
        )
        for token in recognised_tokens:
            if token in string:
                string = f" {token} ".join(string.split(token))

        output = []
        for sub in string.split():
            if sub in recognised_tokens or is_numeric(sub):
                output.append(sub)
            else:
                output.extend(sub)
        return output
