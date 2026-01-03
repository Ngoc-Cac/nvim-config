"""
This is the docstring of a template package.

# Markdown Title
This is supposed to describe the functionalities that
the package provides and how one should use them.

# More section that describes other stuff
Since this is only a template, I'm not going to do that.
I'm just typing a bunch of words so this becomes a docstring.
Here is a random enumeration:
1. I have no idea what this is.
2. This is the second item.
3. The third item.
4. Probably the last item.

Here is another list:
- This is a list of items.
- Second item.
- Third item.
- Fourth.

# Notes
What this package does for you:
- Nothing.
What this package does **NOT** do for you:
- Make you a cup of coffee.
- Chat with you.
"""

from .core import (
    mean as mean,
    rolling_mean as rolling_mean,
    variance as variance,
    z_score_normalize as z_score_normalize,
)
