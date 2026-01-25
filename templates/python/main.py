import operator as opt
import numpy as np

from mathparse import MathEvaluator 
from mathparse.operators import (
    MathConstant,
    BinaryOperator,
    UnaryOperator,
    SingleVarMathFunction as SVF
)


def factorial(num: float) -> int:
    if not num.is_integer():
        raise TypeError()
    else: num = int(num)
    result = 1
    for i in range(2, num + 1):
        result *= i
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
        EXPONENTIATION, FACTORIAL,
    ],
    [SIN, COS, TAN, COT],
    [MathConstant('pi', np.pi), MathConstant('e', np.e)],
    MULTIPLICATION.token
)

def evaluate(input: str) -> tuple[int | float]:
    result = evaluator.postfit_evaluate(evaluator.parse(input.lower()))
    return int(result) if result.is_integer() else result


# This is a comment
np_array = np.random.randint(0, 1, size=(100, 5)) 

# random math expression
results = np_array ** 2 - np.cos(np_array)

expr = "5!*sin(pi /2) + 2^2 - 5cos(tan(2))"
print("Evaluating expression")
print(evaluator.parse(expr.lower()))
print(f"Got: {expr} = {evaluate(expr)}")
