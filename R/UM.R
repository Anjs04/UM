
#Importing everything...

A <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/A.csv")
B <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/B.csv")
C <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/C.csv")
D <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/D.csv")
E <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/E.csv")
F <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/F.csv")
G <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/G.csv")
H <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/H.csv")
I <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/I.csv")
J <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/J.csv")
K <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/K.csv")
L <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/L.csv")
M <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/M.csv")
N <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/N.csv")
O <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/O.csv")
P <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/P.csv")
Q <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/Q.csv")
R <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/R.csv")
S <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/S.csv")
T <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/T.csv")
U <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/U.csv")
V <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/V.csv")
W <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/W.csv")
X <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/X.csv")
Y <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/Y.csv")
Z <- read.csv("C:/Users/admin/Dropbox/Quantitative Project/UnclaimedMoney/Z.csv")

#Putting it all together...
UM <- rbind(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z)
write.csv(UM, file = "UM.csv")

summary(UM)

#All these plots are too big!
plot(Amount~Year, data=UM)
plot(Amount~Description, data=UM)
boxplot(Amount~Description, data=UM)

plot(Amount~Year, data=UM, Year < 2012) 
plot(Amount~Year, data=UM, Year > 2012) #2012: Claimed if inactive for 7 yrs, not 3 yrs.

fit1 = lm(Amount~Year, data=UM) #Doing this by 'Date' gives error
summary(fit1)
plot(fit1)UM
qqnorm(residuals(fit1))
qqline(residuals(fit1))

par(mfrow=c(2,2)) #Says arrange plots in 2 rows, 2 cols
plot(fit1)
TukeyHSD(fit1)

fit2 = glm(UM ~ Year+Description, data = UM, family=binomial)

....................................................................................

#Dulpicate addresses
address = UM$Owner.Address

#Chuck out PO Boxes
address = gsub("box [0-9][0-9][0-9][0-9]", "", address, ignore.case = TRUE)
#Chuck out Locked Bags
address = gsub("bag [0-9][0-9][0-9][0-9]", "", address, ignore.case = TRUE)

#Pattern for extracting postcodes
AU <- "(0[289][0-9]{2})|([1345689][0-9]{3})|(2[0-8][0-9]{2})|(290[0-9])|(291[0-4])|(7[0-4][0-9]{2})|(7[8-9][0-9]{2})"

#Identifies AU Postcode
AU <- ifelse(grepl(AU, UM$Owner.Address), 1, 0)
                
#Prints AU Postcode
x = regexpr(AU, address)
UM$Postcode <-  substring(address, x, x + attr(x, "match.length") - 1)
print(UM$Postcode)

#Creates new file with newly extracted data
write.csv(UM, file = "UMPCs.csv")

#Displays addresses according to postcode extraction
ifelse(UM$Postcode == "", as.character(UM$Owner.Address), "") #If no postcode found, prints address
ifelse(UM$Postcode == "", "", as.character(UM$Owner.Address)) #If postcode found, prints address

....................................................................................

#Prints number of accounts covered by top 100 organistions
sum(head(sort(table(UM$Organisation.Name), decreasing = TRUE), 60))

#Prints top 100 organistions
xx = head(sort(table(UM$Organisation.Name), decreasing = TRUE), 100)

#Making a matrix for optimising organisation classification
NumEntries = c(268, 276, 283, 289, 295, 299, 304, 307, 311, 314)
NumTopOrg = c(70, 80, 90, 100, 110, 120, 130, 140, 150, 160)
percentage = NumEntries/380
ORGSUM = data.frame(NumEntries, NumTopOrg, percentage)
#Conclusion is top 100 organisations is most efficient way to categorise large chunk of data

write.csv(names(xx), file="Top100.csv")
barplot(head(sort(table(UM$Organisation.Name), decreasing = TRUE), 100))

....................................................................................

#Imports ABS Postcode to Area 4 data (88 regions)
PCAREA <- read.csv("C:/Users/A/Dropbox/Quantitative Project/PCAREA.csv")

#Match UM and PCAREA
match(UM$Postcode, PCAREA$Postcode, nomatch = NULL, incomparables = NULL)
