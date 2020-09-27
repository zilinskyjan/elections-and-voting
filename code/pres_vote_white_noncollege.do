clear

import delimited "https://raw.githubusercontent.com/zilinskyjan/elections-and-voting/master/data-election-comparison/pres_vote_2008_16_whitenoncollege.csv"

twoway (scatter margin year, mlab(survey) mlabpos(9) mlabsize(*.7)), ///
legend(off) ///
xlabel(2008 2008 2012 2016 2020) xscale(r(2006 2021)) xtitle("Election") /// 
ylabel(0 "Tie" 5 "+5%" 10 "+10%" 15 "+15%" 20 "+20%" 25 "+25%" 30 "+30%" 35 "+35%") /// 
ytitle("Republican vote margin") title("GOP vote margin among white voters without a college degree")
gr export "GOP-white-non-college.png"
