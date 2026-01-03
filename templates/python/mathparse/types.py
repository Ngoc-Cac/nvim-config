from typing import (
    Callable,
    TypeAlias,
    Union
)

NumericType: TypeAlias = Union[int, float]
SingleVarFunctionType: TypeAlias = Callable[[NumericType], NumericType]
NVarFunctionType = Callable[[*list[NumericType]], NumericType]
