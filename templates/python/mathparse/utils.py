def is_numeric(string: str) -> bool:
    """
    Check whether the given string can be casted
    as a number.

    :param string: The string to check.
    :type string: str
    :return: Whether or not the given string can be casted.
    :rtype: bool
    """
    try:
        float(string)
    except (ValueError, TypeError):
        return False
    return True
