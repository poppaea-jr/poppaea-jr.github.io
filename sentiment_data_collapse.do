clear all
set more off

capture log close
log using "sentiment_time_series.log", replace
cd "C:\Users\poppa\OneDrive - University of Bristol\3rd\data science\project\r_stocks_data"

// importing the CSV data
import delimited "C:\Users\poppa\OneDrive - University of Bristol\3rd\data science\project\r_stocks_data\sentiment_time_series.csv"
browse

// splitting the string variable containing dates and time stamps 
split created, g(newvar) p(" ") l(2) destring

// getting a variable which is only the date of the post
drop created
drop newvar2
rename newvar1 date

// converting the string variable containing the date into a datetime variable
generate numdate = date(date, "YMD")
format numdate %td

// collapsing to find the average polarity score per day
collapse polarity, by(numdate)

// exporting the data
outsheet numdate polarity final_data.csv , comma nolabel 

log close