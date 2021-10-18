library(ggpubr)
library(ggplot2)

deviance_results = read.csv('Example/Outputs/LPCA_deviance.csv')

deviance_df = data.frame(k = 1:10, explained_deviance = deviance_results$x)

marginal_bernoulli_deviance = diff(deviance_results$x)
marginal_bernoulli_deviance = append(deviance_results$x[1], marginal_bernoulli_deviance)

marginal_bernoulli_deviance_df = data.frame(k = 1:10, diff_explained_deviance = marginal_bernoulli_deviance)

p1 = ggplot(
  data = deviance_df,
  aes(x = k, y = explained_deviance)) + 
  geom_line() + 
  geom_point() + 
  xlab("Number of components") + 
  ylab("Proportion of bernoulli deviance explained") +
  ggtitle('a') + 
  geom_vline(aes(xintercept = 2.5, colour = 'red'), linetype = 'dashed') + 
  theme(legend.position = 'none')

p2 = ggplot(
  data = marginal_bernoulli_deviance_df,
  aes(x = k, y = diff_explained_deviance)) + 
  geom_line() + 
  geom_point() + 
  xlab("Component added") + 
  ylab("Proportion of bernoulli deviance explained by adding component") +
  ggtitle('b') + 
  geom_vline(aes(xintercept = 2.5, colour = 'red'), linetype = 'dashed') + 
  theme(legend.position = 'none')

out = ggarrange(p1, p2, common.legend = FALSE)

ggsave(plot = out, filename = 'Example/Figures/LPCA_model_selection.png')
