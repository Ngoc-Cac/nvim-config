import math
from datetime import date

# this is a comment
var: int = 5 + 5 - 2 % 1
var_but_formatted = (
    "really long expr"
    "that spans multiple line"
)

def wrapper(func):
    def inner(*args):
        print(f"Args received: {args}")
        return func(*args)
    return inner

@wrapper
def random_func(a, b):
    return a + b / a

class ABC:
    def __init__(self) -> None:
        self.a = 5
    def foo(self, a, b, *args, **kwargs) -> None:
        return None
    def __len__(self) -> int:
        return 0
    def __str__(self):
        return 'nothing'
