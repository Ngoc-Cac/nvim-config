from copy import deepcopy 
from enum import Enum

from .exceptions import OperandException
from .types import (
    NumericType,
    NVarFunctionType,
    SingleVarFunctionType,
)
from typing import Callable, Literal


class Associativity(Enum):
    """
    Associativity of operators represent the direction of which
    to apply the operator.

    For binary operators:
        Left-associative operators must be applied from left to right,
            right-associative opertors must be applied from right to left.
        'SPECIAL' means that the operator is left AND right associative
            and may be apply in any direction.
    For unary operators:
        Left-associative operators apply to the numeric value to the left of it.
            Right-associative operator apply to the numeric value ot the right of it.
        No unary operator can have 'SPECIAL' associativity.

    ## Examples
        - '!' as factorial over integer is right-associative. As a result, '2!'
            is a meaningful expression, whereas '!2' is not.
        - '-' as division over real number may be defined as left
            associative. As a result, '3-2-1' is '(3-2)-1' which is '0'.
        - '^' as exponentiation over real number may be defined as right
            associative. As a result, '2^2^3' is '2^(2^3)' which is '2^8'.
        - '+' as addition over real number is both left and right associative
            in any interpretation. As a result, '1+2+3' is '1+(2+3)' or '(1+2)+3',
            resulting in '6'.
    """
    RIGHT = 0
    LEFT = 1
    SPECIAL = 2


class MathConstant:
    """
    This class represents a constant, a symbol that has a numeric value.

    :ivar token: A string representation of the constant.
    :vartype token: str
    :ivar value: The numeric value of the constant.
    :vartype value: NumericType
    """
    __slots__ = '_token', '_value'
    def __init__(self, token: str, value: NumericType) -> None:
        """
        Intialise a constant.

        :ivar token: A string representation of the constant.
        :vartype token: str
        :ivar value: The numeric value of the constant.
        :vartype value: NumericType
        """
        if not isinstance(token, str):
            raise TypeError("Character representation of constant must be a non-empty string!")
        elif not token:
            raise ValueError("Character representation of constant must not be an empty string!")
        if not isinstance(value, NumericType):
            raise TypeError("Value of constant must be numerical")
        
        self._token = token
        self._value = value

    @property
    def token(self) -> str:
        """String representation of constant"""
        return self._token
    @token.setter
    def token(self, new_token: str) -> None:
        if not isinstance(new_token, str):
            raise TypeError(
                "Character representation of constant "
                "must be a non-empty string!"
            )
        elif not new_token:
            raise ValueError(
                "Character representation of "
                "constant must not be an empty string!"
            )
        self._token = new_token
    
    @property
    def value(self) -> NumericType:
        """The numeric value of constant."""
        return self._value
    @value.setter
    def value(self, new_value: NumericType):
        if not isinstance(new_value, NumericType):
            raise TypeError("Value of constant must be numerical")
        self._value = new_value


class NVarMathFunction:
    """
    This class represents a n-variable function. This class is also
    a Callable that takes n numeric values and return a numeric value.

    :ivar n_var: The number of variables that the function takes.
    :vartype n_var: int
    :ivar operation: A Callable containing the math logic to apply
        to the input.
    :vartype operation: NVarFunctionType
    :ivar token: The representation string of the function.
    :vartype token: str
    """
    __slots__ = '_token', '_operation', '_n_var'

    def __init__(
        self,
        token: str,
        operation: NVarFunctionType,
        n_var: int,
    ) -> None:
        """
        Initalise an N-variable function.

        :param token: The string representation of the function.
        :type token: str
        :param operation: A callable that takes `n_var` numerics and
            returns one numberic output.
        :type operation: NVarFunctionType
        :param n_var: The number of input that the function takes, must
            be at least 2.
        """
        if not isinstance(token, str):
            raise TypeError("Character representation must be of type string!")
        elif not token:
            raise ValueError("Character representation must not be empty!")
        if not isinstance(n_var, int):
            raise TypeError("Number of variables must be an integer!")
        elif n_var < 1:
            raise ValueError(
                "Number of variables for a n-variable "
                "function must be at least 1!"
            )
        if not isinstance(operation, Callable):
            raise TypeError(
                f"Operation must be a function that takes "
                "{n_var} numbers and returns a number!"
            )
        
        self._token = token
        self._operation = operation
        self._n_var = n_var
    
    @property
    def token(self) -> str:
        """String representation of function"""
        return self._token
    @token.setter
    def token(self, new_token: str) -> None:
        if not isinstance(new_token, str):
            raise TypeError("Character representation must be of type string!")
        elif not new_token:
            raise ValueError("Character representation must not be empty!")
        self._token = new_token

    @property
    def operation(self) -> NVarFunctionType:
        """
        The operation of the function. This should take in n-var
        amounts of numbers and output one number
        """
        return deepcopy(self._operation)
    @operation.setter
    def operation(self, new_operation: NVarFunctionType) -> None:
        if not isinstance(new_operation, Callable):
            raise TypeError(
                f"Operation must be a function that "
                "takes {self.n_var} numbers and returns a number!"
            )
        self._operation = new_operation
    
    @property
    def n_var(self) -> int:
        """Number of variables the function can take"""
        return self._n_var
    @n_var.setter
    def n_var(self, n_var: int) -> None:
        if not isinstance(n_var, int):
            raise TypeError("Number of variables must be an integer!")
        elif n_var < 1:
            raise ValueError(
                "Number of variables for a "
                "n-variable function must be at least 1!"
            )
        self._n_var = n_var

    def __call__(self, *args: NumericType) -> NumericType:
        if len(args) != self.n_var:
            raise OperandException(f"Too many inputs given, expected {self.n_var} inputs")
        return self._operation(*args)


class SingleVarMathFunction(NVarMathFunction):
    """
    This class represents a single-variable function. This class is also a Callable that
    takes a numeric value and return a numeric value.

    :ivar operation: A Callable containing the math logic to apply
        to the input.
    :vartype operation: SingleVarFunctionType
    :ivar token: The representation string of the function.
    :vartype token: str
    """
    def __init__(self, token: str, operation: SingleVarFunctionType) -> None:
        """
        Intialise a single-var function.

        :param token: The string representation of the function.
        :type token: str
        :param operation: A callable that takes a numeric and
            returns one numberic output.
        :type operation: SingleVarFunctionType
        """
        super().__init__(token, operation, 1)
 
    @NVarMathFunction.n_var.setter
    def n_var(self, n_var: int) -> None:
        raise AttributeError("Cannot set n_var for single-variable function!")


class UnaryOperator(SingleVarMathFunction):
    __slots__ = '_associativity'
    _associativity: Associativity

    def __init__(
        self,
        token: str,
        operation: SingleVarFunctionType,
        associativity: Literal['left', 'right'],
    ) -> None:
        self.associativity = associativity
        super().__init__(token, operation)
    

    @property
    def associativity(self) -> Associativity:
        return self._associativity
    @associativity.setter
    def associativity(
        self,
        new_associativity: Literal['left', 'right']
    ) -> None:
        if new_associativity == 'left':
            self._associativity = Associativity.LEFT
        elif new_associativity == 'right':
            self._associativity = Associativity.RIGHT
        else:
            raise TypeError("Associativity must be a string literal of 'left' or 'right'")


class BinaryOperator(NVarMathFunction):
    """
    This class represents a binary operator. This class is also a
    Callable that takes two numeric values and return a numeric value.
    
    :ivar associativity: The associativity of the operator.
    :vartype associativity: Associativity
    :ivar operation: A Callable representing the action to do when
        applying the operator on two numeric values. This function
        should take in some numbers and out put one number.
    :vartype operation: NVarFunctionType
    :ivar precedence: The priority of the operator.
    :vartype precedence: int
    :ivar token: The string representation of the operator.
    :vartype token: str
    """
    __slots__ = '_precedence', '_associativity'
    _precedence: int
    _associativity: Associativity

    def __init__(
        self,
        token: str,
        operation: NVarFunctionType,
        precedence: int,
        associativity: Literal['left', 'right', 'both'],
    ) -> None:
        """
        Initalise a Binary Operator.

        :param token: A string, preferably a single character, representing the operator.
        :type token: str
        :param operation: A function that takes two numerics and return one numeric.
        :type operation: NVarFunctionType
        :param precedence: An integer that determines the priority of the operator.
            Operator with higher precedence has higher priority.
        :type precedence: int
        :param associativity: A string representing the associativity of an operator.
            For more information, refer to Associativity Enum.
        :type associativity: Associativity
        """
        self.associativity = associativity
        self.precedence = precedence
        super().__init__(token, operation, n_var=2)
  
    
    @property
    def precedence(self) -> int:
        """The precedence of operator."""
        return self._precedence
    @precedence.setter
    def precedence(self, new_precedence: int) -> None:
        if not isinstance(new_precedence, int):
            raise TypeError("Precedence of operator must be an integer!")
        self._precedence = new_precedence
    
    @property
    def associativity(self) -> int:
        """
        The associativity of operator. Refer to Associativity
        Enum for more information
        """
        return self._associativity
    @associativity.setter
    def associativity(
        self,
        new_associativity: Literal['left', 'right', 'both']
    ) -> None:
        if new_associativity == 'left':
            self._associativity = Associativity.LEFT
        elif new_associativity == 'right':
            self._associativity = Associativity.RIGHT
        elif new_associativity == 'both':
            self._associativity = Associativity.SPECIAL
        else:
            raise TypeError(
                "Associativity must be a string literal "
                "of 'left', 'right' or 'both'"
            )
    
    @NVarMathFunction.n_var.setter
    def n_var(self, n_var: int) -> None:
        raise OperandException("Cannot set n_var for binary operators!")
