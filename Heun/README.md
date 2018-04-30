## Heun.m
This function numerically solves a given differential equation over a specified domain. This function uses [Heun's Method](https://en.wikipedia.org/wiki/Heun%27s_method "Wikipedia page on Heun's method"). Smaller `h` values will make it more accurate.
Within MATLAB *(or Octave)* this function can be called upon using `[t,y] = Heun(dydt,tspan,y0,h,es,maxit)`.  
Note: Heun.m must be within your path *(or working directory)* for this to work.

### Inputs
* `dydt` - The differential equation input.
* `tspan` - A span of values the differential equation will be evaluated over.
* `y0` - The initial condition
* `h` - The step size.
* `es` -  The stopping error value. *(Defaults to .001)*
* `maxit` - The maximum number of iteration that will be used. *(Defaults to 50)*

### Outputs
* `t` - The t vector output.
* `y` - The y vector output. 

### Useful Knowledge
* The `dydt` equation input works best using **anonymous functions** instead of MATLAB's smbolic equation toolbox. These look like: `dydt = @(x,y) -y + x^2`
* The `tspan` input should be done using a vector such as: `[(starting number) (stopping number)]`
* The `y0` input should be the y value at the first value in your `tspan`.
* `tspan` does not have to be perfectly divisible by `h`. The function can account for this. 

### Limitations
This function will not be as accurate as MATLAB's built in function `ode45` and other MATLAB differential equation solvers. `h` values under about 0.05 make it throw up.