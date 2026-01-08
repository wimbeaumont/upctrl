import time
import pigpio

# Alias for GPIO pins
P0 = 21  # the output P0 is effectively connected to raspberry GPIO 21
P1 = 16  # the output P1 is effectively connected to raspberry GPIO 16
P2 = 7   # the output P2 is effectively connected to raspberry GPIO 7
P3 = 15  # the output P3 is effectively connected to raspberry GPIO 15

GPIO13 = 13  # D0 in schematic
GPIO26 = 26  # D1 in schematic
GPIO19 = 19  # D2 in schematic

pi = pigpio.pi()
if not pi.connected:
    exit(1)

# Set MUX_OUT to A input
pi.set_mode(17, pigpio.OUTPUT)  # Set GPIO17 as output (MUXSEL0)
pi.set_mode(4, pigpio.OUTPUT)   # Set GPIO4 as output (MUXSEL1)
pi.write(17, 0)
pi.write(4, 0)

# Set FPGA output ports as input ports
pi.set_mode(P0, pigpio.INPUT)
pi.set_mode(P1, pigpio.INPUT)
pi.set_mode(P2, pigpio.INPUT)
pi.set_mode(P3, pigpio.INPUT)

# Set FPGA input ports as output ports
pi.set_mode(GPIO13, pigpio.OUTPUT)
pi.set_mode(GPIO26, pigpio.OUTPUT)
pi.set_mode(GPIO19, pigpio.OUTPUT)

print("| |-----GPIO------|   |")
print("|x| 19| 26| 13| P1| P0|")

def print_gpio_state(label):
    print(f"|{label}| {pi.read(GPIO19)} | {pi.read(GPIO26)} | {pi.read(GPIO13)} | {pi.read(P1)} | {pi.read(P0)} |")

pi.write(GPIO19, 0)
pi.write(GPIO26, 0)
pi.write(GPIO13, 0)
print_gpio_state(0)
time.sleep(1)

pi.write(GPIO19, 0)
pi.write(GPIO26, 0)
pi.write(GPIO13, 1)
print_gpio_state(1)
time.sleep(1)

pi.write(GPIO19, 0)
pi.write(GPIO26, 1)
pi.write(GPIO13, 0)
print_gpio_state(2)
time.sleep(1)

pi.write(GPIO19, 0)
pi.write(GPIO26, 1)
pi.write(GPIO13, 1)
print_gpio_state(3)
time.sleep(1)

pi.write(GPIO19, 1)
pi.write(GPIO26, 0)
pi.write(GPIO13, 0)
print_gpio_state(4)
time.sleep(1)

pi.write(GPIO19, 1)
pi.write(GPIO26, 0)
pi.write(GPIO13, 1)
print_gpio_state(5)
time.sleep(1)

pi.write(GPIO19, 1)
pi.write(GPIO26, 1)
pi.write(GPIO13, 0)
print_gpio_state(6)
time.sleep(1)

pi.write(GPIO19, 1)
pi.write(GPIO26, 1)
pi.write(GPIO13, 1)
print_gpio_state(7)
time.sleep(1)

pi.stop()
