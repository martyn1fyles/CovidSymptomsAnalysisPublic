library(RColorBrewer)
library(ggplot2)

categories = read.csv(
  'Data/Lookups/CategoriesLookup.csv'
)

my_colours = brewer.pal(n = 6, name = "Dark2")
names(my_colours) = levels(categories$category)
colour_scale = scale_colour_manual(
  name = 'category',
  values = my_colours)

colour_values = c(
  "Altered state"            = my_colours[1],
  "Gastrointestinal"         = my_colours[2],
  "Lower respiratory tract"  = my_colours[3],
  "Other"                    = my_colours[4],
  "Systemic"                 = my_colours[5],
  "Upper respiratory tract"  = my_colours[6]
)

colour_scale = scale_color_manual(
  values = colour_values
)

colour_fill = scale_fill_manual(
  values = colour_values
)

# Set the limit argument, which forces the legend to be created for all values
# not just the subset that is present on the graph
# This is useful when we arrange plots
colour_fill_all = scale_fill_manual(
  values = colour_values,
  limits = c(categories$category)
)

colour_scale_all = scale_color_manual(
  values = colour_values,
  limits = c(categories$category)
)