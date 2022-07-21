import numpy as np

import math
from scipy import linalg



def norm_of_columns(A, p=2):
    """Vector p-norm of each column of a matrix.

    Parameters
    ----------
    A : array_like
        Input matrix.
    p : int, optional
        p-th norm.

    Returns
    -------
    array_like
        p-norm of each column of A.
    """
    _, N = A.shape
    return np.asarray([linalg.norm(A[:, j], ord=p) for j in range(N)])

def coherence_of_columns(A):
    """Mutual coherence of columns of A.

    Parameters
    ----------
    A : array_like
        Input matrix.
    p : int, optional
        p-th norm.

    Returns
    -------
    array_like
        Mutual coherence of columns of A.
    """
    A = np.asmatrix(A)
    _, N = A.shape
    A = A * np.asmatrix(np.diag(1/norm_of_columns(A)))
    Gram_A = A.H*A
    for j in range(N):
        Gram_A[j, j] = 0
    return np.max(np.abs(Gram_A))


if __name__ == '__main__':
    import numpy as np
    from sklearn.preprocessing import normalize

    data = np.array([
        [-21, 1, 10],
        [0, 1, 1],
        [1, 2, 92], ])

    u = coherence_of_columns(data)
    print(u)
    # mcoh(A)
