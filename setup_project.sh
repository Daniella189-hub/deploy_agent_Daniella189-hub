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

     touch attendance_tracker_$input/Helpers/assets.csv
     touch attendance_tracker_$input/Helpers/config.json
     touch attendance_tracker_$input/reports/reports.log
