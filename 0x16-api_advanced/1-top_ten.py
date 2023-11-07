#!/usr/bin/python3
"""
1-top_ten
"""
import requests


def top_ten(subreddit):
    """
    Prints the titles of the first 10 hot posts for a given subreddit.
    If the subreddit is invalid, prints None.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=10"
    headers = {
        "User-Agent": "MyRedditApp/1.0"
    }

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()
        posts = data.get("data", {}).get("children", [])
        if not posts:
            print("No hot posts found for this subreddit.")
        else:
            for post in posts:
                title = post.get("data", {}).get("title")
                print(title)
    else:
        print(None)


if __name__ == '__main__':
    subreddit = input("Enter the name of the subreddit: ")
    top_ten(subreddit)
