* import .csv file into stata
import delimited C:\Users\dell\Documents\city-size-japan.csv

* browse data
browse

* listing missing values
list if missing(pop_1995)
list if missing(pop_2000)
list if missing(pop_2005)
list if missing(pop_2010)
list if missing(pop_2015)

* fix common data quality errors in Stata (missing values)
replace pop_1995 = 150000 if missing(pop_1995) //replacing missing value with average
replace pop_2000 = 150000 if missing(pop_2000) //replacing missing value with average
replace pop_2005 = 150000 if missing(pop_2005) //replacing missing value with average
replace pop_2010 = 150000 if missing(pop_2010) //replacing missing value with average
replace pop_2015 = 150000 if missing(pop_2015) //replacing missing value with average

** prepare a sample for analysis

* filtering observations
keep if pop_1995>150000
keep if pop_2000>150000
keep if pop_2005>150000
keep if pop_2010>150000
keep if pop_2015>150000

* filtering variables
keep pop_1995 pop_2005 pop_2015

* creating transformation of variables
gen ln_pop_1995 = ln(pop_1995)
gen ln_pop_2005 = ln(pop_2005)
gen ln_pop_2015 = ln(pop_2015)

* save data in stata
save city-size-japan-reduced.dta, replace

* OLS regression
reg ln_pop_1995 ln_pop_2005 ln_pop_2015

* create histogram 
hist ln_pop_1995
hist ln_pop_2005
hist ln_pop_2015

* save graphs
graph export hist1995.png, replace

*
