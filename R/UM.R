
#Importing everything...

A <- read.csv("data/A.csv")
B <- read.csv("data/B.csv")
C <- read.csv("data/C.csv")
D <- read.csv("data/D.csv")
E <- read.csv("data/E.csv")
F <- read.csv("data/F.csv")
G <- read.csv("data/G.csv")
H <- read.csv("data/H.csv")
I <- read.csv("data/I.csv")
J <- read.csv("data/J.csv")
K <- read.csv("data/K.csv")
L <- read.csv("data/L.csv")
M <- read.csv("data/M.csv")
N <- read.csv("data/N.csv")
O <- read.csv("data/O.csv")
P <- read.csv("data/P.csv")
Q <- read.csv("data/Q.csv")
R <- read.csv("data/R.csv")
S <- read.csv("data/S.csv")
T <- read.csv("data/T.csv")
U <- read.csv("data/U.csv")
V <- read.csv("data/V.csv")
W <- read.csv("data/W.csv")
X <- read.csv("data/X.csv")
Y <- read.csv("data/Y.csv")
Z <- read.csv("data/Z.csv")

#Putting it all together...
UM <- rbind(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z)
write.csv(UM, file = "./output/UM.csv")

summary(UM)

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
write.csv(UM, file = "./output/UMPCs.csv")

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

write.csv(names(xx), file="./output/Top100.csv")
barplot(head(sort(table(UM$Organisation.Name), decreasing = TRUE), 100))

....................................................................................

#Imports ABS Postcode to Area 4 data (88 regions)
PCAREA <- read.csv("C:/Users/A/Dropbox/Quantitative Project/PCAREA.csv")

#Match UM and PCAREA
match(UM$Postcode, PCAREA$Postcode, nomatch = NULL, incomparables = NULL)
