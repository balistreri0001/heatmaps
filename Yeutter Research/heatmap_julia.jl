begin
    import Pkg
    Pkg.add(; name = "Kaleido_jll", version = "0.1")
end
using DataFrames
using CSV
using Plots
using PlotlyJS
using PlotlyBase
using FileIO
using PlotlyLight

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

# Combine trace and layout into a plot
p = PlotlyJS.plot(trace, layout)

save("myplot.png", p)


# ************************** SHARED MODEL **************************
# Assuming 'i_e', 'crop', and 'data' are predefined correctly
crop = "wht"
i_e = "import"

export_shared = filter(row -> row.I_E == i_e && row.Model == "shrs" && row.Crop == crop, data)
total_value = sum(export_shared.Value)
average_value = 1.0

all_states = unique(data.State)
state_values = DataFrame(
    State = all_states,
    Value = fill(average_value, length(all_states))
)

# Ensure state codes are strings for PlotlyJS
state_values[!, :State] = string.(state_values[!, :State])

# Create the choropleth map
trace = choropleth(
    locations=state_values.State,
    z=state_values.Value,
    locationmode="USA-states",
    colorscale="Viridis",
    zmin=0,
    zmax=2,
    colorbar_title="Value"
)

# Define the layout
layout = Layout(
    title="Uniform Value Map for Exports (Model: SHRS, Crop = $crop)",
    width=800,
    height=600,
    geo=attr(scope="usa", bgcolor="rgba(0,0,0,0)")
)

# Combine trace and layout
fig = PlotlyJS.plot(trace, layout)
# display(fig)



# ************************** GRAVITY AND PORT MODEL PERCENTAGES **************************

# Filter data
gravity_exports = filter(row -> row.I_E == i_e && row.Model == "gvty" && row.Crop == crop, data)
port_exports = filter(row -> row.I_E == i_e && row.Model == "port" && row.Crop == crop, data)

# Calculate percentages
gravity_exports.Gravity_Percentage = (gravity_exports.Value ./ average_value) .* 100
port_exports.Port_Percentage = (port_exports.Value ./ average_value) .* 100

# Ensure state codes are strings
gravity_exports[!, :State] = string.(gravity_exports[!, :State])
port_exports[!, :State] = string.(port_exports[!, :State])

# Gravity Model Visualization
trace_gravity = choropleth(
    locations=gravity_exports.State,
    z=gravity_exports.Gravity_Percentage,
    locationmode="USA-states",
    colorscale="Viridis",
    zmin=0,
    zmax=400,
    colorbar_title="Gravity Percentage"
)
layout_gravity = Layout(
    title="Gravity Model as Percentage of Shared Model by State (Crop = $crop)",
    width=800,
    height=600,
    geo=attr(scope="usa")
)
fig_gravity = PlotlyJS.plot(trace_gravity, layout_gravity)
# display(fig_gravity)

# Combine trace and layout into a plot
gravity_percent = PlotlyJS.plot(trace_gravity, layout_gravity)

save("Gravity_Percent.png", gravity_percent)


# Port Model Visualization
trace_port = choropleth(
    locations=port_exports.State,
    z=port_exports.Port_Percentage,
    locationmode="USA-states",
    colorscale="Viridis",
    zmin=0,
    zmax=1200,
    colorbar_title="Port Percentage"
)
layout_port = Layout(
    title="Port Model as Percentage of Shared Model by State (Crop = $crop)",
    width=800,
    height=600,
    geo=attr(scope="usa")
)
fig_port = PlotlyJS.plot(trace_port, layout_port)
# display(fig_port)

# Combine trace and layout into a plot
port_percent = PlotlyJS.plot(trace_port, layout_port)

save("Port_Percent.png", port_percent)


 