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

data(df_county_demographics)
county_values = df_county_demographics[df_county_demographics$region == 
                29189, c("percent_white", "percent_black")]
                                     
library(choroplethrZip)
data("df_zip_demographics")
zip_values = df_zip_demographics[df_zip_demographics$region == "63135", 
                c("percent_white", "percent_black")]

# now create a single data.frame for the values

df = data.frame(
  region = c("state", "state", "county", "county", "zip", "zip"), 
  metric = c("percent_white", "percent_black"), 
  percent = c(state_values[1, "percent_white"], 
              state_values[1, "percent_black"], 
              county_values[1, "percent_white"],
              county_values[1, "percent_black"],
              zip_values[1, "percent_white"], 
              zip_values[1, "percent_black"]))
# plot

library(ggplot2)
ggplot(df, aes(region, percent,fill = metric)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Demographics of the State, County and ZCTA\n of Fergusson, 
          Missouri")
