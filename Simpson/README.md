
## Simpson.m
This function numerically integrates y with respect to x. This function uses numerical integration *(in this case Simpson's 1/3rd rule)* to calculate the integral. In some cases it will use Simpson's 1/3rd rule alongside a single application of the trapezoidal rule, **though it will warn the user when doing so**.  
Within MATLAB *(or Octave)* this function can be called upon using `I = Simpson(x,y)`.  
Note: Simpson.m must be within your path *(or working directory)* for this to work.

### Inputs
* `x` - A vector of the same size as y.
* `y` - A vector of the same size as x.

### Outputs
* `I` - The numerically calculated integral of y with respect to x.

### Useful Knowledge
* The `x` vector must be evenly spaced in order for this algorithm to work. 
* This function integrates **vectors**, not anonymous functions or symbolic ones. It is recommended to use the standard `integral` function for these. 

### Limitations
This function will not be as accurate as MATLAB's built in function `integral`, though it should be more accurate than the `trapz` function. Overall this function is not optimized well *(at all really)* and relies heavily on multiple if statements to determine what version of Simpson's 1/3rd rule to use. The function can also encounter errors if your `x` vector has very small spaces, and it cannot work at all if the `x` vector is not evenly spaced. 