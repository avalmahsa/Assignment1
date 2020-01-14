Species=c("Myotragus balearicus",
          "Ursus spelaeus",
          "Homotherium sp",
          "Cygnus falconeri",
          "Theriosuchus sympiestodon",
          "Eurazhdarcho langendorfensis",
          "Bos primigenius",
          "Prolagus sardus",
          "Pinguinus impennis",
          "Romanogobio antipai")

set.seed(4997)
Limb.Width=abs(rnorm(10,mean=10,sd=10))

set.seed(12597)
UnitsW=rbinom(10,1,0.5)

for(i in 1:length(UnitsW)){
  if(UnitsW[i] == 1){
    UnitsW[i] = 'cm'
  }else{
    UnitsW[i] = 'mm'
  }
}

set.seed(4998)
Limb.Length=abs(rnorm(10,mean=100,sd=100))

set.seed(12598)
UnitsL=rbinom(10,1,0.5)

for(i in 1:length(UnitsL)){
  if(UnitsL[i] == 1){
    UnitsL[i] = 'cm'
  }else{
    UnitsL[i] = 'mm'
  }
}

tempMatrix=cbind(Species,Limb.Width,UnitsW,Limb.Length,UnitsL)
MyData=as.data.frame(tempMatrix)

write.csv(MyData,"Data//measurements.csv",row.names=FALSE)

