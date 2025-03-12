import pymysql
from datetime import datetime
import pandas as pd
pd.options.display.max_colwidth = 100

# Function to connect to the SQL database
def connect_sql():
    connected = False
    while not connected:
        # Prompt user for username and password
        input_user = input('Enter user: ')
        input_pass = input('Enter password: ')

        try:
            # Establish connection to the database
            cnx = pymysql.connect(
                host='localhost',
                user=input_user,  # Use the input username
                password=input_pass,
                db='clubs',
                charset='utf8mb4',
                cursorclass=pymysql.cursors.DictCursor
            )
            print("Successful! SQL connected.")
            connected = True

            cur = cnx.cursor()
            cur.callproc("update_all_categories_num_clubs")


            # Menu for database operations
            while True:
                # input_menu = input(
                #     'Choose item number to display(you can update, create, or delete after reading): 1: Clubs 2: Student 3: Event 4: Reservation 5: Annoucement(no updating or deleting available) 6: Budget(no updating or deleting available)\n'
                # )
                MENU = """
Menu:
1: Clubs
2: Students
3: Events
4: Reservations
5: Announcements (no updating or deleting available)
6: Budget (no deleting available)
7: Manage Student Attendance at Events
                """
                print(MENU)
                input_menu = input("Choose item number to display(you can update, create, or delete after reading): ")

                # Clubs menu
                while input_menu == '1':
                    try:
                        cur = cnx.cursor()
                        cur.callproc("readClubs", ()) 
                        rows = cur.fetchall() 
                        stmt_select_list_clubs = []

                        if rows:
                            print("Clubs List:")
                            display(pd.DataFrame.from_dict(rows).set_index("club_id"))
                            for row in rows:
                                club_id = row['club_id']
                                stmt_select_list_clubs.append(club_id)
                            CLUB_MENU = """
Club Menu:
1: Update 
2: Create 
3: Delete 
4: View Annoucements 
5: View treasurer + budget
6: Filter clubs by category name
7: Get events for a club
8: Back to main menu
                            """
                            print(CLUB_MENU)
                            input_club = input('Choose item number: \n')
                            # Update club
                            if input_club == '1':
                                input_c_club_id = input('Input club ID to update (choose from above list): ')
                                if int(input_c_club_id) in stmt_select_list_clubs:
                                    input_c_name = input('input club name: ').lower()
                                    input_c_description = input('input club description: ')
                                    input_c_contact_email = input('input contact email: ')
                                    try:
                                        # cur = cnx.cursor()
                                        cur.callproc("UpdateClub", (int(input_c_club_id), input_c_name, input_c_description, input_c_contact_email))  # Call stored procedure
                                        cnx.commit()
                                        # result = cur.fetchall() 
                                        # if result:
                                        print(f"Club updated to:", (int(input_c_club_id)), input_c_name, input_c_description, input_c_contact_email)
                                    except Exception as e:
                                        print(f"Error updating clubs: {e}")

                            # Create club
                            elif input_club == '2':
                                input_c_club_id = input(
                                    'Input club ID for the new club (club ID can not exist already): ')
                                if int(input_c_club_id) not in stmt_select_list_clubs:
                                    input_c_name = input('Input club name: ').lower()
                                    input_c_description = input('Input club description: ')
                                    input_c_contact_email = input('Input contact email: ')
                                    try:
                                        cur.callproc("CreateClub", (
                                        int(input_c_club_id), input_c_name, input_c_description,
                                        input_c_contact_email))
                                        cnx.commit()
                                        print(
                                            f"Club created: {int(input_c_club_id)}, {input_c_name}, {input_c_description}, {input_c_contact_email}")
                                    except Exception as e:
                                        print(f"Error creating the club: {e}")
                                        return
                                    try:
                                        cur = cnx.cursor()
                                        stmt_select = "SELECT DISTINCT name FROM categories ORDER BY name"
                                        cur.execute(stmt_select)
                                        rows = cur.fetchall()
                                        stmt_select_list = [row['name'].lower() for row in rows if
                                                            row['name']]

                                        if rows:
                                            display(pd.DataFrame.from_dict(rows))
                                    except Exception as e:
                                        print(f"Error fetching categories: {e}")
                                        return
                                    input_category_name = input('Assign category name: ').lower()
                                    if input_category_name in stmt_select_list:
                                        try:
                                            cur.execute(
                                                "SELECT category_id FROM categories WHERE LOWER(name) = %s",
                                                (input_category_name,))
                                            result = cur.fetchone()
                                            if result:
                                                category_id = result['category_id']
                                                cur.execute(
                                                    "INSERT INTO categories_clubs (category_id, club_id) VALUES (%s, %s)",
                                                    (category_id, input_c_club_id))
                                                cnx.commit()
                                                print(
                                                    f"Category '{input_category_name}' assigned to club '{input_c_club_id}'.")
                                        except Exception as e:
                                            print(f"Error assigning category: {e}")
                                            return
                                        try:
                                            cur.callproc("GetCategoryCount", (input_category_name,))
                                            cnx.commit()
                                            result = cur.fetchall()
                                            if result:
                                                category_count = result[0]
                                                print(
                                                    f"Category count for '{input_category_name}' updated to '{category_count}'")
                                        except Exception as e:
                                            print(f"Error updating category count: {e}")
                                            return
                                    else:
                                        print(
                                            "This category doesn't exist yet. Creating a new one...")
                                        cat_description_input = input(
                                            'Write description for category: ').lower()
                                        try:
                                            cur.callproc('CreateCategories', [input_category_name,
                                                                              cat_description_input])
                                            cnx.commit()
                                            print(f"New category '{input_category_name}' created.")
                                        except Exception as e:
                                            print(f"Error creating new category: {e}")
                                            return

                                        try:
                                            cur.execute(
                                                "SELECT category_id FROM categories WHERE LOWER(name) = %s",
                                                (input_category_name,))
                                            result = cur.fetchone()
                                            if result:
                                                category_id = result['category_id']
                                                cur.execute(
                                                    "INSERT INTO categories_clubs (category_id, club_id) VALUES (%s, %s)",
                                                    (category_id, input_c_club_id))
                                                cnx.commit()
                                                print(
                                                    f"New category '{input_category_name}' assigned to club '{input_c_club_id}'.")
                                        except Exception as e:
                                            print(f"Error assigning new category: {e}")
                                            return
                                        try:
                                            cur.callproc("GetCategoryCount", (input_category_name,))
                                            cnx.commit()
                                            result = cur.fetchall()
                                            if result:
                                                category_count = result[0]
                                                print(
                                                    f"Category count for '{input_category_name}' updated to '{category_count}'")
                                        except Exception as e:
                                            print(
                                                f"Error updating category count for new category: {e}")
                                            return


                            # delete club
                            elif input_club == '3':
                                input_c_club_id = input('Input club ID to delete: ')
                                confirm_delete = input("Are you sure you want to delete this club? Type 'yes' to confirm: ").lower()
                                if (confirm_delete == 'yes') and (int(input_c_club_id) in stmt_select_list_clubs):
                                    try:
                                        cur.execute("SELECT name, club_id FROM clubs WHERE club_id = %s", (int(input_c_club_id),))
                                        club_details = cur.fetchone()                                        
                                        cur.callproc("DeleteClub", (int(input_c_club_id),))
                                        cnx.commit()
                                        print(f"Club ('{club_details['name']}' (ID: {club_details['club_id']})) deleted successfully:(")
                                    except Exception as e:
                                        print(f"Error deleting club, confirmation denied or club id not found: {e}")

                            # view announcements
                            elif input_club == '4':
                                input_c_club_id = input('Input club ID to view annoucements: ')
                                try:
                                    cur.callproc("get_announcements_for_club", (int(input_c_club_id),))
                                    rows = cur.fetchall()
                                    if rows:
                                        display(pd.DataFrame.from_dict(rows))
                                except Exception as e:
                                    print(f"Error fetching announcements for club: {e}")

                            # view treasurer and budget
                            elif input_club == '5':
                                input_c_club_id = input('Input club ID to treasurer + budget: ')
                                try:
                                    cur.callproc("get_treasurer_budget", (int(input_c_club_id),))
                                    rows = cur.fetchall()
                                    if rows:
                                        display(pd.DataFrame.from_dict(rows))
                                except Exception as e:
                                    print(f"Error fetching treasurer budget: {e}")

                            # view clubs filtered by category
                            elif input_club == '6':
                                try:
                                    cur = cnx.cursor()
                                    cur.callproc('ReadCategory')
                                    rows = cur.fetchall()
                                    if rows:
                                        display(pd.DataFrame.from_dict(rows).set_index('category_id')) 
    
                                    stmt_select_list = []
                                    for row in rows:
                                        if(row['name']):
                                            name = row['name'].lower()
                                            stmt_select_list.append(name)

                                    input_category_name = input('input category name: ').lower()
                                    if input_category_name in stmt_select_list:
                                        print("valid category")
                                        c = cnx.cursor()
                                        c.callproc("get_clubs_in_category",(input_category_name,))
                                        result = c.fetchall()
                                        if result:
                                            print("category name result:", input_category_name)
                                            display(pd.DataFrame.from_dict(result).set_index('club_id'))
                                        else:
                                            print("No clubs found for this category.")
                                        c.close()
                                    else:
                                        print("invalid category name")
                                except Exception as e:
                                    print(f"Error fetching category name: {e}")

                            # get events by club id
                            elif input_club == '7':
                                c_club_id = int(input('input club id: '))
                                try:
                                    cur.callproc("GetEventsByClub", (c_club_id,))
                                    eventsRow = cur.fetchall()
                                    if eventsRow:
                                        display(pd.DataFrame.from_dict(eventsRow).set_index("event_title"))
                                except Exception as e:
                                    print(f"Error fetching events for club: {e}")
                            elif input_club == '8':
                                break
                        else:
                            print("No clubs found.")
                        cur.close()
                        break;
                    except Exception as e:
                        print(f"Error reading clubs: {e}")

                # students
                while input_menu == '2':
                    try:
                        cur = cnx.cursor()
                        cur.callproc("ReadStudents", ()) 
                        rows = cur.fetchall() 
                        stmt_select_list_students = []

                        if rows:
                            print("Students List:")
                            display(pd.DataFrame.from_dict(rows).set_index("member_id"))
                            for row in rows:
                                student_id = row['member_id']
                                stmt_select_list_students.append(student_id)

                            input_student = input('Choose item number: 1: Update 2: Create 3: Delete 4: Back to main menu\n')

                            # update student
                            if input_student == '1':
                                input_c_student_id = input('Input member ID to update (choose from above list): ')
                                if int(input_c_student_id) in stmt_select_list_students:
                                    input_c_first_name = input('first name: ')
                                    input_c_last_name = input('last name: ')
                                    input_c_email = input('student email: ').lower()
                                    input_c_grad_month = input('grad month(January, February, March, April, May, June, July, August, September, October, November, December): ')
                                    c_grad_year = input('graduation year: ')
                                    try:
                                        cur.callproc("UpdateStudent", (int(input_c_student_id), input_c_first_name, input_c_last_name, input_c_email, input_c_grad_month, int(c_grad_year))) 
                                        cnx.commit()
                                        print(f"Student updated to:", (int(input_c_student_id), input_c_first_name, input_c_last_name, input_c_email, input_c_grad_month, int(c_grad_year)))
                                    except Exception as e:
                                        print(f"Error updating student: {e}")           

                            # create student
                            elif input_student == '2':
                                input_c_student_id = input('Input student ID for the new student (student ID can not exist already): ')
                                if int(input_c_student_id) not in stmt_select_list_students: 
                                    input_c_first_name = input('first name: ')
                                    input_c_last_name = input('last name: ')
                                    input_c_email = input('student email: ').lower()
                                    input_c_grad_month = input('grad month(January, February, March, April, May, June, July, August, September, October, November, December): ')
                                    c_grad_year = input('graduation year: ')
                                    try:
                                        cur.callproc("CreateStudent", (int(input_c_student_id), input_c_first_name, input_c_last_name, input_c_email, input_c_grad_month, int(c_grad_year))) 
                                        cnx.commit()
                                        print(f"Student created:", (int(input_c_student_id), input_c_first_name, input_c_last_name, input_c_email, input_c_grad_month, int(c_grad_year))) 
                                    except Exception as e:
                                        print(f"Error creating student: {e}") 

                            # delete student
                            elif input_student == '3':
                                input_c_student_id = input('Input student ID to delete: ')
                                confirm_delete = input("Are you sure you want to delete this student? Type 'yes' to confirm: ").lower()
                                if (confirm_delete == 'yes') and (int(input_c_student_id) in stmt_select_list_students):
                                    try:
                                        cur.execute("SELECT first_name, last_name, member_id FROM student WHERE member_id = %s", (int(input_c_student_id),))
                                        student_details = cur.fetchone()                                        
                                        cur.callproc("DeleteStudent", (int(input_c_student_id),))
                                        cnx.commit()
                                        print(f"Student ('{student_details['first_name']}' (ID: {student_details['member_id']})) deleted successfully:(")
                                    except Exception as e:
                                        print(f"Error deleting student, confirmation denied or student id not found: {e}")
                            elif input_student == '4':
                                break

                        else:
                            print("No student found.")
                        cur.close()
                        break;
                    except Exception as e:
                        print(f"Error reading students: {e}")

                # events
                while input_menu == '3':
                    try:
                        cur = cnx.cursor()
                        cur.callproc("ReadEvents", ()) 
                        rows = cur.fetchall() 
                        stmt_select_list_events = []

                        if rows:
                            print("Events List:")
                            display(pd.DataFrame.from_dict(rows).set_index("event_id"))
                            for row in rows:
                                event_id = row['event_id']
                                stmt_select_list_events.append(event_id)

                            EVENT_MENU = """
Event Menu:
1: Update 
2: Create 
3: Delete 
4: Filter Events by Location
5: Filter Events by Date
6: Get all attendees of an event
7: Back to main menu
                            """
                            print(EVENT_MENU)
                            input_event = input('Choose item number: \n')

                            # update event
                            if input_event == '1':
                                input_c_event_id = input('Input event ID to update (choose from above list): ')
                                if int(input_c_event_id) in stmt_select_list_events:
                                    input_c_title = input('event title: ')
                                    input_c_event_description = input('event description: ')
                                    input_c_event_date = input('event date (YYYY-MM-DD): ')
                                    try:
                                        cur.callproc("UpdateEvent", (int(input_c_event_id), input_c_title, input_c_event_description, input_c_event_date))
                                        cnx.commit()
                                        print(f"Event updated to:", (int(input_c_event_id), input_c_title, input_c_event_description, input_c_event_date))
                                    except Exception as e:
                                        print(f"Error updating event: {e}")

                            # create event
                            elif input_event == '2':
                                input_c_event_id = input('Input event ID for the new event (event ID can not exist already: ')
                                if int(input_c_event_id) not in stmt_select_list_events: 
                                    input_c_title = input('event title: ')
                                    input_c_event_description = input('event description: ')
                                    input_c_event_date = input('event date (YYYY-MM-DD): ')
                                    try:
                                        cur.callproc("CreateEvent", (int(input_c_event_id), input_c_title, input_c_event_description, input_c_event_date))
                                        cnx.commit()
                                        print(f"Event created:", (int(input_c_event_id), input_c_title, input_c_event_description, input_c_event_date))
                                    except Exception as e:
                                        print(f"Error creating event: {e}")

                            # delete event
                            elif input_event == '3':
                                input_c_event_id = input('Input event ID to delete: ')
                                confirm_delete = input("Are you sure you want to delete this event? Type 'yes' to confirm: ").lower()
                                if (confirm_delete == 'yes') and (int(input_c_event_id) in stmt_select_list_events):
                                    try:
                                        cur.execute("SELECT title, event_id FROM events WHERE event_id = %s", (int(input_c_event_id),))
                                        event_details = cur.fetchone()                                        
                                        cur.callproc("DeleteEvent", (int(input_c_event_id),))
                                        cnx.commit()
                                        print(f"Event ('{event_details['title']}' (ID: {event_details['event_id']})) deleted successfully:(")
                                    except Exception as e:
                                        print(f"Error deleting event, confirmation denied or event id not found: {e}")

                            # get events by location
                            elif input_event == '4':
                                try:
                                    cur = cnx.cursor()
                                    cur.callproc("read_campus_location", ())
                                    rows = cur.fetchall()

                                    if rows:
                                        print("Campus Locations:")
                                        display(pd.DataFrame.from_dict(rows))

                                    building = input('Input building: ')
                                    room_num = input('Room number: ')
                                    cur.callproc("get_events_by_location", (building, room_num))
                                    rows = cur.fetchall()
                                    if rows:
                                        display(pd.DataFrame.from_dict(rows).set_index('event_id'))
                                except Exception as e:
                                    print(f"Error reading events: {e}")

                            # get events by time
                            elif input_event == '5':
                                try:
                                    event_start_date = input('Start date (YYYY-MM-DD): ')
                                    event_end_date = input('End date (YYYY-MM-DD): ')

                                    # event_start_date = datetime.strptime(event_start_date, '%Y-%m-%d').strftime('%Y-%m-%d')
                                    # event_end_date = datetime.strptime(event_end_date, '%Y-%m-%d').strftime('%Y-%m-%d')

                                    cur.callproc("get_events_by_date", (event_start_date, event_end_date))
                                    rows = cur.fetchall()
                                    if rows:
                                        display(pd.DataFrame.from_dict(rows).set_index('event_id'))
                                except Exception as e:
                                    print(f"Error reading events: {e}")

                            # get event attendees
                            elif input_event == '6':
                                input_event_id = input('Input event ID: ')
                                if int(input_event_id) in stmt_select_list_events:
                                    print("valid event id ")
                                    try:
                                        c = cnx.cursor()
                                        c.callproc("get_event_attendees", (int(input_event_id),))

                                        result = c.fetchall()
                                        if result:
                                            print("event attendees:", input_event_id)
                                            display(pd.DataFrame.from_dict(result))
                                        else:
                                            print("No attendees found for this event.")
                                        c.close()
                                    except Exception as e:
                                        print(f"Error getting event attendees: {e}")
                                else:
                                    print("invalid event id")
                        
                            elif input_event == '7':
                               break
                        else:
                            print("No events found.")
                        cur.close()
                        break;
                    except Exception as e:
                        print(f"Error reading events: {e}")

                # reservations
                while input_menu == '4':
                    try:
                        cur = cnx.cursor()
                        cur.callproc("ReadReservations", ()) 
                        rows = cur.fetchall() 
                        stmt_select_list_reservations = []
                        if rows:
                            print("Reservations List:")
                            display(pd.DataFrame.from_dict(rows).set_index("room_reservation_id").sort_values(["location_id", "start_time"]))
                            for row in rows:
                                reservation_id = row['room_reservation_id']
                                stmt_select_list_reservations.append(reservation_id)
                            input_reservation = input('Choose item number: 1: Update 2: Create 3: Delete 4: Back to main menu\n')

                            # update reservation
                            if input_reservation == '1':
                                input_c_reservation_id = input('Input reservation ID to update (choose from above list): ')
                                if int(input_c_reservation_id) in stmt_select_list_reservations:
                                    c_event_id = input('event id: ')

                                    c_start_date = datetime.strptime(input('start_date (YYYY-MM-DD): '), '%Y-%m-%d').date()
                                    c_start_time = datetime.strptime(input('start_time (HH:MM:SS): '), '%H:%M:%S').time()
                                    c_end_date = datetime.strptime(input('end_date (YYYY-MM-DD): '), '%Y-%m-%d').date()
                                    c_end_time = datetime.strptime(input('end_time (HH:MM:SS): '), '%H:%M:%S').time()
                                    c_start_datetime = datetime.combine(c_start_date, c_start_time)
                                    c_end_datetime = datetime.combine(c_end_date, c_end_time)
                                    
                                    c_location_id = input('location id: ')

                                    try:
                                        cur.callproc("UpdateReservation", (int(input_c_reservation_id), int(c_event_id), c_start_datetime, c_end_datetime, int(c_location_id)))
                                        cnx.commit()
                                        print(f"Reservation updated to:", (int(input_c_reservation_id), int(c_event_id), c_start_datetime, c_end_datetime, int(c_location_id)))
                                    except Exception as e:
                                        print(f"Error updating reservation: {e}")

                            # create reservation
                            elif input_reservation == '2':
                                input_c_reservation_id = input('Input reservation ID for the new event (reservation ID can not already exist): ')
                                if int(input_c_reservation_id) not in stmt_select_list_reservations: 
                                    c_event_id = input('event id: ')
                                    c_start_date = datetime.strptime(input('start_date (YYYY-MM-DD): '), '%Y-%m-%d').date()
                                    c_start_time = datetime.strptime(input('start_time (HH:MM:SS): '), '%H:%M:%S').time()
                                    c_end_date = datetime.strptime(input('end_date (YYYY-MM-DD): '), '%Y-%m-%d').date()
                                    c_end_time = datetime.strptime(input('end_time (HH:MM:SS): '), '%H:%M:%S').time()
                                    c_start_datetime = datetime.combine(c_start_date, c_start_time)
                                    c_end_datetime = datetime.combine(c_end_date, c_end_time)
                                    cur.callproc("read_campus_location")
                                    rows = cur.fetchall()
                                    if rows:
                                        display(pd.DataFrame.from_dict(rows).sort_values('location_id'))

                                    c_location_id = input('location id: ')
                                    try:
                                        cur.callproc("CreateRoomReservation", (int(input_c_reservation_id), int(c_event_id), c_start_datetime, c_end_datetime, int(c_location_id)))
                                        cnx.commit()
                                        print(f"Reservation created:", (int(input_c_reservation_id), int(c_event_id), c_start_datetime, c_end_datetime, int(c_location_id)))
                                    except Exception as e:
                                        print(f"Error creating reservation: {e}")

                            # delete reservation
                            elif input_reservation == '3':
                                input_c_reservation_id = input('Input reservation ID to delete: ')
                                confirm_delete = input("Are you sure you want to delete this reservation? Type 'yes' to confirm: ").lower()
                                if (confirm_delete == 'yes') and (int(input_c_reservation_id) in stmt_select_list_reservations):
                                    try:
                                        cur.execute("SELECT room_reservation_id, event_id, start_time, end_time, location_id FROM room_reservations WHERE room_reservation_id = %s", (int(input_c_reservation_id),))
                                        reservation_details = cur.fetchone()                                        
                                        cur.callproc("DeleteReservation", (int(input_c_reservation_id),))
                                        cnx.commit()
                                        print(f"Reservation (ID: {reservation_details['room_reservation_id']}) deleted successfully:(")
                                    except Exception as e:
                                        print(f"Error deleting reservation, confirmation denied or reservation id not found: {e}")
                            elif input_reservation == '4':
                               break
                        else:
                            print("No reservations found.")
                        cur.close()
                        break;
                    except Exception as e:
                        print(f"Error reading reservations: {e}")

                # announcements
                while input_menu == '5':
                    try:
                        cur = cnx.cursor()
                        cur.callproc("ReadClubAnnouncements", ()) 
                        rows = cur.fetchall() 
                        if rows:
                            print("Club Annoucements List:")
                            display(pd.DataFrame.from_dict(rows).set_index("posted_time"))

                            ANNOUCEMENT_MENU = """
                            Annoucement Menu:
                            1: Create 
                            2: Filter By Club 
                            3: Back to main menu 
                            """
                            print(ANNOUCEMENT_MENU)
                            input_announcement = input('Choose item number: \n')

                            # create announcement
                            if input_announcement == '1':
                                c_club_id = input('Club id: ')
                                c_title = input('Title: ')
                                c_message = input('Message: ')
                                c_posted_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                                try:
                                    cur.callproc("CreateClubAnnouncement", (int(c_club_id), c_title, c_message, c_posted_time))
                                    cnx.commit()
                                    print(f"Announcement created:", (int(c_club_id), c_title, c_message, c_posted_time))
                                except Exception as e:
                                    print(f"Error creating annoucement: {e}")

                            # view announcements by club
                            elif input_announcement == '2':
                                input_c_club_id = input('Input club ID to view annoucements: ')
                                try:
                                    cur.callproc("get_announcements_for_club", (int(input_c_club_id),))
                                    rows = cur.fetchall()
                                    if rows:
                                        display(pd.DataFrame.from_dict(rows).set_index("posted_time"))
                                except Exception as e:
                                    print(f"Error getting annoucements for club: {e}")
                            elif input_announcement == '3':
                               break
                        else:
                            print("No Announcements found.")
                        cur.close()
                        break
                    except Exception as e:
                        print(f"Error reading announcements: {e}")

                # budget
                while input_menu == '6':
                    try:
                        cur = cnx.cursor()
                        cur.callproc("ReadBudget", ()) 
                        rows = cur.fetchall() 
                        if rows:
                            display(pd.DataFrame.from_dict(rows).set_index("club_id"))
                            BUDGET_MENU = """
Budget Menu:
1: Update 
2: Get Budgets By Year
3: Get Treasurer And Budget 
4: Back to main menu
                            """
                            print(BUDGET_MENU)
                            input_budget = input('Choose item number: \n')

                            # update budget for club
                            if input_budget == '1':
                                c_club_id = input('club id: ')
                                c_year = input('year: ')
                                c_amount = input('amount: ')
                                try:
                                    cur.callproc("UpdateBudget", (int(c_club_id), int(c_year), c_amount))
                                    cnx.commit()
                                    print(f"Budget updated to:", (int(c_club_id), int(c_year), c_amount))
                                except Exception as e:
                                    print(f"Error updating Budget: {e}")

                            # get budget by year
                            elif input_budget == '2':
                                c_club_year = int(input('input year: '))
                                try:
                                    cur.callproc("GetClubsBudget", (c_club_year,))
                                    budgetrows = cur.fetchall()
                                    if budgetrows:
                                        display(pd.DataFrame.from_dict(budgetrows).set_index("name"))
                                except Exception as e:
                                    print(f"Error getting budgets: {e}")

                            # get treasurer and budget for a club
                            elif input_budget == '3':
                                input_c_club_id = input('Input club ID to treasurer + budget: ')
                                try:
                                    cur.callproc("get_treasurer_budget", (int(input_c_club_id),))
                                    rows = cur.fetchall()
                                    if rows:
                                        display(pd.DataFrame.from_dict(rows).set_index("year"))
                                except Exception as e:
                                    print(f"Error getting treasurer budget: {e}")
                            elif input_budget == '4':
                                   break
                        else:
                            print("No Budget found.")
                        cur.close()
                        break;
                    except Exception as e:
                        print(f"Error reading budget: {e}")

                # event attendance (hosts table)
                while input_menu == '7':
                    try:
                        cur = cnx.cursor()
                        stmt_select = "select * from hosts_table"
                        cur.execute(stmt_select)
                        rows = cur.fetchall()

                        if rows:
                            display(pd.DataFrame.from_dict(rows))
                        else:
                            print("No records found")

                        ATTENDANCE_MENU = """
                            Attendance Menu:
                            1: Add attendance record
                            2: Delete attendance record
                            3: Show all records
                            4: Back to main menu
                        """
                        print(ATTENDANCE_MENU)
                        input_attendance = input("Choose item number:\n")

                        if input_attendance == "1":
                            c_member_id = int(input("Student ID: "))
                            c_event_id = int(input("Event ID: "))
                            c_club_id = int(input("Club ID: "))
                            try:
                                cur.callproc("AddEventAttendance", (c_member_id, c_event_id, c_club_id))
                                cnx.commit()
                                print(f"Record added: Student {c_member_id}, Event {c_event_id}, Club {c_club_id}")
                            except Exception as e:
                                print(f"Error updating attendance: {e}")

                        elif input_attendance == "2":
                            c_member_id = int(input("Student ID: "))
                            c_event_id = int(input("Event ID: "))
                            c_club_id = int(input("Club ID: "))
                            try:
                                cur.callproc("DeleteEventAttendance", (c_member_id, c_event_id, c_club_id))
                                cnx.commit()
                                print(f"Record removed: Student {c_member_id}, Event {c_event_id}, Club {c_club_id}")
                            except Exception as e:
                                print(f"Error updating attendance: {e}")

                        elif input_attendance == "3":
                            with pd.option_context('display.max_rows', None):
                                display(rows)

                        elif input_attendance == "4":
                            break

                        cur.close()
                        break;
                    except Exception as e:
                        print(f"Error reading attendance: {e}")


        except pymysql.MySQLError as e:
            print(f"Connection failed: {e}")
        except Exception as e:
            print(f"Unexpected error: {e}")


# Call the function to execute
connect_sql()
