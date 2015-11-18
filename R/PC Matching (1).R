UM$Area =
  
  ifelse( UM$Postcode == (2600 || 2601 || 2610), "Canberra CBD",
          ifelse( UM$Postcode >= 2601 && UM$Postcode <= 2609, "Canberra Metro",
                  ifelse( UM$Postcode >= 2611 && UM$Postcode <= 2620, "Rest of ACT",
                          ifelse( UM$Postcode >= 1100 && UM$Postcode <= 1299 || UM$Postcode == (2000 || 2001 || 2007 || 2009), "Sydney CBD",
                                  ifelse( UM$Postcode >= 2002 && UM$Postcode <= 2006 || UM$Postcode == 2008 || UM$Postcode >= 2010 && UM$Postcode <= 2234, "Sydney Metro",
                                          ifelse( UM$Postcode >= 2640 && UM$Postcode <= 2660, "Riverina Area",
                                                  ifelse( UM$Postcode >= 2500 && UM$Postcode <= 2534, "Wollongong",
                                                          ifelse( UM$Postcode >= 2265 && UM$Postcode <= 2333, "Newcastle",
                                                                  ifelse( UM$Postcode >= 2413 && UM$Postcode <= 2484, "Northern Rivers",
                                                                          ifelse( UM$Postcode >= 2235 && UM$Postcode <= 2412 || UM$Postcode >= 2640 && UM$Postcode <= 2660, "Rest of NSW",
                                                                                  ifelse( UM$Postcode >= 3000 && UM$Postcode <= 3006 || UM$Postcode == 3205 || UM$Postcode >= 8000 && UM$Postcode <= 8399, "Melbourne CBD",
                                                                                          ifelse( UM$Postcode >= 3007 && UM$Postcode <= 3204 || UM$Postcode == (3206 || 3207), "Melbourne Metro",
                                                                                                  ifelse( UM$Postcode >= 3208 && UM$Postcode <= 3999, "Rest of VIC",
                                                                                                          ifelse( UM$Postcode == (4000 || 4001 || 4003) || UM$Postcode >= 9000 && UM$Postcode <= 9015, "Brisbane CBD",
                                                                                                                  ifelse( UM$Postcode == 4002 || UM$Postcode >= 4004 && UM$Postcode <= 4207 || UM$Postcode >= 4300 && UM$Postcode <= 4305 || UM$Postcode >= 4500 && UM$Postcode <= 4519, "Brisbane Metro",
                                                                                                                          ifelse( UM$Postcode >= 4208 && UM$Postcode <= 4287, "Gold Coast",
                                                                                                                                  ifelse( UM$Postcode >= 4550 && UM$Postcode <= 4575, "Sunshine Coast",
                                                                                                                                          ifelse( UM$Postcode >= 2888 && UM$Postcode <= 4299 || UM$Postcode >= 4306 && UM$Postcode <= 4499 || UM$Postcode >= 4520 && UM$Postcode <= 4549 || UM$Postcode >= 4576 && UM$Postcode <= 4999, "Adelaide CBD",
                                                                                                                                                  ifelse( UM$Postcode == (5000 || 5001 || 5004 || 5005 || 5810 || 5839) || UM$Postcode >= 5880 && UM$Postcode <= 5889, "Adelaide CBD",
                                                                                                                                                         ifelse( UM$Postcode == (5002 || 5003) || UM$Postcode >= 5006 && UM$Postcode <= 5119, "Adelaide Metro",
                                                                                                                                                                 ifelse( UM$Postcode >= 5200 && UM$Postcode <= 5749 || UM$Postcode >= 5825 && UM$Postcode <= 5854, "Rest of SA",
                                                                                                                                                                          ifelse( UM$Postcode == (6000 || 6001 || 6004 || 6827) || UM$Postcode >= 6830 && UM$Postcode <= 6832 || UM$Postcode >= 6837 && UM$Postcode <= 6849, "Perth CBD",
                                                                                                                                                                                  ifelse( UM$Postcode == (6002 || 6003) || UM$Postcode >= 6005 && UM$Postcode <= 6199 , "Perth Metro",
                                                                                                                                                                                         ifelse( UM$Postcode >= 6200 && UM$Postcode <= 6826 || UM$Postcode == (6828 || 6829) || UM$Postcode >= 6833 && UM$Postcode <= 6836 || UM$Postcode >= 6850 && UM$Postcode <= 6999, "Rest of WA",
                                                                                                                                                                                                 ifelse( UM$Postcode == (7000 || 7001), "Hobart CBD",
                                                                                                                                                                                                          ifelse( UM$Postcode >= 7002 && UM$Postcode <= 7099, "Hobart Metro",
                                                                                                                                                                                                                 ifelse( UM$Postcode >= 7100 && UM$Postcode <= 7999, "Rest of TAS",
                                                                                                                                                                                                                          ifelse( UM$Postcode >= 0800 && UM$Postcode <= 0832, "Darwin Metro",
                                                                                                                                                                                                                                 ifelse( UM$Postcode >= 0833 && UM$Postcode <= 0899, "Rest of NT", ""
                                                                                                                                                                                                                                         
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