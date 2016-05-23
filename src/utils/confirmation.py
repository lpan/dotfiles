"""
confirm an operation
return Bool
"""

def confirm(question, proceed, abort):
    """
    string question
    string proceed -- will print if user proceeds
    string abort -- will print if user aborts
    """

    print(question + " [y/n] ", end="")
    answer = input()

    if (answer == 'N' or answer == 'n'):
        print(abort)
        return False

    print(proceed)
    return True

if (__name__ == '__main__'):
    confirm('You sure bro?', 'DAT BOI', 'kk')
