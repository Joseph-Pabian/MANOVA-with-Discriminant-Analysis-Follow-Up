library(foreign)
library(psych)
library(candisc)
tutoring_data<-read.spss("/Users/josephpabian/Downloads/tutoring data.sav", to.data.frame=TRUE,use.value.labels=FALSE)

attach(tutoring_data)
y<-cbind(Reading,Grammar,Writing)

tutoring.manova<-manova(y~as.factor(Method))
summary(tutoring.manova, test=c("Pillai"))

tapply(Reading,Method,mean)
tapply(Grammar,Method,mean)
tapply(Writing,Method,mean)


PL <- summary(tutoring.manova)$stats[3] 

EtaSquaredPL <- function(PL, p, j, N) {
  ESPL <- round(PL/(min(p, j-1)), 3)
  round(1 - ((N-1)/(N-(max(p, j-1))-1) * (1 - ESPL)), 2)
}

p<-3
j<-2
N<-20
EtaSquaredPL(PL, p, j, N) 


mardia(y)


 y<-manova(cbind(Reading,Grammar,Writing)~Method,data = tutoring_data)
cd<- candisc(y)
print(cd$structure)

F <- summary.aov(y)
F
