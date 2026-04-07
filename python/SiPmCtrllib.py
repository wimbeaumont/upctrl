import ctypes 

SiPmCntrl_lib = ctypes.cdll.LoadLibrary("libSiPmCtrllib.so")

setBaisVoltagePy=SiPmCntrl_lib._Z14setBiasVoltageif
setBaisVoltagePy.argtypes  = [ctypes.c_int,ctypes.c_float ]
setBaisVoltagePy.restype = ctypes.c_int

setDiscriminatorLevelPy=SiPmCntrl_lib._Z21setDiscriminatorLevelif
setDiscriminatorLevelPy.argtypes  = [ctypes.c_int,ctypes.c_float ]
setDiscriminatorLevelPy.restype = ctypes.c_int


def main():
    import time
    bias =0
    dlvl=0.5
    while ( bias < 65 ) :
       errorcode=setBaisVoltagePy(0 , bias)
       time.sleep(0.01)
       errorcode=setBaisVoltagePy(1 , bias)
       bias =bias +1 
       print("bias set to ",bias ," digval= " ,int(bias/0.0342)," error " ,errorcode)
       time.sleep(1)
    while ( dlvl  <2.5) :
        errorcode=setDiscriminatorLevelPy(1 , dlvl)
        time.sleep(0.01)
        errorcode=setDiscriminatorLevelPy(0 , dlvl)
        dlvl=dlvl+.02
        print("discrimiator level set to ", dlvl ," [V] error ",errorcode)
        time.sleep(1)

if __name__ == "__main__":
    main()
