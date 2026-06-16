#!/usr/bin/env bash
#this imiplements the Student Attendance Tracker that build a "Project Factory
#3. Process Management(the trap)
Trap(){
          echo "A signal has been caught. I have to clean it up..."
	  sleep 2
	  tar -czf attendance_tracker_${input}_archive attendance_tracker_${input} && rm -r attendance_tracker_${input}
	  echo "your work has been saved into an archive"
	   exit 0
  }
 trap Trap SIGINT
 #1. Directory Architecture
 sleep 2
 echo "I am going to set up an environment that creates the workspace, tracks and update the student attendance in school"
#writing conditions in case there i sno user input
 sleep 2

  echo "/_!_\\ warning you will not be able procceed without an input where you are supposed to add it"

  sleep 2
   while true
        do
          read -p "enter a word to proceed with the main file creation:" input
                if [[ -n "$input" ]]
                 then
                    break
                fi
                 echo "there was no user input, repeat again"
    done
 if [ ! -d "attendance_tracker_${input}" ]
   then
	 sleep 1
       echo "From your input,a directory named the attendance_tracker_${input} has to be existing, but it doesnt. I have to create it first"

       sleep 2
       echo "Creating directories and files needed to set up the system"
       echo "----------------------------------------------------------"

	 mkdir attendance_tracker_${input}
	 sleep 3
  	 touch attendance_tracker_${input}/attendance_checker.py
	 mkdir attendance_tracker_${input}/Helpers
 	 mkdir attendance_tracker_${input}/reports


 #creating the files inside the Helpers and reports directories

     touch attendance_tracker_${input}/Helpers/assets.csv
     touch attendance_tracker_${input}/Helpers/config.json
     touch attendance_tracker_${input}/reports/reports.log
 ls -l
 sleep 2
#copying the content of the files assets config and reports into the existing files

##adding content to the reports.log file
     echo " --- Attendance Report Run: 2026-02-06 18:10:01.468726 ---
[2026-02-06 18:10:01.469363] ALERT SENT TO bob@example.com: URGENT: Bob Smith, your
attendance is 46.7%. You will fail this class.
[2026-02-06 18:10:01.469424] ALERT SENT TO charlie@example.com: URGENT: Charlie
Davis, your attendance is 26.7%. You will fail this class." > attendance_tracker_${input}/reports/reports.log

##adding content to the "attendance_checker.py" file 
cat > attendance_tracker_${input}/attendance_checker.py << 'EOF'
              
             import csv
             import json
             import os
             from datetime import datetime
def run_attendance_check():
         # 1. Load Config
         with open('Helpers/config.json', 'r') as f:
          config = json.load(f)

        # 2. Archive old reports.log if it exists
        if os.path.exists('reports/reports.log'):
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        os.rename('reports/reports.log',
f'reports/reports_{timestamp}.log.archive')
        # 3. Process Data
        with open('Helpers/assets.csv', mode='r') as f, open('reports/reports.log',
'w') as log:
         reader = csv.DictReader(f)
         total_sessions = config['total_sessions']
         log.write(f"--- Attendance Report Run: {datetime.now()} ---\n")

         for row in reader:
            name = row['Names']
            email = row['Email']
            attended = int(row['Attendance Count'])
            # Simple Math: (Attended / Total) * 100
            attendance_pct = (attended / total_sessions) * 100
	    
            message = ""
            if attendance_pct < config['thresholds']['failure']:
               message = f"URGENT: {name}, your attendance is {attendance_pct:.1f}
%. You will fail this class."
             elif attendance_pct < config['thresholds']['warning']:
                  message = f"WARNING: {name}, your attendance is
{attendance_pct:.1f}%. Please be careful."
	
             if message:
                 if config['run_mode'] == "live":
                      log.write(f"[{datetime.now()}] ALERT SENT TO {email}: {message}
\n")
                      print(f"Logged alert for {name}")
                 else:
                      print(f"[DRY RUN] Email to {email}: {message}")
if __name__ == "__main__":
              run_attendance_check()
EOF

    echo "Email          Names          Attendance Count        Absence Count
alice@example.com      Alice Johnson                  14                    1
bob@example.com        Bob Smith                       7                    8
charlie@example.com    Charlie Davis                   4                   11
diana@example.com      Diana Prince                   15                    0 " > attendance_tracker_${input}/Helpers/assets.csv

## adding content to the config.json file 
     echo '{
    "thresholds": {
        "warning": 75,
        "failure": 50
    },
    "run_mode": "live",
    "total_sessions": 15
}' > attendance_tracker_${input}/Helpers/config.json

else
	echo "You can immediately access the files inside the directory"
fi

#2. Dynamic Configuration (Stream Editing)
#prompting the user if he would like to update the students' attendance tresholds

echo "Now that you have created and copied content in the files needed,lets do some updates in them"
sleep 1
echo "Updating the thresholds for Warning and failure"
echo "-----------------------------------------------"
sleep 2
 while true
  do 
   read -p "would you like to update the attendance tresholds? (yes/no):" choice
		if [[ -n "$choice" && "$choice" == "no" || "$choice" == "yes" ]]
        then
		break
       fi 
           echo "no user input, you cannot proceed."
	   echo "enter yes or no only"
  done
  #this send you a message of updating the threshold
  if [[ "$choice" == "yes" ]]
    then
       echo "a message to update will be shortly sent to you"

  #updating attendance tresholds with only numbers and percentage

       while true
          do  
            read -p "updated value for a threshold of warning:" Warning
  
            read -p "updated value for a treshold of failure:" Failure

            if [[ "$Warning" =~ ^[0-9%]+$ && "$Failure" =~ ^[0-9%]+$ ]];
                 then
                    break

              fi
       echo " no letters accepted, the values of "Failure" and "Warning" have to be numbers"

         done
#editing in place the config.json file with its new value Warning with warning and Failure with failure
	  sed -i "s/\"warning\": [0-9]*/\"warning\": $Warning/" attendance_tracker_${input}/Helpers/config.json
          sed -i "s/\"failure\": [0-9]*/\"Failure\": $Failure/" attendance_tracker_${input}/Helpers/config.json
   echo "Tresholds updated"
   cat attendance_tracker_${input}/Helpers/config.json
    else
             echo "threshold has been kept at default 75% for warning and 50% for failure"
       fi
sleep 2
#4.Environment Validation
#checking if the python3 exist
#let us use a condition
echo "Now lets see run the health check to see if Python3 is installed on our computer"
sleep 2
echo " Health Check: Verifying Python3 installation"
echo " --------------------------------------------"
 p="python3"
if command -v $p &>/dev/null 
    then 
	echo "python3 is installed"
	sleep 1
	python3 --version
else
	echo "python3 does not exist you have to create it"
	sudo apt install python3 python3-pip
fi
python3 attendance_tracker_${input}/attendance_checker.py 
echo "Good job, you have created and updated the system"

