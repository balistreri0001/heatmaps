using CSV
using DataFrames
using PlotlyJS

# Load the data
data = CSV.read("yeutter_data.csv", DataFrame)

# Convert the 'Value' column to numeric, ignoring errors
data.Value = parse.(Float64, replace(data.Value, "NA" => "NaN"), errors=:keep)

# Define a function to generate a heatmap for given conditions
function generate_heatmap(data, import_export, model, crop, title)
    # Filter the data
    filtered_data = filter(row -> row.I_E == import_export && row.Model == model && row.Crop == crop, data)
    
    # Group by state and sum values
    state_imports = combine(groupby(filtered_data, :State), :Value => sum => :Value)
    
    # Generate the heatmap
    trace = choropleth(;locations=state_imports.State, z=state_imports.Value, locationmode="USA-states", colorscale="Viridis", colorbar_title="Value")
    layout = Layout(;title=title, geo=attr(;scope="usa", lataxis=attr(;range=[30, 50]), lonaxis=attr(;range=[-125, -65])))
    plot(trace, layout)
end

# Generate heatmaps for different conditions
generate_heatmap(data, "import", "gvty", "gro", "Heatmap of Imports by State (Model: Gravity, Crop = Corn)")
generate_heatmap(data, "import", "shrs", "gro", "Heatmap of Imports by State (Model: Shared, Crop = Corn)")
