#!/usr/bin/python3
"""Exports to-do list information of all employees to JSON format."""
import json
import requests


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    users = requests.get(url + "users").json()

    all_employees_data = {}

    for user in users:
        user_id = user.get("id")
        username = user.get("username")
        todos = requests.get(url + "todos", params={"userId": user_id}).json()

        user_tasks = []

        for todo in todos:
            task_data = {
                "username": username,
                "task": todo.get("title"),
                "completed": todo.get("completed")
            }
            user_tasks.append(task_data)

        all_employees_data[user_id] = user_tasks

    with open("todo_all_employees.json", "w") as jsonfile:
        json.dump(all_employees_data, jsonfile)
