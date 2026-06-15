# Project title
   deploy agent Daniella189-hub
## Project Decription
 This is a Bash script that stes up and manages a student attendance tracking workspace and do some update the treshold of when a student should be warned or send a failure message form the percentage He received. It creates the directory structure, populates configuration and data files, allows threshold updates, and validates the Python environment needed to run the tracker.

## Requirements
   - Bash (version 4+)
   - Python3 
   - pip3 
   -standard Linux utilities or mastery ( sed, tar, mkdir, touch)
## Usage 
In your terminal (bash) run the command " chmod +x setup_project.sh) to give access to execution permissions. 
and after that run the command "./setup_project.sh" this will run the written script. the file setup_project.sh contains all needed to make this project be created and function efficiently

## What does the Script do?

1.Directory Setup
 creates the following structure under the main directory of our project "attendance_tracker_{input}"


attendance_tracker_{input}/
├── attendance_checker.py
├── Helpers/
│   ├── assets.csv
│   └── config.json
└── reports/
    └── reports.log
2. File Population
  fills each file with starter content:
  - assets.csv 
  - config.json
  - reports.log
  - attendance-checker.py

3. Threshold Update (Stream Editing)
 Prompts you to update the warning and failure attendance thresholds in config.json using the "sed" command and the "read" command

4. Signal Handling (SIGINT/Ctrl+C)
 in this script, if you Ctrl+c at any point to kill the execution, the script will :
   - catch the "SIGINT" signal
   - archive your workspace into a ".tar.gz" file
   - remove the original directory making sure it keeps a file ( the .tar.gz) that has the execution before you typed "Ctrl+c"
   - exits cleanly 
5. Environment Validation
 The script checks if python3 is installed. If not, it installs it automatically using apt.

## File Descriptions
FIle                                    Descriptions
------------------------------------------------------
attendance_checker.py          Main Python script that processes attendance data

Helpers/assets.csv             Student data : names, meails, attendance and abscence counts

Helpers/config.json            Configuration:thresholds and run mode

reports/reports.log            Output log of attendance alerts

## Example of one file
    {
    "thresholds": {
        "warning": 75,
        "failure": 50
    },
    "run_mode": "live",
    "total_sessions": 15
}

## Running the Python Tracker
After the script sets up the workspace:
 you can run the next command : - cd attendance_tracker_{input}
                                - pyhton3 attendance_checker.py
## Author
Daniella189-hub

