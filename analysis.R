# Sources

source("R/import.R", FALSE)
source("R/createUM.R", FALSE)
source("R/createPostcode.R", FALSE)
source("R/howManyOrgs.R", FALSE)
source("R/matchPostcodeToArea.R", FALSE)


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


# Exploration




# Completed the work
print("Done")