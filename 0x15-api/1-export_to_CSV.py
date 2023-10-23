#!/usr/bin/python3
"""
This script retrieves and displays information about an employee's
TODO list progress from a REST API and exports it to a CSV file.
"""

import requests
import sys
import csv


def get_employee_todo_progress(employee_id):
    # API URL to retrieve employee information
    base_url = "https://jsonplaceholder.typicode.com"
    user_url = f"{base_url}/users/{employee_id}"

    # Fetch employee data
    response = requests.get(user_url)
    employee_data = response.json()

    # Fetch the user's TODO list
    todo_url = f"{base_url}/todos?userId={employee_id}"
    response = requests.get(todo_url)
    todo_list = response.json()

    # Prepare CSV file name
    user_id = employee_data['id']
    file_name = f"{user_id}.csv"

    # Define the header row
    header_row = ["USER_ID", "USERNAME", "TASK_COMPLETED_STATUS", "TASK_TITLE"]

    # Open and write the CSV file
    with open(file_name, mode='w', newline='') as file:
        writer = csv.writer(file, quoting=csv.QUOTE_ALL)
        writer.writerow(header_row)

        # Write the data rows
        for task in todo_list:
            writer.writerow([user_id, employee_data['username'],
                             str(task['completed']), task['title']])


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 1-export_to_CSV.py <employee_id>")
        sys.exit(1)

    employee_id = int(sys.argv[1])
    get_employee_todo_progress(employee_id)
