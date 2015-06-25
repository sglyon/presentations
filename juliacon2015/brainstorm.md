# Overall structure

1.  Overview (1 slide)
    - Intro
    - QuantEcon
    - Modern Economics
    - Examples
        + Models in QuantEcon
        + CompEcon
        + GMM (if time)
2. Bio (1 slide)
3. What is QuantEcon? (notebook **almost** done -- still need to figure out parts of library to show off in editor)
4. Modern economics from my perspective
    - Model features:
        + dynamic: today's choice impacts tomorrow's opportunities
        + stochastic: uncertainty, need to take expectations
        + general: model both supply/demand side of economy
        + recursive: value to agent of being in a particular state of the world today is function of _the agent's_ expected value tomorrow -- expectation over state tomorrow + controls chosen today
        + Constrained: Well of utility from frictionless models of unconstrained agents is nearly running dry. Adding frictions drastically increases both the model's ability to match real world data and computational difficulty
    - Both discrete time and continuous time frameworks are common
    - Common tools employed in published papers that feature computation:
        + Parameter estimation and inference (GMM, MCMC)
        + Function approximation and interpolation
        + Optimization
        + Simulation (to do sensitivity analysis and comparative statics post estimation/solving)
    - Algorithm characteristics
        + Iterative -- almost always searching for a fixed point (e.g. outer loop for prices, inner loop for VFI/PFI) or simulating (simulate solution, MCMC)
        + Discretize state space, then loop over points. Many states often requires many loops (this is where python is slow).
        + Three classes of solution method: projection, stochastic simulation, perturbation
    - What does this all mean?
        + Now, more than ever, economists are searching for and using cutting edge technology and software to do their work
        + Perfect storm of circumstance for collaboration between Julia and economics communities.
5. Examples
    - Much of my work has been building tools to help me solve my various models
    - With the time we have left, we'll go through some examples
        + Type system in QuantEcon.jl -- easy to define new models (TODO: re-visit this and implement it)
        + Function approximation: CompEcon.jl
        + GMM: MomentBasedEstimators.jl

## Potential examples

### Adding McCall (or other from Gianluca?)

- Something like the McCall writeup I did for IMF conf
- Would require me to implement AbstractModel/AbstractSolution types -- a pretty good idea if I have time

Pros:

- Interacts with QuantEcon.jl
- Super simple model -- can explain the whole thing and implementation in < 10 mins

Cons:

- Super simple model

### CompEcon

- Compare to MatLab code
- Show how type parameters clean up/simplify implementation
- Show off how multiple dispatch matters -- look specifically at the `Base.convert` methods vs `funbconv` as well as the `funeval` vs `funeval\d` methods.
    - I have two versions of the code. Can show maltab, then stuff in src/original/core.jl (funbconv, funbasex, ect), then show stuff in src

Pros:

- Fairly complicated example -- shows power of Julia
- Others _might_ know MatLab routines and like to see these ones

Cons:

- I'd need to comb through source and clean it up again


### MomentBasedEstimators

- Show the data side of econ programming
- Leverages community tools (`MathProgBase`)

Cons:

- Don't have ready made examples -- maybe stuff from Sydney?

###
