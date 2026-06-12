#!/usr/bin/env bash
#this implements the Student Attendance Tracker that build a "Project Factory

ignal_Trap(){
	  echo "Signal received. Cleaning it up abeg..."
	  sleep 2
	  cp -R attendance_tracker_$input attendance_tracker_"$input"_archive && rm -r attendance_tracker_$input
	  echo "you have exited babes"
	   exit 0
  }
 trap Signal_Trap SIGINT
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
