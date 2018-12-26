import sys

def get_env(user_input):

    if (user_input == "--desktop" or user_input == "-d"):
        return "desktop"

    elif (user_input == "--server" or user_input == "-s"):
        return "server"

    elif (user_input == "--osx" or user_input == "-o"):
        return "osx"

    else:
        print("usage: [--desktop] [--server] [--osx]")
        sys.exit(0)

if (__name__ == '__main__'):
    get_env('hello')
