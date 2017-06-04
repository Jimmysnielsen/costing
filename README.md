# costing
basic costing of a project using a 'linear' costing model.
This project was originally projected for costing of welding activities but can possibly be used for other activities as well.

there are two costing models
1. Quick & dirty: Uses the pipe specification and length of piping together with a basic price 'cost/meter'.
a 'scaling factor' is also used to factor in 'economies of scale' ie.
cost = f * L^n where f is a unit of cost [cost/meter], L is the length of piping [meter] and n is an exponential factor [no unit] on the order of (0;1]
note! a factor of n>1 might be possible for increasingly complex systems

2. MTO based (MTO = Material take of; or Made to order
this model will also factor in the number of individual components and their costs.

// initial version 4th of June, 2017 //
