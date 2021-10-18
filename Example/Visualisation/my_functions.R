library(RColorBrewer)
library(ggplot2)

categories = read.csv(
  'Example/Inputs/symptom_categories.csv'
)

my_colours = brewer.pal(n = 6, name = "Dark2")
names(my_colours) = levels(categories$category)
colour_scale = scale_colour_manual(
  name = 'category',
  values = my_colours)

colour_values = c(
  "Category 1" = my_colours[1],
  "Category 2" = my_colours[2],
  "Category 3" = my_colours[3],
  "Category 4" = my_colours[4]
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