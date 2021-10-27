# Files required: GroceryStore.csv
# Make sure you put this file in the same directory as this file

# Package necessary for transaction analysis: arules and
# These packages need to be installed in order to run the code. 
# To install write the following on the console:
# install.packages("arules")

require(arules)



#--Read the data
# Since association rules mining deals with transactions, the data has to be 
# read or converted to one of object (class) transactions (available in the arules pkg.)
# This is a necessary step because the apriori() function accepts transactions 
# data of object transactions only.
storedata <- read.transactions("GroceryStore.csv", format = "single", 
                                 header=TRUE, sep =",", 
                                 cols=c("Transaction ID","Data"))


#Display a plot with the 20 most frequent items
itemFrequencyPlot(storedata, topN=20, main="20 most frequent items")


#Find the rules
rulesa <- apriori(data = storedata, parameter = list(support = 0.1, confidence = 0.5), 
                 control=list(verbose=FALSE))
cat("\n**Mined rules:\n")
rulesa <- sort(rulesa, by="lift", decreasing=TRUE)
options(max.print=30000)
inspect(rulesa)


#--Find the rules
rulesb <- apriori(data = storedata, parameter = list(support = 0.25, confidence = 0.5, minlen=2), 
                 control=list(verbose=FALSE))
cat("\n**Mined rules:\n")
rulesb <- sort(rulesb, by="lift", decreasing=TRUE)
inspect(rulesb)




