#!/usr/bin/env bash
#this implements the Student Attendance Tracker that build a "Project Factory"

Signal_Trap(){
      trap "cp attendance_tracker_$input attendance_tracker_"$input"_archive | rm attendance_tracker_$input" SIGINT
}
read -p "enter a word for procedure to keep on:" input

 if [ -d "attendance_tracker_$input" ]
   then
	   echo "You can immediately access the files inside the directory"
 else
       echo "Creating parent directories, child directories and files"
       echo "--------------------------------------------------------"
	 mkdir attendance_tracker_$input
  	 touch attendance_tracker_$input/attendance_checker.py
	 mkdir attendance_tracker_$input/Helpers
 	 mkdir attendance_tracker_$input/reports
 fi
 #creating the files inside the Helpers and reports directories

     touch attendance_tracker_$input/Helpers/assets.csv
     touch attendance_tracker_$input/Helpers/config.json
     touch attendance_tracker_$input/reports/reports.log

Signal_Trap
