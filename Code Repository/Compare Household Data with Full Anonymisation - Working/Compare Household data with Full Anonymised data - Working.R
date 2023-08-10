library(sdcMicro)
library(dplyr)
library(ggplot2)

## Load data

householddata <- read.csv("C:/Resources/Dissertation/Anonymisation/Compare Household Data with Full Anonymisation - Working/TestdataToCompareWithFullAnonymisation.csv")

sdc_full <- createSdcObj(householddata, keyVars=c('sex', 'age', 'urbrur', 'roof'), w='sampling_weight')
sdc_full <- kAnon(sdc_full, k = 3)
x_full_anon <- extractManipData(sdc_full)
write.csv(x_full_anon,"C:/Resources/Dissertation/Anonymisation/Compare Household Data with Full Anonymisation - Working/FullAnonymisedData.csv",row.names = FALSE)

p <- ggplot(householddata, aes(x=age)) + geom_histogram()
# Add mean line
p+ geom_vline(aes(xintercept=mean(age)),
              color="blue", linetype="dashed", size=1)

# Histogram with density plot
ggplot(householddata, aes(x=age)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") 



q<- ggplot(x_full_anon, aes(x=age)) + geom_histogram()
q+ geom_vline(aes(xintercept=mean(age)),
              color="blue", linetype="dashed", size=1)

# Histogram with density plot
ggplot(x_full_anon, aes(x=age)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") 