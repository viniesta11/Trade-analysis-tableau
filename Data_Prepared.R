#Importing Libraries
library(dplyr)

#Reading and Viewing the dataset
Data_trade <- read.csv("Dataset_Int_business.csv")

#Editing names of columns
names(Data_trade) <- c("Country", "Year", "Commoditycode", "Commodity", "Flow","Dollars", "Weight",
                       "Quantityname", "Quantity", "Category")

View(Data_trade)
str(Data_trade)
summary(Data_trade)
#Missing values present in the columns "Weight" and "Quantity".
#There is a "No Quantity" value in the colum "Quantityname".
#No Quantity indicates Quantity is either 0 or NA.

#When Weight is zero or NAs or Quantity is zero, or NAs assigning 1.
Data_trade$Missing <- ifelse(Data_trade$Weight < 1 | is.na(Data_trade$Weight) 
                           | Data_trade$Quantity < 1 | is.na(Data_trade$Quantity), "1", "0")
table(Data_trade$Missing)
#It shows there are 2819 Rows with Weight is zero or NAs or Quantity is zero or NAs.

#Filtering the missing information by country and flow.


#-----------------------------------------------#Austraila-----------------------------------------
#Export
aus_export <- filter(Data_trade,Country == "Australia",Missing == 1, Flow == "Export")
nrow(aus_export) # 52 rows have missing info on Weight and Quantity
sum(aus_export$Dollars) 
# 12032593547 US Dollars from 52 rows contains the missing information.

#Import
aus_import <- filter(Data_trade,Country == "Australia",Missing == 1, Flow == "Import")
nrow(aus_import) # 383 rows have missing info on Weight and Quantity
sum(aus_import$Dollars) 
#1552825617 US Dollars from 383 rows contains the missing information.

#Re-Import
aus_reimport <- filter(Data_trade,Country == "Australia",Missing == 1, Flow == "Re-Import")
nrow(aus_reimport) # 8 rows have missing info on Weight and Quantity
sum(aus_reimport$Dollars) 
#938823 US Dollars from 8 rows contains the missing information.

#Re-Export
aus_reexport <- filter(Data_trade,Country == "Australia",Missing == 1, Flow == "Re-Export")
nrow(aus_reexport) # 3 rows have missing info on Weight and Quantity
sum(aus_reexport$Dollars)
#205325 US Dollars from 3 rows contains the missing information.

#Total
aus_total <- filter(Data_trade, Country == "Australia", Dollars >= 1) 
nrow(aus_total) #Australia has 24,921 rows in the dataset
sum(aus_total$Dollars)
#Total 458 billion US Dollars

#excluding rows which have missing info
aus_without_missing <- filter(aus_total, Missing == 0)
nrow(aus_without_missing) #24475 rows with complete info
sum(aus_without_missing$Dollars)
# 445 Billion US Dollars (Difference)

#Export without missing values
expo_aus <- filter(aus_without_missing, Flow == "Export")
nrow(expo_aus) #11133 rows with complete info
sum(expo_aus$Dollars)# 382 Billion US Dollars 

#Import without missing values
imp_aus <- filter(aus_without_missing, Flow == "Import")
nrow(imp_aus) #9964 rows with complete info
sum(imp_aus$Dollars)# 62.6 Billion US Dollars 

#Re-Import without missing values
reimp_aus <- filter(aus_without_missing, Flow == "Re-Import")
nrow(reimp_aus) #1335 rows with complete info
sum(reimp_aus$Dollars)# 0.27 Billion US Dollars 

#Re-Export without missing values
reexpo_aus <- filter(aus_without_missing, Flow == "Re-Export")
nrow(reexpo_aus) #2043 rows with complete info
sum(reexpo_aus$Dollars)# 0.19 Billion US Dollars

#Understanding Trade balance  (data with no missing info)
#Trade balance = Total Value of Export - Total Value of Import
tradebalance_aus <- sum(expo_aus$Dollars) - sum(imp_aus$Dollars)
tradebalance_aus # 319 Billion Trade surplus


#--------------------------------------------------------#Canada-----------------------------------
#Export
can_export <- filter(Data_trade,Country == "Canada",Missing == 1, Flow == "Export")
nrow(can_export) # 637 rows have missing info on Weight and Quantity
sum(can_export$Dollars) 
# 26578595902 US Dollars from 637 rows contains the missing information.

#Import
can_import <- filter(Data_trade,Country == "Canada",Missing == 1, Flow == "Import")
nrow(can_import) # 582 rows have missing info on Weight and Quantity
sum(can_import$Dollars) 
#5838350510 US Dollars from 582 rows contains the missing information.

#Re-Import
can_reimport <- filter(Data_trade,Country == "Canada",Missing == 1, Flow == "Re-Import")
nrow(can_reimport) # 100 rows have missing info on Weight and Quantity
sum(can_reimport$Dollars) 
#3676340 US Dollars from 100 rows contains the missing information.

#Re-Export
can_reexport <- filter(Data_trade,Country == "Canada",Missing == 1, Flow == "Re-Export")
nrow(can_reexport) # 110 rows have missing info on Weight and Quantity
sum(can_reexport$Dollars)
#89575525 US Dollars from 110 rows contains the missing information.

#Total
can_total <- filter(Data_trade, Country == "Canada", Dollars >= 1) 
nrow(can_total) #Canada has 29,932 rows in the dataset
sum(can_total$Dollars)
#Total 775 billion US Dollars

#excluding rows which have missing info
can_without_missing <- filter(can_total, Missing == 0)
nrow(can_without_missing) #28503 rows with complete info
sum(can_without_missing$Dollars)
# 742 Billion US Dollars (Difference)

#Export without missing values
expo_can <- filter(can_without_missing, Flow == "Export")
nrow(expo_can) # 10592 rows with complete info
sum(expo_can$Dollars)# 488 Billion US Dollars 

#Import without missing values
imp_can <- filter(can_without_missing, Flow == "Import")
nrow(imp_can) #11248 rows with complete info
sum(imp_can$Dollars)# 249 Billion US Dollars 

#Re-Import without missing values
reimp_can <- filter(can_without_missing, Flow == "Re-Import")
nrow(reimp_can) #3307 rows with complete info
sum(reimp_can$Dollars)# 0.5 Billion US Dollars 

#Re-Export without missing valules
reexpo_can <- filter(can_without_missing, Flow == "Re-Export")
nrow(reexpo_can) #3356 rows with complete info
sum(reexpo_can$Dollars)# 4 Billion US Dollars 

#Understanding Trade balance  (data with no missing info)
#Trade balance = Total Value of Export - Total Value of Import
tradebalance_can <- sum(expo_can$Dollars) - sum(imp_can$Dollars)
tradebalance_can # 238 Billion Trade surplus



#--------------------------------------------------------#USA--------------------------------------
#Export
usa_export <- filter(Data_trade,Country == "USA",Missing == 1, Flow == "Export")
nrow(usa_export) # 385 rows have missing info on Weight and Quantity
sum(usa_export$Dollars) 
#17946793912 US Dollars from 385 rows contains the missing information.

#Import
usa_import <- filter(Data_trade,Country == "USA",Missing == 1, Flow == "Import")
nrow(usa_import) # 305 rows have missing info on Weight and Quantity
sum(usa_import$Dollars) 
#18418691692 US Dollars from 305 rows contains the missing information.

#Re-Import
usa_reimport <- filter(Data_trade,Country == "USA",Missing == 1, Flow == "Re-Import")
nrow(usa_reimport)
#Re-Import flow does not have any missing value.

#Re-Export
usa_reexport <- filter(Data_trade,Country == "USA",Missing == 1, Flow == "Re-Export")
nrow(usa_reexport) # 254 rows have missing info on Weight and Quantity
sum(usa_reexport$Dollars)
#587215211 US Dollars from 254 rows contains the  missing information.

#Total
usa_total <- filter(Data_trade, Country == "USA", Dollars >= 1) 
nrow(usa_total) #USA has 4237 rows in the dataset
sum(usa_total$Dollars)
#Total 601 billion US Dollars

#excluding rows which have missing info
usa_without_missing <- filter(usa_total, Missing == 0)
nrow(usa_without_missing) #3293 rows with complete info
sum(usa_without_missing$Dollars)
# 564 Billion US Dollars (Difference)

#Export without missing value
expo_usa <- filter(usa_without_missing, Flow == "Export")
nrow(expo_usa) #1144 rows with complete info
sum(expo_usa$Dollars)# 429 Billion US Dollars 

#Import without missing value
imp_usa <- filter(usa_without_missing, Flow == "Import")
nrow(imp_usa) #1210 rows with complete info
sum(imp_usa$Dollars)# 133 Billion US Dollars

#Re-Import without missing value
reimp_usa <- filter(usa_without_missing, Flow == "Re-Import")
nrow(reimp_usa) #0 rows with complete info
sum(reimp_usa$Dollars)# 0 US Dollars 

#Re-Export without missing value
reexpo_usa <- filter(usa_without_missing, Flow == "Re-Export")
nrow(reexpo_usa) #939 rows with complete info
sum(reexpo_usa$Dollars)# 1.9 Billion US Dollars

#Understanding Trade balance  (data with no missing info)
#Trade balance = Total Value of Export - Total Value of Import
tradebalance_usa <- sum(expo_usa$Dollars) - sum(imp_usa$Dollars)
tradebalance_usa # 295 Billion Trade surplus  

