class EmptyDataError(Exception):
    """
    Exception when data is empty, and thus statistics cannot be computed.
    """


class SingleSampleError(Exception):
    """
    Exception raised when sample contains only one element, and thus sample
    variance is not defined.
    """
