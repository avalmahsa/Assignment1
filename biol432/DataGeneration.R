#Created a vector containing species names
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

#set seed to keep the generated numbers constant
#created vector containing random numbers from a normal distribution
set.seed(4997)
Limb.Width=abs(rnorm(10,mean=10,sd=10))

#set seed to keep the generated numbers constant
#created vector containing random numbers from a binomial distribution
set.seed(12597)
UnitsW=rbinom(10,1,0.5)

# loop to associate randomly generated numbers with "cm" or "mm"
for(i in 1:length(UnitsW)){
  if(UnitsW[i] == 1){
    UnitsW[i] = 'cm'
  }else{
    UnitsW[i] = 'mm'
  }
}

#section below, same as above, repeated for length
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

#combined all vectors into a matrix
tempMatrix=cbind(Species,Limb.Width,UnitsW,Limb.Length,UnitsL)
#created data frame from matrix
MyData=as.data.frame(tempMatrix)

#saved data
write.csv(MyData,"Data//measurements.csv",row.names=FALSE)

