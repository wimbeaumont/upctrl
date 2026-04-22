import sys
import arg_utils


def main(): 
    #there is no check if the input is an integer 
    intarg=arg_utils.get_int_cmdln_argument( 2)
    # a list is returned 
    arg1=intarg[0]
    arg2=intarg[1]
    print("passed argument ", arg1 , arg2 )
if __name__ == "__main__":
    sys.exit(main())
