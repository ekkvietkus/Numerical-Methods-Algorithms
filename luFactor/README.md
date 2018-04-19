## luFactor.m
This function uses [LU decomposition](https://en.wikipedia.org/wiki/LU_decomposition "Wikipedia page on LU decomposition") to manipulate the `A` input matrix into an output `L` `U` and `P` matrices.  
Within MATLAB *(or Octave)* this function can be called upon using `[L,U,P] = luFactor(A)`.

### Inputs
* `A` - The input matrix

### Outputs
* `L` - The lower triangular matrix. Stores values used to modify the `A` matrix
* `U` - The upper triangular matrix. Is the final product of LU factorization
* `P` - The permutation matrix. Stores information on row pivoting


### Useful Knowledge
* The outputs should be useful in calculating the `x` matrix if you are solving the matrix equation `[A]*{x}={b}`.
* Using the outputs of this function can be checked using `[P]*[A]=[L]*[U]` *(this should be true)*.

### Limitations
The built-in MATLAB `lu` function will likely be more accurate and work in more cases. `luFactor` occasionally fails when it runs into very small numbers in the `A` or `L` matrices.