**AI-Enhanced Role-Based Linux System Automation Suite**

The **AI-Enhanced Role-Based Linux System Automation Suite** is a Bash and Python based automation framework designed to simplify Linux system administration tasks.It provides a **menu-driven interface with role-based access control**, allowing administrators and regular users to perform system operations safely and efficiently.The system integrates **automation scripts, monitoring tools, AI-based predictions, and reporting features** to help manage Linux environments with minimal manual effort.

**Features**

- **Role-Based Access Control**
  - Secure Login system
  - 2 user roles
    - ADMIN : Full access access
    - USER : Limited access to utility tools

- **System Administration Modules**
  - **System Update –** Update and upgrade system packages
  - **System Health Monitoring –** Monitor CPU, memory, and disk usage
  - **Log Analyzer –** Analyze system logs for insights
  - **File Organizer –** Automatically organize files into categories
  - **Backup Mechanism –** Create backups and log backup activities
  - **User Activity Tracker –** Track system user activities

- **Utility Modules**
  - **Personal Expense Tracker –** Track and store expenses
  - **Web Scraper & Notification System –** Extract information from websites and notify users

- **AI Modules (Python)**
  - **Disk Usage Prediction –** Predict future disk usage based on history
  - **AI Guided Database Management –** Monitor and maintain system database
  - **AI Guided Recommendations –** Provide system optimization suggestions

- **Reporting System**
  - Generate system reports summarizing activities and performance.

**Project Structure**

AI-Linux-Automation/

│

├── main.sh \# Main entry script (login \+ menu controller)

│

System Admin

├── update.sh \# System update module

├── monitor.sh \# System health monitoring

├── log_analyzer.sh \# System log analysis

├── file_organizer.sh \# File organization automation

├── backup.sh \# Backup management

├── user_activity.sh \# User activity tracking

│
Utility

├── expense_tracker.sh \# Personal expense tracker

├── web_scraper.sh \# Web scraping & notification tool

│

AI

├── ai_predict.py \# AI disk usage prediction

├── database_watcher.py \# AI database monitoring

├── ai_decision.py \# AI system recommendations

│
Reporting

├── generate_report.py \# Reporting system

│
Data_Storage

├── users.db \# User authentication database

├── disk_history.csv \# Disk usage history data

├── expenses.csv \# Expense tracker data

│
Data_Storage/logs

├── logs/

│ ├── system.log

│ ├── backup.log

│ └── activity.log

└── Readme.md \# System configuration file

**Requirements**

1. **Software**
   1. Linux OS
   2. Bash
   3. Python 3
2. **Python Libraries**
   1. pip install matplotlib pandas numpy
   2. pip install scikit-learn
3. **How to Run**
   1. Clone or Download the Project
      1. git clone \<repository-url\>
      2. cd AI-Linux-Automation
   2. Make Scripts Executable
      1. chmod \+x \*.sh
   3. Run the Main Script
      1. ./[main.sh](http://main.sh)

4. **How It Works**
   1. User runs `main.sh`
   2. Login system verifies credentials from **users.db**
   3. System assigns role (**ADMIN or USER**)
   4. Menu interface appears
   5. User selects modules to execute automation tasks
5. **Example Workflow**
   Start Program
   ↓
   User Login
   ↓
   Role Detection
   ↓
   Main Menu
   ↓
   Select Module
   ↓
   Execute Script
   ↓
   Log Results
6. **Data Storage**

| File                 | Purpose                               |
| -------------------- | ------------------------------------- |
| **users.db**         | **User authentication**               |
| **disk_history.csv** | **Disk usage data for AI prediction** |
| **expenses.csv**     | **Stores personal expenses**          |
| **logs/**            | **System activity logs**              |
