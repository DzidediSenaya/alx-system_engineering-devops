#!/usr/bin/python3
"""
This script retrieves and displays information about an employee's
TODO list progress from a REST API and exports it to a JSON file.
"""

import csv
import requests
import sys


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

    # Prepare the data for JSON export
    user_id = employee_data['id']
    json_data = {str(user_id): []}

    for task in todo_list:
        task_data = {
            "task": task['title'],
            "completed": task['completed'],
            "username": employee_data['username']
        }
        json_data[str(user_id)].append(task_data)

    # Export the data to a JSON file
    file_name = f"{user_id}.json"
    with open(file_name, 'w') as json_file:
        json.dump(json_data, json_file, indent=4)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 2-export_to_JSON.py <employee_id>")
        sys.exit(1)

    employee_id = int(sys.argv[1])
    get_employee_todo_progress(employee_id)
