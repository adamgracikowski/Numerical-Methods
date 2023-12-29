# Project 2: The Eigenvalue Problem for Tridiagonal matrices

**This project is currently under development.**

This project is being implemented as a part of Numerical Methods 2 academic course.

## Table of Contents:
- [Objective of the project](#objective-of-the-project)
- [About the Implementation](#about-the-implementation)
- [More on the numerical methods used](#more-on-the-numerical-methods-used)
- [Numerical tests](#numerical-tests)
- [Presentation](#presentation)
- [Author](#author)
- [Contributing](#contributing)
- [Show your support](#show-your-support)

## Objective of the project:
The aim of the project was to implement a function which calculates [the condition number](https://en.wikipedia.org/wiki/Condition_number) of the [tridiagonal](https://en.wikipedia.org/wiki/Tridiagonal_matrix), [symmetric](https://en.wikipedia.org/wiki/Symmetric_matrix) and real matrix. The condition number is defined as the absolute value of the quotient of the eigenvalue returned by [the power method](https://en.wikipedia.org/wiki/Power_iteration) and the eigenvalue returned by [the inverse power method](https://en.wikipedia.org/wiki/Inverse_iteration). For the implementation of the inverse power method, [Householder's reflections](https://en.wikipedia.org/wiki/Householder_transformation) are being used.

The matrix is stored in vectors $x$ and $y$. Thanks to the memory-efficient storage of the matrix, computations for huge matrices (e.g. size of $200000$) are possible.

$$ cond(A) = \frac{|\lambda_{max}|}{|\lambda_{min}|} $$

## About the Implementation:

MATLAB was the imposed programming language for the implementation of the project.

## More on the numerical methods used:

To obtain the $\lambda_{max}$ the power method was implemented (`power3diag` function). The power method is a relatively slow eigenvalue algorithm, since for a general matrix $A$ the most time-consuming operation of the algorithm is the multiplication of matrix by a vector. Yet, in the case of tridiagonal matrices, the multiplication can be implemented in such a way, so as to have linear complexity.

To obtain $\lambda_{min}$ the inverse power method was implemented (`inverse3diag` function). The inverse iteration algorithm requires solving a linear system or calculating the inverse of the matrix. For non-structured matrices this requires $O(n^{3})$ operations. 
However, in the implementation of `inverse3diag` function, Householder's reflections are being used in order to transform the matrix to an upper-triangular form (`transform3diag` function). 

Householder's reflection is a linear transformation that describes a reflection about a plane or hyperplane containing the origin. It is used to annihilate the entries below the main diagonal of the matrix. 

<p align="center">
<img src="https://github.com/adamgracikowski/Numerical-Methods/blob/master/Project2/Images/householder_example.PNG" alt="householder_example" width="600"/>
</p>

The Householder matrix can be defined as follows:

$$H = I - 2 \cdot \frac{uu^*}{\||u\||^2} $$

where:
- $I$ is an identity matrix
- $u$ is a vector that is orthogonal to the hyperplane
- $u^*$ denotes conjugate transpose of $u$
- $\||u\||$ is the norm of the vector $u$.

## Numerical tests:
In the `Tests` folder numerous numerical tests can be found. 
Each test contains a detailed description.

## Presentation:
In the `Presentation` folder a file called `P2Z20_AGR` can be found.
As the academic course was conducted in Polish, all the contents of the presentation is sadly available only in Polish.

## Author:

My GitHub: [@adamgracikowski](https://github.com/adamgracikowski)

## Contributing:

All contributions, issues, and feature requests are welcome! 🤝

## Show your support:

Give a ⭐️ if you like this project and its documentation!
