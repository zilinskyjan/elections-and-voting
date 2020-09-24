clear

import delimited "https://raw.githubusercontent.com/zilinskyjan/elections-and-voting/master/data-election-comparison/pres_vote_1980_16_men_and_women.csv"

twoway (scatter rep_margin_among_men year if year >= 2008 & year !=2020, mlab(source) mlabpos(9)) ///
(scatter rep_margin_among_men year if year == 2020, mlab(source) mlabpos(12)), /// 
legend(off) ///
xlabel(2008 2008 2012 2016 2020) xscale(r(2005 2021)) xtitle("Election") /// 
ylabel(-5 "-5%" 0 "Tie" 5 "+5%" 10 "+10%") /// 
ytitle("Republican vote margin") title("Republican vote margin among male voters")
gr export "GOP vote margin among men.png"

replace source = "Exit Polls" if source == "National Exit Poll"

twoway (scatter rep_margin_among_men year if year !=2020, mlab(source) mlabpos(12)), ///
xtitle("Election") /// 
ylabel(-5 "-5%" 0 "Tie" 5 "+5%" 10 "+10%" 15 "+15%" 20 "+20%") /// 
xscale(r(1978 2017)) ///
xlabel(1980(4)2016) ///
yline(0) ///
ytitle("Margin") title("Republican vote margin among male voters")
gr export "GOP vote margin among men all elections.png", replace

twoway (scatter rep_margin_among_men year, mlab(source) mlabpos(12)) ///
(scatter rep_margin_among_men year if year==2020, mcol(navy) mlab(source) mlabpos(12)), ///
legend(off) ///
xtitle("Election") /// 
ylabel(-5 "-5%" 0 "Tie" 5 "+5%" 10 "+10%" 15 "+15%" 20 "+20%") /// 
xscale(r(1978 2023)) ///
xlabel(1980(4)2016) ///
yline(0) ///
ytitle("Margin") title("Republican vote margin among male voters")
gr export "GOP vote margin among men all years.png", replace


twoway (scatter rep_margin_among_women year if year !=2020, mlab(source) mlabsize(*.7) mlabpos(3)), ///
xtitle("Election") /// 
ylabel(-10 "-10%" -15 "-15%" -5 "-5%" 0 "Tie" 5 "+5%" 10 "+10%" 15 "+15%" 20 "+20%") /// 
xscale(r(1978 2017)) ///
xlabel(1980(8)2020) ///
yline(0) ///
ytitle("Margin") title("Republican vote margin among women")
gr export "GOP vote margin among women all elections.png", replace


twoway (scatter dem_margin_among_women year if year !=2020, mlab(source) mlabsize(*.7) mlabpos(3)), ///
xtitle("Election") /// 
ylabel(-10 "-10%" -15 "-15%" -5 "-5%" 0 "Tie" 5 "+5%" 10 "+10%" 15 "+15%" 20 "+20%") /// 
xscale(r(1978 2017)) ///
xlabel(1980(4)2020) ///
yline(0) ///
ytitle("Margin") title("Democratic vote margin among women")
gr export "Dem vote margin among women all elections.png", replace

twoway (scatter dem_margin_among_women year, mlab(source) mlabsize(*.7) mlabpos(3)), ///
xtitle("Election") /// 
ylabel(-10 "-10%" -15 "-15%" -5 "-5%" 0 "Tie" 5 "+5%" 10 "+10%" 15 "+15%" 20 "+20%") /// 
xscale(r(1978 2025)) ///
xlabel(1980(4)2020) ///
yline(0) ///
ytitle("Margin") title("Democratic vote margin among women")
gr export "Dem vote margin among women all years.png", replace


twoway (scatter dem_margin_among_men year, mlab(source) mlabsize(*.7) mlabpos(3)), ///
xtitle("Election") /// 
ylabel(-10 "-10%" -15 "-15%" -5 "-5%" 0 "Tie" 5 "+5%" 10 "+10%" -20 "-20%") /// 
xscale(r(1978 2025)) ///
xlabel(1980(4)2020) ///
yline(0) ///
ytitle("Margin") title("Democratic vote margin among men")
gr export "Dem vote margin among men all years.png", replace



* Sources include:

* https://www.nytimes.com/elections/2012/results/president/exit-polls.html
* https://docs.google.com/spreadsheets/d/1Lr1z1UDy9-sCn1rPMmV8H5KTjcFHTjEujoBw1oMPyDo/edit#gid=0
