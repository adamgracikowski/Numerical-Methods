# Project 1: Numerical intergation

This project was implemented as a part of Numerical Methods 2 academic course.

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

The aim of the project was to implement a function which calculates the double integral of $f$ over area $D$, where $D = D_1 - D_2$ and $D_1 = [-1, 1] \times [-1, 1]$, $D_2 = {(x, y) \in R^2: |x| + |y| \leq 1}$ by dividing $D$ into $4n^2$ congruent triangles and applying a quadrature of the fourth order for each of the triangles.

<p align="center">
<img src="https://github.com/adamgracikowski/Numerical-Methods/blob/master/Project1/Images/division.PNG" alt="division" width="600"/>
</p>

## About the Implementation:

MATLAB was the imposed programming language for the implementation of the project.
The process of approximating the double integral over $D$ is performed by the function `P1Z28_AGR_int4n2`. The process of dividing the triangle into $n^2$ triangles is performed by the function `divideTriangleN2`. The functions was implemented in such a way so as to solve a general problem of dividing any triangle given by its vertices $p_0$, $p_1$, $p_2 \in R^2$.

In the process of the project evolution all other integration formulas, which were discussed during the lectures, were also implemented. 

## More on the numerical methods used:

The formula for the simple quadrature of the fourth order goes as follows:

$$ S_{swk}(f, T) = \frac{P}{60} \cdot \Big( 27f(p_{012}) + 3(f(p_0) + f(p_1) + f(p_2)) + 8(f(p_{01}) + f(p_{12}) + f(p_{02}))  \Big) $$

and the formula for the compound quadrature goes as follows:

$$ S_{swk}^{[n]}(f, T) = \sum_{i = 1}^{i = n^2} S_{swk}(f, t_i) $$

where:
- $T$ - triangle given by vertices $p_0$, $p_1$, $p_2 \in R^2$
- $P$ area of the triangle
- $p_{012}$ - centroid of the triangle
- $p_{01}$ - the middle of the side of the triangle
- $t_1, t_2, \dots, t_{n^2}$ - triangles obtained by dividing $T$ into congruent subtriangles 

Since the integration area $D$ consists of $4$ rectangular triangles, we can calculate vertices of $n^2$ subtriangles for one of the rectangular triangles and transform them using symmetry
with respect to the Y axis or the X axis.

<p align="center">
<img src="https://github.com/adamgracikowski/Numerical-Methods/blob/master/Project1/Images/analitical.PNG" alt="analitical" width="400"/>
</p>

## Numerical tests:

In the `Tests` folder numerous numerical tests can be found. Each test contains a detailed description. Running `test6` is highly encouraged since it can really help you visualise and understand a process of triangulation of the $D$ area.

## Presentation:

In the `Presentation` folder a file called `P1Z28_AGR`, which contains a further discussion on the topic of approximating double integrals over triangular area, can be found.
As the academic course was conducted in Polish, all the contents of the presentation is sadly available only in Polish.

## Author:

My GitHub: [@adamgracikowski](https://github.com/adamgracikowski)

## Contributing:

All contributions, issues, and feature requests are welcome! 🤝

## Show your support:

Give a ⭐️ if you like this project and its documentation!
