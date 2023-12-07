
library(tidyverse)
library(readxl)
library(gt)
library(usmap)

library(knitr)
library(kableExtra)
library(ggplot2)
library(ggpubr)
library(stringr)
library(tidyr)
library(gridExtra)
library(pander)

setwd("G:\\DRIVE\\ECON 101")
df<-read_excel("State Prod Analysis.xlsx", sheet = "data")
class(df)
df2<-as.data.frame(df)

df2<-df %>% filter(Year==2019) %>% select(state,Year,Value)
head(df2)
typeof(df2)
class(df2)
str(df2)


plot_usmap(data=df2,values = "Value",   labels=TRUE)+
  labs(fill = 'Percent Change (2019)', title = "State Labor Productivity", subtitle="Source:BLS Office of Productivity and Technology") + 
  scale_fill_gradientn(colours=rev(heat.colors(8)),na.value="grey90",
                       guide = guide_colourbar(barwidth = 25, barheight = 0.4,
                                               #put legend title on top of legend
                                               title.position = "top")) +
    theme(legend.position = "bottom",
        legend.title=element_text(size=10), 
        legend.text=element_text(size=8))+
  theme(plot.title = element_text(size = 20, face = "bold"))



plot_usmap( data = df2, values = "Value",   labels=TRUE,include = c("CA", "NV", "ID", "OR", "WA")) + 
  labs(title = "State Labor Productivity West Coast in 2019") + 
  scale_fill_continuous( low = "Red", high = "blue", 
                         name = "Labor Productivity", label = scales::comma
  ) + 
  theme(legend.position = "right")+
  theme(plot.title = element_text(size = 14, face = "bold"))


df3<-df %>% filter(Year==2018) %>% select(state,Year,Value)
plot_usmap(data=df3,values = "Value",   labels=TRUE)+
  labs(fill = 'Percent Change (2018)', title = "State Labor Productivity 2017-2018", subtitle="Source:BLS Office of Productivity and Technology") + 
  scale_fill_gradientn(colours=rev(heat.colors(8)),na.value="grey90",
                       guide = guide_colourbar(barwidth = 25, barheight = 0.4,
                                               #put legend title on top of legend
                                               title.position = "top")) +
  theme(legend.position = "bottom",
        legend.title=element_text(size=10), 
        legend.text=element_text(size=8))+
  theme(plot.title = element_text(size = 20, face = "bold"))
