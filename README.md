# Campus-Club-Tracker
Introduction
Campus Club Tracker (CCT) is an application designed to streamline and enhance the management of student clubs at universities. It acts as a bridge between students and various campus organizations, allowing for seamless interaction and engagement. The system enables users to discover clubs and events based on their interests, such as cultural, academic, or sports-related categories. It provides a transparent view of club activities, event details, and membership roles. University club managers can use the platform to manage events, budgets, and announcements, ensuring smooth operations and clear communication between all parties involved.
README
Club Management System

Overview
This Python application connects to a MySQL database designed to manage club-related information such as students, events, budgets, and announcements. It provides a user-friendly interface to perform CRUD operations, filter data, and retrieve meaningful insights. The system is built to streamline club operations and make data management intuitive.

Features
	CRUD Operations:
		Manage Students, Clubs, Events, Reservations, and more.
	Category-Based Operations:
		Filter clubs by category.
		Automatically update the number of clubs per category.
	Event Management:
		Filter events by date and location.
		View event attendees.
	Budgeting:
		View and update club budgets.
	Announcements:
		Create and view club announcements.
	Automated Updates:
		Automatic triggers for budget and category counts.

Required Software
Python: 
	Ensure Python 3.x is installed. (Download Python | Python.org)
	Required libraries:
pandas (Installation — pandas 2.2.3 documentation)
pymysql (https://pymysql.readthedocs.io/en/latest/user/installation.html)
MySQL: 
	Install and run MySQL. (MySQL :: Download MySQL Installer)
Python environment:
This program is suited for use in an interactive Python environment like a Jupyter notebook. Installation instructions for Jupyter can be found here: https://jupyter.org/install. We cannot guarantee that all functionalities, such as pandas DataFrame displays, will work in a non-interactive environment.
Required Database:
Run the provided dump file to mysql to set up the database and sample data.

Running the Application
	1. Ensure the database schema exists in MySQL and the server is active.
2. Open a terminal or command prompt.
	3. Navigate to the directory where the Python script is saved:
		ex. 'cd /path/to/your/project'
	4. Run the clubs.py application in an interactive notebook:
		The following command should initialize the application:
from clubs import connect_sql

Sample Setup using JupyterLab
Ensure MySQL is active and working; create the database schema and all data, triggers, etc. using the dump file.
Download the clubs.py file in your desired directory.
Run JupyterLab following the Jupyter installation instructions above.
Create a Python notebook (.ipynb) file in the same directory as clubs.py and run the “from clubs import connect_sql” command (ensure all required libraries are installed).
The credential input fields should appear, followed by the program menu.

Usage Instructions
	Login:
		Enter your MySQL username and password when prompted.
		The application connects to the clubs database.
	Main Menu:
		Choose from various options (e.g., clubs, announcements, budgets, etc.)
	Perform Operations:
Follow prompts to create, update, delete, or view data for clubs, events, students, and more.
		Each operation is guided by interactive menus.
	Exit:
		Use menu options to quit or disconnect safely.

Key Functionalities
	Clubs Management:
		CRUD operations
		View Club Announcements, Treasurer, Events, and Budgets.
		Filter Clubs By Categories
	Events Management:
		CRUD operations
		Filter events by date and location.
		Retrieve attendees for specific Events.
	Student Management:
		CRUD operations
	Budgets:
		Update and view Budgets by club and year.
		View Budgets of a certain year.
		View Treasurer of a Budget
	Automation:
Triggers automatically handle budget initialization and category count updates and also prevent overlapping reservations from being made.
	Additional Notes
		Error Handling:
The application provides error messages for invalid inputs or database issues.
	Interactive Menus:
		All operations are menu-driven for ease of use.
	Scalability:
Designed to accommodate additional features like new tables or procedures.

Walkthrough Example of Using the App
Step 1:
	Run the application, the user is prompted for their username
	Write the username in the terminal and press enter
Step 2:
	The user is now prompted for their password
	Write the password and then press enter
Step 3:
	The Menu has Popped Up now
	Let's Press 1 and Look at Clubs
Step 4:
	All Clubs are listed through a read operation
	A Second Menu has come up to allow further operations with clubs
Step 5:
	Say we press 3 because we want to delete a club
	The user is prompted the club ID for which they want to delete
Step 6:
	We are asked if want to confirm are choice
	"yes" is typed and the club is deleted
	The main menu has come back up after the deletion
Technical Specifications
Technology Stack:
Front end: Python 3.x with pymysql library for database interaction and pandas for data handling.
Database: MySQL for data persistence.
Triggers and Stored Procedures: Used to automate updates and ensure data integrity.
Database Size:
Capable of managing thousands of records for clubs, students, events, and associated data.
Database Description
The database contains information about different clubs on campus. A club may belong to one or more categories (sports, culture, career, etc.) Each club has a unique club ID, name, description, contact email, year of establishment, and budget. A category can be associated with zero to many clubs and has a unique category_id, name, and description. The database records the number of clubs in each category.
A student has a unique student_id, a first and last name, a unique email address, and a graduation month and year. A student can also be a treasurer for a specific club, and the database records their start and end dates.
A club runs events on a specific date. Each event has an id, title, event date, and description. Some events can be run by multiple clubs as collaborations. Events are attended by zero to many students, and a student can attend zero to many events.
Each event is associated with one or more room reservations. A room reservation contains a start and end time, and it is associated with a location on campus, uniquely identified by a building and room number. A campus location is associated with multiple room reservations but only one reservation can take place at a time.
A club can send out announcements at a specified time. Each announcement has an ID, title, and message. A club also has a budget, and the database records the budget amount and corresponding year.
