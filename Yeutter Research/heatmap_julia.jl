using DataFrames
using CSV
using Plots
using PlotlyJS

data = CSV.read("Yeutter Research/yeutter_data.csv", DataFrame)

data.Value = parse.(Float64, data.Value)

# IMPORT AND GRAVITY (CROP = GRO)

imports_gvty = filter(row -> row.I_E == "import" && row.Model == "gvty" && row.Crop == "gro", data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=0.1, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Imports by State (Model: Gravity, Crop = Corn)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


# IMPORT AND SHARED (CROP = GRO)

imports_gvty = filter(row -> row.I_E == "import" && row.Model == "shrs" && row.Crop == "gro", data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=0.1, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Imports by State (Model: Shared, Crop = Corn)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


# IMPORT AND SHARED (CROP = GRO)

imports_gvty = filter(row -> row.I_E == "import" && row.Model == "shrs" && row.Crop == "gro", data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=0.1, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Imports by State (Model: Shared, Crop = Corn)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


# EXPORT AND GRAVITY (CROP = GRO)

imports_gvty = filter(row -> row.I_E == "export" && row.Model == "gvty" && row.Crop == "gro", data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=1, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Exports by State (Model: Gravity, Crop = Corn)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


# EXPORT AND SHARED (CROP = GRO)

imports_gvty = filter(row -> row.I_E == "export" && row.Model == "shrs" && row.Crop == "gro", data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=1, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Exports by State (Model: Shared, Crop = Corn)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


# EXPORT AND PORT (CROP = GRO)

imports_gvty = filter(row -> row.I_E == "export" && row.Model == "port" && row.Crop == "gro", data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=2, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Exports by State (Model: Port, Crop = Corn)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


# EXPORT AND GRAVITY (CROP = v_f)

imports_gvty = filter(row -> row.I_E == "export" && row.Model == "gvty" && row.Crop == "v_f", data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=1, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Exports by State (Model: Gravity, Crop = v_f)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


# EXPORT AND SHARED (CROP = v_f)

imports_gvty = filter(row -> row.I_E == "export" && row.Model == "shrs" && row.Crop == "v_f", data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=1, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Exports by State (Model: Shared, Crop = v_f)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


# EXPORT AND PORT (CROP = GRO)

imports_gvty = filter(row -> row.I_E == "export" && row.Model == "port" && row.Crop == "v_f", data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=2, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Exports by State (Model: Port, Crop = v_f)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


crop = "wht"
i_e = "export"

# ************************** IMPORT AND SHARED (CROP = v_f) **************************

export_shared = filter(row -> row.I_E == i_e && row.Model == "shrs" && row.Crop == crop, data)

total_value = sum(export_shared.Value)

average_value = total_value / 50

all_states = unique(data.State)
state_values = DataFrame(
    State = all_states,
    Value = fill(average_value, length(all_states))
)

fig = choropleth(state_values, 
                    locations=:State, 
                    locationmode="USA-states",
                    color=:Value, 
                    range_color=(0,2),
                    scope="usa",
                    title="Uniform Value Map for Exports (Model: SHRS, Crop = gro)",
                    colorscale="Viridis")

layout!(fig, width=800, height=600, geo=(bgcolor="rgba(0,0,0,0)"))

plot(fig)


# ************************** IMPORT AND GRAVITY (CROP = v_f) ************************** 

imports_gvty = filter(row -> row.I_E == i_e && row.Model == "gvty" && row.Crop == crop, data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=2, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Exports by State (Model: Gravity, Crop = wht)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


# ************************** IMPORT AND PORT (CROP = v_f) **************************

imports_gvty = filter(row -> row.I_E == i_e && row.Model == "port" && row.Crop == crop, data)

state_imports_gvty = by(imports_gvty, :State, Value = :Value => sum)

fig = choropleth(state_imports_gvty, 
                    locations=:State, 
                    locationmode="USA-states",
                    zmin=0, 
                    zmax=2, 
                    color=:Value, 
                    scope="usa",
                    title="Heatmap of Exports by State (Model: Port, Crop = gro)",
                    colorscale="Viridis")  

layout!(fig, width=800, height=600)

plot(fig)


# Normalize shared:

# take all of the exports / shared of production

crop = "wht"
i_e = "export"

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


