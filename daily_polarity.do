clear all
set more off

capture log close
log using "stocks_Polarity.log", replace
cd "C:\Users\poppa\OneDrive - University of Bristol\3rd\data science\project"

// importing the CSV data
import delimited "C:\Users\poppa\OneDrive - University of Bristol\3rd\data science\project\r_stocks_polarity.csv"
browse

// splitting the string variable containing dates and time stamps 
split datetime, g(newvar) p(" ") l(2) destring

// getting a variable which is only the date of the post
drop datetime
drop newvar2
rename newvar1 date

// converting the string variable containing the date into a datetime variable
generate numdate = date(date, "YMD")
format numdate %td

// collapsing to find the average polarity score per day
collapse polarity, by(numdate)

// exporting the data
outsheet numdate polarity using daily_stocks_polarity.csv , comma nolabel 

log close