#!/usr/bin/python3
"""
0-subs
"""
import requests


def number_of_subscribers(subreddit):
    """
    Returns the number of subscribers for a given subreddit.
    If the subreddit is invalid, returns 0.
    """
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {
        "User-Agent": "MyRedditApp/0.1"
    }

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()
        subscribers = data["data"]["subscribers"]
        return subscribers
    else:
        return 0


if __name__ == '__main__':
    subreddit = input("Enter the name of the subreddit: ")
    num_subscribers = number_of_subscribers(subreddit)
    print(f"The subreddit '{subreddit}' has {num_subscribers} subscribers.")
