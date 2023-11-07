#!/usr/bin/python3
"""
2-recurse
"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """
    Recursively retrieves the titles of all hot articles for a given subreddit.
    If the subreddit is invalid or no results are found, returns None.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=100"
    headers = {
        "User-Agent": "MyRedditApp/1.0"
    }

    if after:
        url += f"&after={after}"

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()
        posts = data.get("data", {}).get("children", [])
        if not posts:
            return hot_list
        else:
            for post in posts:
                title = post.get("data", {}).get("title")
                hot_list.append(title)
            after = data.get("data", {}).get("after")
            if after:
                return recurse(subreddit, hot_list, after)
            else:
                return hot_list
    else:
        return None


if __name__ == '__main__':
    subreddit = input("Enter the name of the subreddit: ")
    result = recurse(subreddit)
    if result is not None:
        print(len(result))
    else:
        print("None")
