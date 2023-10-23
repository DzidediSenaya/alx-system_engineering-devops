#!/usr/bin/python3
"""Exports to-do list information of all employees to JSON format."""
import json
import requests
import sys


def fetch_user_data(user_id):
    """
    Fetch user data from JSONPlaceholder API for the given user ID.

    Args:
        user_id (str): ID of the user to fetch.

    Returns:
        dict: User data as a dictionary.
    """
    base_url = "https://jsonplaceholder.typicode.com"
    user_url = f"{base_url}/users/{user_id}"
    user_response = requests.get(user_url)
    if user_response.status_code != 200:
        print("User not found")
        sys.exit()
    return user_response.json()


def fetch_user_tasks(user_id):
    """
    Fetch tasks for a user from JSONPlaceholder API for the given user ID.

    Args:
        user_id (str): ID of the user to fetch tasks for.

    Returns:
        list: List of task data for the user.
    """
    base_url = "https://jsonplaceholder.typicode.com"
    todos_url = f"{base_url}/todos?userId={user_id}"
    todos_response = requests.get(todos_url)
    if todos_response.status_code != 200:
        print("Tasks not found")
        sys.exit()
    return todos_response.json()


if __name__ == "__main__":
    if len(sys.argv) == 1:
        sys.exit()

    user_id = sys.argv[1]

    user_data = fetch_user_data(user_id)
    user_id = str(user_data['id'])
    username = user_data['username']

    todos_data = fetch_user_tasks(user_id)

    user_tasks = []
    for task in todos_data:
        task_data = {
            "username": username,
            "task": task["title"],
            "completed": task["completed"]
        }
        user_tasks.append(task_data)

    all_employees_data = {user_id: user_tasks}

    with open("todo_all_employees.json", "w") as json_file:
        json.dump(all_employees_data, json_file)
