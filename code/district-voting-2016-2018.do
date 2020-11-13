clear

import delimited "https://raw.githubusercontent.com/zilinskyjan/citylab-data/master/citylab-congress/citylab_cdi_extended.csv"

* Merge in additional covariates:

rename cd congress_district 
merge 1:1 congress_district using "https://github.com/zilinskyjan/R-stata-tutorials/blob/master/data/CD_voteshares_demos_2016_18.dta?raw=true"

drop _merge 


gen dem2016_winner = (clinton16 > trump16)

gen house_dem2016_winner = (house_dem_share_2016 > house_rep_share_2016)

tab cluster dem2016_winner

scatter dem_share_2016 prop_white_noncollege_acs201418, by(cluster, note("Each dot corresponds to a Congressional district")) ///
	ytitle("Clinton 2016 vote share") ///
	xtitle("% white, non-college") 
gr export "../fig/districts-density-2016.png", replace 





* HOW DEM HOUSE ELECTED reps IMPROVED over Clinton

merge 1:1 congress_district using "/Users/janzilinsky/Downloads/contested-2018.dta"
* There were 7 contested at-large districts, which were unmerged:
replace contested_dr = 1 if _merge==1
drop if _merge==2
drop _merge



gen h18minusClinton = house_dem_share_2018 - dem_share_2016

gen h18betterClinton = (house_dem_share_2018 > dem_share_2016) if contested==1

summ h18minusClinton if contested==1


hist h18minusClinton if contested==1, freq xtitle("Dem. House candidate % in 2018 - Clinton % in 2016") by(cluster, note("Contested congressional districts only")) ytitle("Number of districts") 
gr export "../fig/dem-improvement-2016-2018.png", replace 

scatter h18minusClinton prop_white_noncollege_acs201418 if contested==1, by(cluster, note("Each dot corresponds to a contested Congressional district"))

scatter h18minusClinton median_income_acs201418 if contested==1, by(cluster, note("Each dot corresponds to a contested Congressional district"))

scatter h18minusClinton prop_white_acs201418 if contested==1, by(cluster, note("Each dot corresponds to a contested Congressional district"))

prop_white_acs201418

