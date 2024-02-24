import sys

def get_int_cmdln_argument( nrarg):
    nr_arg_expected = nrarg
    intarg = [0] * nr_arg_expected

    if len(sys.argv) > nr_arg_expected:
        for nr_arg in range(nr_arg_expected):
            try:
               intarg[nr_arg] = int(sys.argv[nr_arg + 1])
               #print ( sys.argv[nr_arg + 1])
               # check here if the input is reasonable if not exit
            except ValueError:
               print("Please enter ", nrarg ," integers")
               exit()
            
    else:
        print(f"program {sys.argv[0]} needs at least {nr_arg_expected} arguments")
        exit()
        return -1

    #print(f"start program {sys.argv[0]} with arguments:")
    #for nr_arg in range(nr_arg_expected):
    #    print(f"arg {nr_arg}, in {sys.argv[nr_arg + 1]}, result in int: {intarg[nr_arg]}") 
    return intarg

