import dartmod
import sys
def multiply(a,b):
    print("Will compute", a, "times", b)
    dartmod.calledFromPython()
    print(sys.version)
    return a*b
