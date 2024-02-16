def ar2decvalue(ar):
    value = 0
    size = len(ar)
    for cnt in range(size - 1, -1, -1):
        value = value << 1
        if ar[cnt] > 0:
            value |= 1
    return value

def decvalue2binar(value, size):
    err = 0
    if value < 0:
        value = 0
        err = -1
    ar = [0] * size
    for cnt in range(size):
        ar[cnt] = 1 if (value & 1) else 0
        value = value >> 1
    return err, ar

def parity(ar):
    val = sum(1 for x in ar if x > 0)
    return val & 1

def inv_bin_array(ar):
    size = len(ar)
    for cnt in range(size):
        ar[cnt] = 0 if ar[cnt] else 1

def print_bin_arry_status(ar):
    size = len(ar)
    for cnt in range(size - 1, -1, -1):
        print("-1" if ar[cnt] else "-0")
    print("-")

def print_dec_as_bin_array_status(value, nr_bits):
    err, print_ar = decvalue2binar(value, nr_bits)
    print_bin_arry_status(print_ar)
    return err

