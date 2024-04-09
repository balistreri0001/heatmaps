import pandas as pd
import plotly.express as px

data = pd.read_csv('yeutter_data.csv')

data['Value'] = pd.to_numeric(data['Value'], errors='coerce')




# IMPORT AND GRAVITY (CROP = GRO)


imports_gvty = data[(data['I_E'] == 'import') & (data['Model'] == 'gvty') & (data['Crop'] == 'gro')]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 0.1), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Imports by State (Model: Gravity, Crop = Corn)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()

# IMPORT AND SHARED (CROP = GRO)

imports_gvty = data[(data['I_E'] == 'import') & (data['Model'] == 'shrs') & (data['Crop'] == 'gro')]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 0.1), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Imports by State (Model: Shared, Crop = Corn)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()


# IMPORT AND SHARED (CROP = GRO)

imports_gvty = data[(data['I_E'] == 'import') & (data['Model'] == 'shrs') & (data['Crop'] == 'gro')]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 0.1), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Imports by State (Model: Shared, Crop = Corn)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()



# EXPORT AND GRAVITY (CROP = GRO)


imports_gvty = data[(data['I_E'] == 'export') & (data['Model'] == 'gvty') & (data['Crop'] == 'gro')]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 1), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Exports by State (Model: Gravity, Crop = Corn)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()

# EXPORT AND SHARED (CROP = GRO)


imports_gvty = data[(data['I_E'] == 'export') & (data['Model'] == 'shrs') & (data['Crop'] == 'gro')]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 1), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Exports by State (Model: Shared, Crop = Corn)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()

# EXPORT AND PORT (CROP = GRO)


imports_gvty = data[(data['I_E'] == 'export') & (data['Model'] == 'port') & (data['Crop'] == 'gro')]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 2), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Exports by State (Model: Port, Crop = Corn)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()



# EXPORT AND GRAVITY (CROP = v_f)


imports_gvty = data[(data['I_E'] == 'export') & (data['Model'] == 'gvty') & (data['Crop'] == 'v_f')]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 1), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Exports by State (Model: Gravity, Crop = v_f)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()

# EXPORT AND SHARED (CROP = v_f)


imports_gvty = data[(data['I_E'] == 'export') & (data['Model'] == 'shrs') & (data['Crop'] == 'v_f')]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 1), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Exports by State (Model: Shared, Crop = v_f)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()

# EXPORT AND PORT (CROP = GRO)


imports_gvty = data[(data['I_E'] == 'export') & (data['Model'] == 'port') & (data['Crop'] == 'v_f')]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 2), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Exports by State (Model: Port, Crop = v_f)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()



crop = 'wht'
i_e = 'export'

# ************************** IMPORT AND SHARED (CROP = v_f) **************************

export_shared = data[(data['I_E'] == i_e) & (data['Model'] == 'shrs') & (data['Crop'] == crop)]

# Sum all the values for the filtered data
total_value = export_shared['Value'].sum()

# Divide the total sum by 50 to get the average value per state
average_value = total_value / 50

# Create a DataFrame for plotting that assigns the average value to all states
# Assuming the original data has a 'State' column with state codes as unique identifiers
all_states = pd.unique(data['State'])
state_values = pd.DataFrame({
    'State': all_states,
    'Value': [average_value] * len(all_states)
})

# Create the choropleth map using the uniform value
fig = px.choropleth(data_frame=state_values, 
                    locations='State', 
                    locationmode="USA-states",
                    color='Value', 
                    range_color=(0,2),
                    scope="usa",
                    title='Uniform Value Map for Exports (Model: SHRS, Crop = gro)',
                    color_continuous_scale="Viridis")

fig.update_layout(
    width=800,  
    height=600,
    geo=dict(bgcolor= 'rgba(0,0,0,0)')
)

fig.show()

# ************************** IMPORT AND GRAVITY (CROP = v_f) ************************** 


imports_gvty = data[(data['I_E'] == i_e) & (data['Model'] == 'gvty') & (data['Crop'] == crop)]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 2), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Exports by State (Model: Gravity, Crop = wht)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()

# ************************** IMPORT AND PORT (CROP = v_f) **************************


imports_gvty = data[(data['I_E'] == i_e) & (data['Model'] == 'port') & (data['Crop'] == crop)]

state_imports_gvty = imports_gvty.groupby('State')['Value'].sum().reset_index()

fig = px.choropleth(data_frame=state_imports_gvty, 
                    locations='State', 
                    locationmode="USA-states",
                    range_color=(0, 2), 
                    color='Value', 
                    scope="usa",
                    title='Heatmap of Exports by State (Model: Port, Crop = gro)',
                    color_continuous_scale="Viridis")  

fig.update_layout(
    width=800,  
    height=600  
)

fig.show()


#Normalize shared:

# take all of the exports / shared of production


import pandas as pd
import plotly.express as px

crop = 'wht'
i_e = 'export'

# ************************** SHARED MODEL **************************
export_shared = data[(data['I_E'] == i_e) & (data['Model'] == 'shrs') & (data['Crop'] == crop)]
total_value = export_shared['Value'].sum()
# average_value = total_value / export_shared.shape[0]
average_value = 1

all_states = pd.unique(data['State'])
state_values = pd.DataFrame({
    'State': all_states,
    'Value': [average_value] * len(all_states)
})

# Create the choropleth map using the uniform value
fig = px.choropleth(data_frame=state_values, 
                    locations='State', 
                    locationmode="USA-states",
                    color='Value', 
                    range_color=(0,2),
                    scope="usa",
                    title='Uniform Value Map for Exports (Model: SHRS, Crop = wht)',
                    color_continuous_scale="Viridis")

fig.update_layout(
    width=800,  
    height=600,
    geo=dict(bgcolor= 'rgba(0,0,0,0)')
)

fig.show()


# ************************** GRAVITY AND PORT MODEL PERCENTAGES **************************
gravity_exports = data[(data['I_E'] == i_e) & (data['Model'] == 'gvty') & (data['Crop'] == crop)].copy()
port_exports = data[(data['I_E'] == i_e) & (data['Model'] == 'port') & (data['Crop'] == crop)].copy()

# Calculate percentages relative to the average shared value
gravity_exports['Gravity_Percentage'] = (gravity_exports['Value'] / average_value) * 100
port_exports['Port_Percentage'] = (port_exports['Value'] / average_value) * 100

# ************************** VISUALIZATION **************************
fig_gravity = px.choropleth(gravity_exports, 
                            locations='State', 
                            locationmode="USA-states",
                            color='Gravity_Percentage', 
                            range_color=[0, 400],
                            scope="usa",
                            title='Gravity Model as Percentage of Shared Model by State',
                            color_continuous_scale="Viridis")

fig_port = px.choropleth(port_exports, 
                         locations='State', 
                         locationmode="USA-states",
                         color='Port_Percentage', 
                         range_color=[0, 1200],
                         scope="usa",
                         title='Port Model as Percentage of Shared Model by State',
                         color_continuous_scale="Viridis")

fig_gravity.update_layout(width=800, height=600)
fig_port.update_layout(width=800, height=600)

fig_gravity.show(), fig_port.show()





# Less than (100): States value for the specific model is lower than the average shared value (i.e => 75.32 = 75.32% of average value)
# Equal to (100): States value for the specific model is equal to the average shared value
# Greater than (100): States value for the specific model is greater than average shared value (i.e => 1234 = 12.34 times higher than average)



