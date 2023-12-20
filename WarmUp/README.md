# Warm-up Project:

This project was implemented as a part of Numerical Methods 2 academic course.

## Table of Contents:

- [Objective of the project](#objective-of-the-project)
- [About the Implementation](#about-the-implementation)
- [More on the Bisection method](#more-on-bisection-method)
- [Author](#author)
- [Contributing](#contributing)
- [Show your support](#show-your-support)

## Objective of the project:

The aim of the warm-up project was to implement a function `nlin` which finds as many real roots of a continuous function \(f\) as possible. It is assumed, that \(f\) is a function of one variable and all its roots are simple. Complex roots are to be ignored by the algorithm used by `nlin`.

The number \(v\) is considered as a simple root of \(f\) if \(f\) changes sign in range \((v - 500d, v + 500d)\), where \(d = \epsilon\) when \(|v| < 1\), and \(d = |v|\epsilon\) when \(|v| >= 1\), and \(\epsilon = 2^{-52}\) is machine epsilon obtained using `eps` function.

Function `nlin` returns a horizontal vector containing all the roots found in the root-finding process.

Constraints:

- The project should be implemented using MATLAB.
- No MATLAB extensions or toolboxes can be used for a root-finding process.
- Functions such as `fzero` or `roots` are forbidden.

## About the Implementation

Since a general algorithm for finding all real roots of a continuous function \(f\) doesn't exist, the root-finding process is simplified to a bounded interval. The interval is divided into sub-interval using logarithmically chosen points of partition. On each subinterval for which the function changes sign, a vectorised [bisection method](#more-on-bisection-method) is applied.

Examples of `nlin` usage can be found in `examples.m` script.

## More on the Bisection method

[The Bisection method](https://en.wikipedia.org/wiki/Bisection_method) is a root-finding method that applies to any continuous function for which one knows two values with opposite signs. The method consists of repeatedly bisecting the interval defined by these values and then selecting the subinterval in which the function changes sign, and therefore must contain a root. It is a very simple and robust method, but it is also relatively slow. The method is also called the **interval halving method**, the **binary search method**, or the **dichotomy method**.

<p align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Bisection_method.svg/800px-Bisection_method.svg.png" alt="the Bisection method" />
</p>

## Author:

My GitHub: [@adamgracikowski](https://github.com/adamgracikowski)

## Contributing:

All contributions, issues, and feature requests are welcome! 🤝

## Show your support:

Give a ⭐️ if you like this project and its documentation!
