import numpy as np
import tinystats

from tinystats import z_score_normalize


data = np.random.randint(1, 6, (100,))
normalized = z_score_normalize(data, True)

print(f"""
Range: {data.min()}, {data.max()}
Mean: {tinystats.mean(data)}
Variance: {tinystats.variance(data, is_sample=True)}

Normalized Range: {normalized.min()}, {normalized.max()}
""")

# This is a really long comment that spans
# multiple lines.
# more words more words more words.
# NOTE: This will throw error 
tinystats.mean(None)
