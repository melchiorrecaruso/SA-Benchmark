# Simulated Annealing Benchmark

Simulated annealing (SA) is a method for solving unconstrained and bound-constrained optimization problems. The method models the physical process of heating a material and then slowly lowering the temperature to decrease defects, thus minimizing the system energy.

At each iteration of the simulated annealing algorithm, a new point is randomly generated. The distance of the new point from the current point, or the extent of the search, is based on a probability distribution with a scale proportional to the temperature. The algorithm accepts all new points that lower the objective, but also, with a certain probability, points that raise the objective. By accepting points that raise the objective, the algorithm avoids being trapped in local minima in early iterations and is able to explore globally for better solutions.

Here you ca find a simple SA implementation with Pascal language and an example of benchmark using Hölder table function.

![HölderTableFunction](/plot/plot.PNG "Hölder table function")

## LICENSE
[GNU General Public License v3.0](LICENSE)
