## falsePosition.m
This function uses [false position](https://en.wikipedia.org/wiki/False_position_method "Wikipedia page on false position") to estimate the root of a function. This is a numerical estimate.   
Within MATLAB *(or Octave)* this function can be called upon using `[root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)`.

### Inputs
* `func` - The evaluated function
* `xl` - The lower bound *(estimate)* of the root
* `xu` - The upper bound *(estimate)* of the root
* `es` - The desired relative error in percent *(default is 0.0001%)*
* `maxiter` - The max number of iterations preformed *(defualt is 200)*

### Outputs
* `root` - The estimated x value of the root
* `fx` - The function evaluated at the location of the root *(should be very close to zero)*
* `ea` - The approximate relative error in percentage
* `iter` - The number of iterations preformed


### Useful Knowledge
* `func` can either be a MATLAB symbolic expression or an anonymous function. `falsePosition` plays nicer with anonymous functions however.

### Limitations
`falsePosition` cannot determine the root of a function with more than one variable. As a numerical estimate it will not be as accurate as the built-in MATLAB functions `root` or `roots`. 