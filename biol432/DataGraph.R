library(ggplot2)
MData=read.csv("Data//measurements_updated.csv")

for(i in 1:length(MData$Species)){
  if (MData$UnitsW[i] == "cm"){
    MData$Limb.Width[i] = MData$Limb.Width[i]*10
    MData$UnitsW[i] = "mm"
  }
  
  if (MData$UnitsL[i]== "cm"){
    MData$Limb.Length[i] = MData$Limb.Length[i]*10
    MData$UnitsL[i] = "mm"
  }
}

Graph<- ggplot(MData, aes(Limb.Width,Limb.Length)) +
  xlab("Limb Width (mm)")+
  ylab("Limb Length (mm)")+
  geom_point() +
  stat_summary(fun.data = mean_cl_normal) +
  geom_smooth(method = 'lm',colour="red",se=FALSE)
print(Graph)

ggsave("Graph.pdf", plot = Graph, device = "pdf", path = "Data//",
       scale = 1, width = 20, height = 20, units = "cm")
