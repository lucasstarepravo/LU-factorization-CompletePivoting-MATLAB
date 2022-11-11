# Low-memory LU-factorization-CompletePivoting-MATLAB

This code performs low-memory LU factorization with complete pivoting

Gaussian weights and upper triangular matrix are both stored on the output matrix, while the permutation matrices are given in vector format.

Python and MATLAB versions are available. For the Python version, please go to corresponding repository

# Example
```ruby
# given a positive definite matrix A and a vector b which A*x=b

[A,P,Q] = lu_cp(A)
b = lt_solve(A,b,P)
b = ut_solve(A,b,Q)
```
