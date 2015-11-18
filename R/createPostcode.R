createPostcode = function() {

  #Duplicate addresses
  address = UM$Owner.Address
  
  #Chuck out PO Boxes
  address = gsub("box [0-9][0-9][0-9][0-9]", "", address, ignore.case = TRUE)
  #Chuck out Locked Bags
  address = gsub("bag [0-9][0-9][0-9][0-9]", "", address, ignore.case = TRUE)
  
  #Pattern for extracting postcodes
  AU = "(0[289][0-9]{2})|([1345689][0-9]{3})|(2[0-8][0-9]{2})|(290[0-9])|(291[0-4])|(7[0-4][0-9]{2})|(7[8-9][0-9]{2})"
  
  #Prints AU Postcode
  x = regexpr(AU, address)
  UM$Postcode =  substring(address, x, x + attr(x, "match.length") - 1)
  print(UM$Postcode)
  
  #Creates new file with newly extracted data
  write.csv(UM, file = "./output/UMPCs.csv")
  
  # #Identifies AU Postcode
  # isAU = ifelse(grepl(AU, UM$Owner.Address), 1, 0)
  # 
  # #Displays addresses according to postcode extraction
  # ifelse(UM$Postcode == "", as.character(UM$Owner.Address), "") #If no postcode found, prints address
  # ifelse(UM$Postcode == "", "", as.character(UM$Owner.Address)) #If postcode found, prints address

}