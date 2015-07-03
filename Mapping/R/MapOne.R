library(choroplethr)
data(df_pop_state)
head(df_pop_state)
?df_pop_state
state_choropleth(df_pop_state)
data(df_state_demographics)
colnames(df_state_demographics)
df_state_demographics$value = df_state_demographics$per_capita_income

state_choropleth(df_state_demographics)
head(df_state_demographics)
df_state_demographics$value = df_state_demographics$percent_black
state_choropleth(df_state_demographics, title = "Percent Black")
#------------------------
# Extract state data
data("df_state_demographics")
state_values = df_state_demographics[df_state_demographics$region == "missouri", 
                                     c("percent_white", "percent_black")]

data(df_country_demographics)
country_values = df_country_demographics[df_country_demographics$region == 
                29189, c("percent_white", "percent_black")]
                                     
library(ch)