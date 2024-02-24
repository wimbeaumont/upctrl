import sys
import arg_utils


def main(): 
    intarg=arg_utils.get_int_cmdln_argument( 2)
    print("passed argument ", intarg)
if __name__ == "__main__":
    sys.exit(main())
