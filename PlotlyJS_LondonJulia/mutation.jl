using PlotlyJS

trace1 = scatter(;x=collect(1:4), y=[0, 2, 3, 5], marker_color="blue")
trace2 = scatter(;x=collect(1:4), y=[3, 5, 1, 7], marker_color="red")
p = plot([trace1, trace2], Layout(height=500, width=650))
display(p)

# second trace will turn pink
restyle!(p, 2; marker_color="magenta");

# watch both markers change to squares
restyle!(p, [1, 2]; marker_symbol="square");

# simpler method without passing [1,2]
restyle!(p; marker_symbol="star-triangle-up-open");

relayout!(p; xaxis_range=(1, 10))

relayout!(p; title="Interactively controlled!")

trace3 = scatter(;x=1:4, y=rand(1:10, 4))
addtraces!(p, trace3)

# Add another trace in front of the new one we just created
trace4 = scatter(;x=1:4, y=rand(1:10, 4), marker_color="yellow")
addtraces!(p, 3, trace4)

deletetraces!(p, 4)

deletetraces!(p, 3)  # back to where we started :)

# let's add some points to the end of the second trace
extendtraces!(p, 2; x=Vector[collect(5:9)], y=Vector[rand(1:10, 5)])

# and to the beginning of the first trace (notice it doesn't start at 0 anymore)
# we need to reset the x with a call to restyle! because things get wonky
# when when go [5, 6, 7, 8, 9, 1, 2, 3, 4] :)
prependtraces!(p, 1; y=Vector[rand(1:10, 5)])
restyle!(p, 1, x=AbstractVector[1:9])

# notice the changes we saw, are applied on the Julia `Plot` object too
PlotlyJS.json(p.plot.layout, 2) |> print
PlotlyJS.json(p.plot.data[1], 2) |> print

# also a non-mutating version. notice our current plot doesn't change
p2 = relayout(p; xaxis_title="new title")

# display this one and notice the changes we made (triangles, title, etc)
# are applied
display(p2)
