import ctypes 

SiPmCntrl_lib = ctypes.cdll.LoadLibrary("libSiPmCtrllib.so")
setBaisVoltagePy=SiPmCntrl_lib._Z14setBiasVoltageif

setBaisVoltagePy.argtypes  = [ctypes.c_int,ctypes.c_float ]
setBaisVoltagePy.restype = ctypes.c_int

setDiscriminatorLevelPy=SiPmCntrl_lib._Z21setDiscriminatorLevelif
setDiscriminatorLevelPy.argtypes  = [ctypes.c_int,ctypes.c_float ]
setDiscriminatorLevelPy.restype = ctypes.c_int


def main():
   errorcode=setBaisVoltagePy(0 , 0.25)
   print(errorcode)
   errorcode=setDiscriminatorLevelPy(1 , 4.2)
   print(errorcode)


if __name__ == "__main__":
    main()
