# Sources

source("R/import.R", FALSE)
source("R/createUM.R", FALSE)
source("R/createPostcode.R", FALSE)
source("R/matchPostcodeToArea.R", FALSE)
source("R/howManyOrgs.R", FALSE)
source("R/createClassified.R", FALSE)
--

source("R/plotYears.R", FALSE)
source("R/trim.R", FALSE)
source("R/plotYearsTrimmed.R", FALSE)
--

source("R/createFreqTable.R", FALSE)
source("R/createCounts.R", FALSE)
source("R/poissonCounts.R", FALSE)
source("R/plotPoissonCounts.R", FALSE)
source("R/poissonPoly2.R", FALSE)
source("R/poissonPoly3.R", FALSE)
source("R/plotPoissonPoly2.R", FALSE)
source("R/plotPoissonPoly3.R", FALSE)
source("R/anovaPoissonPoly3.R", FALSE)
source("R/quasiPoisson.R", FALSE)
source("R/plotQuasiPoisson.R", FALSE)
source("R/anovaQuassiPoisson.R", FALSE)
--

# Data Mining and Cleaning

print("Import alphabetised files")
import()

print("Merge alphabetised files into one file")
createUM()

print("Create new variable 'Postcode' from 'Address' variable")
createPostcode()

print("Match Postcode to Area based on ranges in docs/Postcode_Ranges.doc")
matchPostcodeToArea()

print("Compare number of top occuring accounts with percentage of data covered")
howManyOrgs()

print("Write the year each account was classified, as unclaimed, to UM as a new variable")
createClassified()
--
  
# Exploration

print("Plot frequency of each year to show distribution in data")
plotYears()

print("Trimming the data by year, excluding anything before 1960 or after 2008")
trim()

print("Plotting the distribution of years after trimming")
plotYearsTrimmed()
--

# Analysing the number of accounts with unclaimed money
  
print("Frequency table including 'Description' to show 'Frequency' as response variable")
createFreqTable()

print("Frequency table excluing 'Description' for modelling")
createCounts()

print("Fitting a Poisson model to the Counts table with no other transformations")
poissonCounts()

print("Plotting the residuals against fitted values, and the residuals against the year, for the above Poisson model")
plotPoissonCounts()

print("Fitting a Poisson model with 'Year' and Classified' poly-transformed with order of 2")
poissonPoly2()

print("Plotting the quantile-quantile plot for poissonPoly2")
plotPoissonPoly2()

print("Fitting a Poisson model with 'Year' and Classified' poly-transformed with order of 3")
poissonPoly3()

print("Plotting the quantile-quantile plot for poissonPoly3")
plotPoissonPoly3()

print("Creates ANOVA table for poissonPoly3")
anovaPoissonPoly3()

print("Fitting a quasiPoisson model")
quasiPoisson()

print("Plotting the quantile-quantile plot for quasiPoisson")
plotQuasiPoisson()

print("Creates ANOVA table for quasiPoisson")
anovaQuassiPoisson()




# Completed the work
print("Done")