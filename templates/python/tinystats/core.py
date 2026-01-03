import numpy as np

from .excpetions import EmptyDataError, SingleSampleError

from numpy.typing import NDArray
from typing import Literal, Sequence


def mean(
    data: Sequence[int | float] | NDArray,
    mean_type: Literal['arithmetic', 'geometric', 'harmonic'] = 'arithmetic',
    *,
    axis: int | None = None
) -> float:
    """
    Compute the mean for the sample `data`.

    :param data: The sample/population to compute the mean of.
    :type: Sequence[int | float] or NDArray
    :param mean_type: The type of average to compute. Choose from
        `'arithmetic'`, `'geometric'` `'harmonic'`.
    :type: Literal['arithmetic', 'geometric', 'harmonic']
    :param axis: The axis along which to compute the mean. If not given,
        this will compute across all axis.
    :type: int or None
    :return: The computed mean.
    :rtype: float
    """
    if not len(data):
        raise EmptyDataError("Cannot compute mean of an empty sample!")
    elif isinstance(data, Sequence):
        data = np.array(data)

    if mean_type == 'arithmetic':
        return data.sum(axis=axis) / len(data)
        # more stuff
        # over here
    elif mean_type == 'geometric':
        return data.prod(axis=axis) ** (1 / len(data))
    elif mean_type == 'harmonic':
        return len(data) / (1 / data).sum(axis=axis)
    else:
        raise ValueError(
            "mean_type must be one of 'arithmetic', "
            "'geometric' or 'harmonic'"
        )


def variance(
    data: Sequence[int | float] | NDArray,
    is_sample: bool = False,
    *,
    axis: int | None = None
) -> float:
    """
    Compute the variance for the sample/population `data`.

    :param data: The sample/population to compute the variance of.
    :type: Sequence[int | float] or NDArray
    :param is_sample: Whether this is a population/sample variance. This
        affects the degree of freedom of the statistics.
    :type: bool
    :param axis: The axis along which to compute the variance.
        If not given, this will compute across all axis.
    :type: int or None
    :return: The computed variance.
    :rtype: float
    """
    if not len(data):
        raise ValueError("Cannot compute variance of empty sample!")
    elif is_sample and len(data) == 1:
        raise SingleSampleError(
            "Cannot compute sample variance for "
            "sample of only one element!"
        )
    elif isinstance(data, Sequence):
        data = np.array(data)

    deg_of_free = (len(data) - 1) if is_sample else len(data)
    mu = mean(data, 'arithmetic', axis=axis)
    return ((data - mu) ** 2).sum(axis=axis) / deg_of_free


def z_score_normalize(
    data: Sequence[int | float] | NDArray,
    is_sample: bool = False
) -> NDArray:
    """
    Normalize the `data` using z-score normalization.

    :param data: The sample/population to normalize.
    :type: Sequence[int | float] or NDArray
    :param is_sample: Whether `data` is a sample. This
        affects the degree of freedom of the variance used.
    :type: bool
    :param axis: The axis along which to compute the variance.
        If not given, this will compute across all axis.
    :type: int or None
    :return: The computed variance.
    :rtype: float
    """
    if not len(data):
        raise ValueError("Cannot compute variance of empty sample!")
    elif is_sample and len(data) == 1:
        raise SingleSampleError(
            "Cannot compute sample variance for "
            "sample of only one element!"
        )
    elif isinstance(data, Sequence):
        data = np.array(data)

    mu, sig = mean(data), variance(data, is_sample)
    return (data - mu) / (sig) ** (1 / 2)


def rolling_mean(
    data: Sequence[int | float] | NDArray,
    win_size: int,
    *,
    axis: int | None = None
) -> NDArray:
    if not len(data):
        raise EmptyDataError("Cannot compute mean of an empty sample!")
    elif isinstance(data, Sequence):
        data = np.array(data)
    if not isinstance(win_size, int):
        raise TypeError("Invalid type for win_size, please specify a positive integer.")
    elif win_size <= 0:
        raise ValueError("win_size should be a positive integer.")

    data = np.lib.stride_tricks.sliding_window_view(
        data, win_size, axis=axis
    )
    return data.sum(axis=-1) / data.shape[-1]
