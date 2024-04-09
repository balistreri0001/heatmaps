using DataFrames
using CSV
using Plots
using PlotlyJS

data = CSV.read("Yeutter Research/yeutter_data.csv", DataFrame)

data.Value = [tryparse(Float64, val) === nothing ? NaN : parse(Float64, val) for val in data.Value]

# ###############IMPORT AND GRAVITY (CROP = GRO)######################

# Filter data for imports, gravity model, and specific crop
imports_gvty = filter(row -> row.I_E == "import" && row.Model == "gvty" && row.Crop == "gro", data)

# Group by state and sum values
state_imports_gvty = combine(groupby(imports_gvty, :State), :Value => sum => :Value)

# Ensure state codes are strings for PlotlyJS
state_imports_gvty[!, :State] = string.(state_imports_gvty[!, :State])

# Create the choropleth trace
trace = choropleth(
    locations=state_imports_gvty.State,
    z=state_imports_gvty.Value,
    locationmode="USA-states",
    colorscale="Viridis",
    zmin=0,
    zmax=0.1,
    colorbar_title = "Value"
)

# Define the layout
layout = Layout(
    title="Heatmap of Imports by State (Model: Gravity, Crop = Corn)",
    width=800,
    height=600,
    geo=attr(
        scope="usa",  # Ensure the map is focused on the USA
        countrywidth=1,
        subunitwidth=1
    )
)

# Create and display the figure using PlotlyJS explicitly
fig = PlotlyJS.plot(trace, layout)

# To display the plot, depending on your environment, you might directly use `fig` or you might need to use `display(fig)`.
display(fig)

# ###########################


#= 

# ************************** SHARED MODEL **************************
export_shared = filter(row -> row.I_E == i_e && row.Model == "shrs" && row.Crop == crop, data)
total_value = sum(export_shared.Value)
average_value = 1

all_states = unique(data.State)
state_values = DataFrame(
    State = all_states,
    Value = fill(average_value, length(all_states))
)

# Create the choropleth map using the uniform value
fig = choropleth(state_values, 
                    locations=:State, 
                    locationmode="USA-states",
                    color=:Value, 
                    range_color=(0,2),
                    scope="usa",
                    title="Uniform Value Map for Exports (Model: SHRS, Crop = wht)",
                    colorscale="Viridis")

layout!(fig, width=800, height=600, geo=(bgcolor="rgba(0,0,0,0)"))

plot(fig)


# ************************** GRAVITY AND PORT MODEL PERCENTAGES **************************
gravity_exports = filter(row -> row.I_E == i_e && row.Model == "gvty" && row.Crop == crop, data)
port_exports = filter(row -> row.I_E == i_e && row.Model == "port" && row.Crop == crop, data)

gravity_exports.Gravity_Percentage = (gravity_exports.Value ./ average_value) .* 100
port_exports.Port_Percentage = (port_exports.Value ./ average_value) .* 100

# ************************** VISUALIZATION **************************
fig_gravity = choropleth(gravity_exports, 
                            locations=:State, 
                            locationmode="USA-states",
                            color=:Gravity_Percentage, 
                            range_color=[0, 400],
                            scope="usa",
                            title="Gravity Model as Percentage of Shared Model by State",
                            colorscale="Viridis")

fig_port = choropleth(port_exports, 
                         locations=:State, 
                         locationmode="USA-states",
                         color=:Port_Percentage, 
                         range_color=[0, 1200],
                         scope="usa",
                         title="Port Model as Percentage of Shared Model by State",
                         colorscale="Viridis")

layout!(fig_gravity, width=800, height=600)
layout!(fig_port, width=800, height=600)

plot(fig_gravity), plot(fig_port)


 =#