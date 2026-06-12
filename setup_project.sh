#!/usr/bin/env bash
#this implements the Student Attendance Tracker that build a "Project Factory"

read -p "enter something to keep on with the procedure:" input

 if [ -d "attendance_tracker_$input" ]
   then
	   echo "You can immediately access the files inside the directory"
 else
	 mkdir attendance_tracker_$input
  	 mkdir attendance_tracker_$input/attendance_checker.py
	 mkdir attendance_tracker_$input/Helpers
 	 mkdir attendance_tracker_$input/reports
 fi
 #creating the files insided of Helpers and reports directories
   echo "Creating the files inside the Helpers and reports directories"
   echo "-------------------------------------------------------------"
     touch attendance_tracker_$input/Helpers/assets.csv
     touch attendance_tracker_$input/Helpers/config.json
     touch attendance_tracker_$input/reports/reports.log

Signal_Trap(){

        trap "cp attendance_tracker_$input attendance_tracker_"$input"_archive | rm attendance_tracker_$input" SIGINT
}
Signal_Trap
