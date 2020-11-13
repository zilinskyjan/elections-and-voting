clear

import delimited "https://raw.githubusercontent.com/zilinskyjan/elections-and-voting/master/data-election-comparison/pres_vote_1988_2016_65plus_senior_voters.csv"

gen rep_margin = rep_vote_margin_65plus - dem_vote_margin_65plus 

rename ïyear year
label var year Election

tab year

replace source = "Exit Polls" if source == "National Exit Poll"

twoway (scatter rep_margin year, mlab(source) mlabpos(9) mlabsize(*.7)), ///
legend(off) ///
xlabel(1988 1992 1996 2000 2004 2008 2008 2012 2016 2020) xscale(r(2006 2021)) xtitle("Election") /// 
ylabel(0 "Tie" 10 "+10%" 20 "+20%" 30 "+30%" -10 "-10%" -20 "-20%") /// 
ytitle("Republican vote margin") title("GOP vote margin among senior voters (65+)") /// caption("Chart: @janzilinsky")
gr export "GOP-65plus.png"
