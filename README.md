# Simulated Annealing Benchmark

Simulated annealing (SA) is a probabilistic technique for approximating the global optimum of a given function.
The method models the physical process of heating a material and then slowly lowering the temperature to decrease defects, thus minimizing the system energy.

At each iteration of the simulated annealing algorithm, a new point is randomly generated. The distance of the new point from the current point, or the extent of the search, is based on a probability distribution with a scale proportional to the temperature. The algorithm accepts all new points that lower the objective, but also, with a certain probability, points that raise the objective. By accepting points that raise the objective, the algorithm avoids being trapped in local minima, and is able to explore globally for more possible solutions. An annealing schedule is selected to systematically decrease the temperature as the algorithm proceeds. As the temperature decreases, the algorithm reduces the extent of its search to converge to a minimum.

Here you ca find a simple SA implementation with Pascal language and an example of benchmark using Hölder table function.

![HölderTableFunction](/plot/plot.PNG "Hölder table function")

## LICENSE
[GNU General Public License v3.0](LICENSE)
