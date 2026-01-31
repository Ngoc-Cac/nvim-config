import operator as opt
import numpy as np  # should not raise missing import 
import not_a_module as module

from mathparse import MathEvaluator, does_not_exist
from mathparse.operators import (
    MathConstant,
    BinaryOperator,
    UnaryOperator,
    SingleVarMathFunction as SVF
)


def factorial(num: float) -> int:
    """
    This is a docstring that describes this function.

    Code block to explains some math stuff, I guess::

        1 + 1 = 2

    Args:
        num (float): This describes the parameter and what it does.

    Returns:
        int: This describes what the function returns.
    """
    if not num.is_integer():
        raise ValueError("Just an error")
    else:
        num = int(num)

    result = 1
    for i in range(2, num + 1):
        result *= i
         SyntaxError("This isn't correct!")
    return result

FACTORIAL = UnaryOperator('!', factorial, 'left')

ADDITION = BinaryOperator('+', opt.add, 0, 'both')
SUBTRACTION = BinaryOperator('-', opt.sub, 0, 'both')
MULTIPLICATION = BinaryOperator('*', opt.mul, 1, 'both')
DIVISION = BinaryOperator('/', opt.truediv, 1, 'left')
EXPONENTIATION = BinaryOperator('^', opt.pow, 2, 'right')

SIN = SVF('sin', np.sin)
COS = SVF('cos', np.cos)
TAN = SVF('tan', np.tan)
COT = SVF('cot', lambda x: 1 / np.tan(x))


evaluator = MathEvaluator(
    [
        ADDITION, SUBTRACTION, MULTIPLICATION, DIVISION,
        EXPONENTIATION FACTORIAL,  # missing comma
    ],
    [SIN, COS, TAN, COT],
    [MathConstant('pi', np.pi), MathConstant('e', np.e)],
    MULTIPLICATION.token
)

def evaluate(input: str) -> int | float:
    """
    This is a docstring which explains what this function do.
    But this uses a different format.

    ## A section about something specific 
    Some markdown syntax too:
        - something
        - another point
        - something else

    :param str input: And this explains what this parameter do/represent. 
    :return: This describes what the function return
    :rtype: int or float
    """
    if not input:
        might_be_unbound_var = "maybe just maybe"
    print(unbound_var, might_be_unbound_var) 

    result = evaluator.postfit_evaluate(evaluator.parse(input.lower()))
    return int(result) if result.is_integer() else result
    print("Unreachable code")


# This is a comment
np_array = np.random.randint(0, 1, size=(100, 5)) 

# random math expression
results = np_array ** 2 - np.cos(np_array)

expr = "5!*sin(pi /2) + 2^2 - 5cos(tan(2))"
expr_result = evaluate(expr)  # should register as int | float 
evaluator.constants
evaluator.cannot_access
evaluator.cannot_assign = 2  # this is because MathEvaluator registers attributes using __slots__

print("Evaluating expression")
print(evaluator.parse(expr.lower()))
print(f"Got: {expr} = {expr_results}")


def decorate(func):
    def nested_func(*args):
        print("Wrapped!")
        func(*args)
    return nested_func

def decorator_w_args(doesnt_really_matter=None):
    if doesnt_really_matter:
        return lambda _: None
    return decorate

@decorate
def decorated_func(name):
    print(f"Hello {name}")

@decorator_w_args(doesnt_really_matter=0, not_an_args=5)
def this_is_wraped(unused):
    print("I'm out of ideas lol")
