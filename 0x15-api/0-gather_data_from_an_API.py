#!/usr/bin/python3
"""
This script retrieves and displays information about an employee's
TODO list progress from a REST API.
"""

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

    # Calculate the number of completed tasks and total tasks
    total_tasks = len(todo_list)
    completed_tasks = sum(1 for task in todo_list if task['completed'])

    # Display the results
    employee_name = employee_data['name']
    task_summary = (
        f"Employee {employee_name} is done with tasks"
        f"({completed_tasks}/{total_tasks}):"
    )
    print(task_summary)

    for task in todo_list:
        if task['completed']:
            print(f"\t {task['title']}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 0-gather_data_from_an_API.py <employee_id>")
        sys.exit(1)

    employee_id = int(sys.argv[1])
    get_employee_todo_progress(employee_id)
