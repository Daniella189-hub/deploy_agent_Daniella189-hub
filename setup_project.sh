#!/usr/bin/env bash
#this implements the Student Attendance Tracker thta build a "Porject Factory"

read -p "enter an input:" input 
mkdir attendance_tracker_$input
 if [ -d "attendance_tracker_$input" ]
    then
	 mkdir attendance_tracker_$input/attendance_checker.py
	 mkdir attendance_tracker_$input/Helpers
	 mkdir attendance_tracker_$input/reports
 else 
	 echo " "
 fi
	 
 if [ -d "Helpers" ]
   then
     touch Helpers/assets.csv
     touch Helpers/config.json
 elif [ -d "reports" ]
    then 
      touch reports/reports.log
 fi
