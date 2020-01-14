MData=read.csv("Data//measurements.csv")

#Using area instead of volume due to lack of dimensions
Limb.Area = 1:length(MData$Species)
UnitsA = 1:length(MData$Species)

for(i in 1:length(MData$Species)){
  width = MData$Limb.Width[i]
  length = MData$Limb.Length[i]
  
  if(MData$UnitsW[i] == "cm"){
    width = width*10
  }
  
  if(MData$UnitsL[i] == "cm"){
    length = length*10
  }
  
  Limb.Area[i] = length * width
  UnitsA[i] = "mm^2"
}

MData = as.data.frame(cbind(MData,Limb.Area,UnitsA))
