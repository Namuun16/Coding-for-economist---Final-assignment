use "C:\Users\dell\Documents\city-size-japan-reduced.dta"

* OLS regression
reg ln_pop_1995 ln_pop_2005 ln_pop_2015

* create histogram 
hist ln_pop_1995
hist ln_pop_2005
hist ln_pop_2015

* save graphs
graph export hist1995.png, replace
