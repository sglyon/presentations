"""
Simple version of basic McCall search model. Implemented to plug in to
QuantEcon

@author : Spencer Lyon <spencer.lyon@stern.nyu.edu>
@date : 2014-12-03 14:29:44

"""
using QuantEcon, QuantEcon.Models

import QuantEcon.Models: bellman_operator, init_values

immutable McCallModel <: AbstractModel
    w::Vector        # vector of wages
    F::Vector        # probability of each w
    β::Real          # discount factor
    c::Real          # reservation wage
    v_accept::Vector # value of accepting at each wage

    # Constructor to fill in v_accpet.
    function McCallModel(w::Vector, F::Vector, β::Real, c::Real)
        new(w, F, β, c, w./(1 - β))
    end
end


function bellman_operator(m::McCallModel, v0)
    v_reject = m.c + m.β * sum(v0 .* m.F)
    max(m.v_accept, v_reject)  # optional return keyword
end

# one line function syntax. Parsed the same as the function ... end (not anon)
init_values(m::McCallModel) = fill(mean(m.w)/(1 - m.β), size(m.w, 1))

function main()
    # standard model
    w = linspace(0.1, 50.0, 5000)       # evenly spaced
    F = fill(1/size(w, 1), size(w, 1))  # uniform
    β = 0.95
    c = 10.0
    m = McCallModel(w, F, β, c)

    # solve via value function iteration
    solve_vf(m)
end
