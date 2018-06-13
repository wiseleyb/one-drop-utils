# One Drop Utils

Most diabetes docs will read your device at the office during your visit. My
doc could read One Drop devices. They also wanted numbers for morning/evening.
This is a very simple ruby script to transform data.

## Caveat

This is a total hack, no tests, etc. I figure no-one will use it but me. If it gets any ttraction happy to clean up.

## Install

```
git clone https://github.com/wiseleyb/one-drop-utils
bundle
```

## Export Data from OneDrop app

Click the `*` My Account menu (top right). Scroll down to `Reports`. Email
yourself a `CSV` data file and save it to `data/(report-name).csv`

## Reports/Usage

### Report AM PM

This goes through the csv file and finds the first reading of the day and, if
there is a second after noon, and evening number.

Input: `data/report-am-pm.csv`
Output: `data/report-am-pm-out.csv`
Examples: `data/report-am-pm-example.csv` and `data/report-am-pm-out-example.csv`

To run:
```
be rails c
ReportAmPm.new.parse
```



