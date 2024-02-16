import pigpio

# pin defs 20191213
# copied from the iotable editing will be lost
D1 = 26
D0 = 13
D7 = 5
D6 = 9
D2 = 19
D3 = 6
D4 = 11
D5 = 10
clk3 = 23
LEDgreen = 18
MUXSEL0 = 17
MUXSEL1 = 4
SEL0 = 17
SEL1 = 4
SEL2 = 22
clk1 = 27
P0 = 21
P1 = 16
P2 = 7
P3 = 25
P4 = 20
P5 = 12
P6 = 8
P7 = 24
MUXSEL2 = 22  # use GPIO 22 for 8 input mux
GPIO15 = 15
GPIO14 = 14
GPIO18 = 18
# end automatic pin def
# extra pin def
GPIO22 = 22


class IOPin:
    def __init__(self, pin, mode, initialized=False):
        self.pin = pin
        self.mode = mode
        self.initialized = initialized

    def init_pin(self):
        err = pigpio.pi().set_mode(self.pin, self.mode)
        if err:
            self.initialized = False
            print(f"can not set pin {self.pin} in mode {self.mode} err: {err}")
        else:
            self.initialized = True
        return err


class CCE1Pins:
    def __init__(self):
        self.mux_out_s0 = IOPin(None, None)
        self.mux_out_s1 = IOPin(None, None)
        self.mux_out_s2 = IOPin(None, None)
        self.led = [IOPin(None, None) for _ in range(8)]


iopins = CCE1Pins()
