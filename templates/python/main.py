import math
from datetime import date

# this is a comment
_var: int = 5 + 5 - 2 % 1
var_but_multine = (
    "really long expr"
    "that spans multiple line"
)
some_dict = {
    'a': 1,
    'relly-long-key': 'with really long values'
}

"""
This is a multiline string.
Adding a line here so it becomes a multiline string.
"""

def wrapper(func):
    """
    This is a documentation of the function above.
    random words random words.
    Args:
        func: not sure what this is. Just pass whatever
            is callable.
    """
    def inner(*args):
        print(f"Args received: {args}")
        return func(*args)
    return inner

@wrapper
def random_func(a, b):
    return a + b / a

class _VeryPrivateClass:
    def __init__(self) -> None:
        self._not_accessed = None

class ABC:
    def __init__(self) -> None:
        self.a = 5
    @property
    def some_param(self):
        return None
    def foo(self, a, b, *args, **kwargs) -> None:
        return None
    def __len__(self) -> int:
        return 0
    def __str__(self):
        return 'nothing'
