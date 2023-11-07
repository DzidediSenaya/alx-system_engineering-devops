#!/usr/bin/python3
"""
100-count
"""
import requests


def count_words(subreddit, word_list, after=None, word_count={}):
    """
    Recursively counts and prints the keywords from
    the titles of hot articles in a subreddit.
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
            sorted_results = sorted(word_count.items(),
                                    key=lambda x: (-x[1], x[0]))
            for keyword, count in sorted_results:
                print(f"{keyword}: {count}")
            return

        for post in posts:
            title = post.get("data", {}).get("title", "").lower()
            for keyword in word_list:
                keyword = keyword.lower()
                if title and f' {keyword} ' in title:
                    word_count[keyword] = word_count.get(keyword, 0) + 1

        after = data.get("data", {}).get("after")
        return count_words(subreddit, word_list, after, word_count)


if __name__ == '__main__':
    import sys

    if len(sys.argv) < 3:
        print("Usage: {} <subreddit> <list of keywords>".format(sys.argv[0]))
        print("Exi: {} programming 'python java javascript'"
              .format(sys.argv[0]))
    else:
        subreddit = sys.argv[1]
        word_list = sys.argv[2].split()
        count_words(subreddit, word_list)
