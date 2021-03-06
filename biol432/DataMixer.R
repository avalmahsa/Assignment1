#imported data
MData=read.csv("Data//measurements.csv")

#Using area instead of volume due to lack of dimensions
Limb.Volume = 1:length(MData$Species)
UnitsV = 1:length(MData$Species)

#loop to convert units from "cm" to "mm" or keep the same if already in "mm"
for(i in 1:length(MData$Species)){
  width = MData$Limb.Width[i]
  length = MData$Limb.Length[i]
  
  if(MData$UnitsW[i] == "cm"){
    width = width*10
  }
  
  if(MData$UnitsL[i] == "cm"){
    length = length*10
  }
  
  #Treating limb as cylinder to calc volume
  
  radius = width/2
  
  Limb.Volume[i] = pi * radius^2 * length
    
  UnitsV[i] = "mm^3"
}

#added limb volume information to data frame 
MData = as.data.frame(cbind(MData,Limb.Volume,UnitsV))

#Save updated data frame
write.csv(MData,"Data//measurements_w_volume.csv",row.names=FALSE)

#Code for graph

library(ggplot2) #import ggplot library

#loop to convert measurements. "cm" values are converted to "mm"
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

#used ggplot to create a scatter plot for the relationship between width and length
#added labels and regression line. graph object saved for later use.
Graph<- ggplot(MData, aes(Limb.Width,Limb.Length)) +
  xlab("Limb Width (mm)")+
  ylab("Limb Length (mm)")+
  geom_point() +
  geom_smooth(method = 'lm',colour="red",se=FALSE)
print(Graph)

#graph saved as pdf with 20x20 dimensions
ggsave("Graph.pdf", plot = Graph, device = "pdf", path = "Data//",
       scale = 1, width = 20, height = 20, units = "cm")