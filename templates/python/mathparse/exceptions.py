class OperatorException(Exception):
    """
    Exception throws when:
        - Operator token does not exist
        - Operation is not defined
    """

class OperandException(Exception):
    """
    Exception throws when:
        - Operand is not numeric.
        - There is too much or too little operands to work with.
        - Mismatched parenthesis in expression.
    """
