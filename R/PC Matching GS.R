PC2Area = function(PC) {
  if(PC %in% c(2600,2601,2610)) return("Canberra CBD")

}


PC2Area = function(PC)   ifelse( PC == (2600 || 2601 || 2610), "Canberra CBD",
          ifelse( PC >= 2601 && PC <= 2609, "Canberra Metro",
                  ifelse( PC >= 2611 && PC <= 2620, "Rest of ACT",
                          ifelse( PC >= 1100 && PC <= 1299 || PC == (2000 || 2001 || 2007 || 2009), "Sydney CBD",
                                  ifelse( PC >= 2002 && PC <= 2006 || PC == 2008 || PC >= 2010 && PC <= 2234, "Sydney Metro",
                                          ifelse( PC >= 2640 && PC <= 2660, "Riverina Area",
                                                  ifelse( PC >= 2500 && PC <= 2534, "Wollongong",
                                                          ifelse( PC >= 2265 && PC <= 2333, "Newcastle",
                                                                  ifelse( PC >= 2413 && PC <= 2484, "Northern Rivers",
                                                                          ifelse( PC >= 2235 && PC <= 2412 || PC >= 2640 && PC <= 2660, "Rest of NSW",
                                                                                  ifelse( PC >= 3000 && PC <= 3006 || PC == 3205 || PC >= 8000 && PC <= 8399, "Melbourne CBD",
                                                                                          ifelse( PC >= 3007 && PC <= 3204 || PC == (3206 || 3207), "Melbourne Metro",
                                                                                                  ifelse( PC >= 3208 && PC <= 3999, "Rest of VIC",
                                                                                                          ifelse( PC == (4000 || 4001 || 4003) || PC >= 9000 && PC <= 9015, "Brisbane CBD",
                                                                                                                  ifelse( PC == 4002 || PC >= 4004 && PC <= 4207 || PC >= 4300 && PC <= 4305 || PC >= 4500 && PC <= 4519, "Brisbane Metro",
                                                                                                                          ifelse( PC >= 4208 && PC <= 4287, "Gold Coast",
                                                                                                                                  ifelse( PC >= 4550 && PC <= 4575, "Sunshine Coast",
                                                                                                                                          ifelse( PC >= 2888 && PC <= 4299 || PC >= 4306 && PC <= 4499 || PC >= 4520 && PC <= 4549 || PC >= 4576 && PC <= 4999, "Adelaide CBD",
                                                                                                                                                  ifelse( PC == (5000 || 5001 || 5004 || 5005 || 5810 || 5839) || PC >= 5880 && PC <= 5889, "Adelaide CBD",
                                                                                                                                                         ifelse( PC == (5002 || 5003) || PC >= 5006 && PC <= 5119, "Adelaide Metro",
                                                                                                                                                                 ifelse( PC >= 5200 && PC <= 5749 || PC >= 5825 && PC <= 5854, "Rest of SA",
                                                                                                                                                                          ifelse( PC == (6000 || 6001 || 6004 || 6827) || PC >= 6830 && PC <= 6832 || PC >= 6837 && PC <= 6849, "Perth CBD",
                                                                                                                                                                                  ifelse( PC == (6002 || 6003) || PC >= 6005 && PC <= 6199 , "Perth Metro",
                                                                                                                                                                                         ifelse( PC >= 6200 && PC <= 6826 || PC == (6828 || 6829) || PC >= 6833 && PC <= 6836 || PC >= 6850 && PC <= 6999, "Rest of WA",
                                                                                                                                                                                                 ifelse( PC == (7000 || 7001), "Hobart CBD",
                                                                                                                                                                                                          ifelse( PC >= 7002 && PC <= 7099, "Hobart Metro",
                                                                                                                                                                                                                 ifelse( PC >= 7100 && PC <= 7999, "Rest of TAS",
                                                                                                                                                                                                                          ifelse( PC >= 0800 && PC <= 0832, "Darwin Metro",
                                                                                                                                                                                                                                 ifelse( PC >= 0833 && PC <= 0899, "Rest of NT", ""
                                                                                                                                                                                                                                         
                                                                                                                                                                                                                                  )
                                                                                                                                                                                                                         )
                                                                                                                                                                                                                  )
                                                                                                                                                                                                         )
                                                                                                                                                                                                  )
                                                                                                                                                                                          )
                                                                                                                                                                                 )
                                                                                                                                                                         )
                                                                                                                                                                  )
                                                                                                                                                          )
                                                                                                                                                 )
                                                                                                                                          )
                                                                                                                                  )
                                                                                                                          )
                                                                                                                  )
                                                                                                          )
                                                                                                  )
                                                                                          )
                                                                                  )
                                                                          )
                                                                  )
                                                          )
                                                  )
                                          )
                                  )         
                          )        
                  )
          )
  )

tmp = sapply(UM$Postcode, PC2Area)