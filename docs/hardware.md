 
# UnaShield Hardware Guide

Version：V1.0
 
## CONTENTS

  About the UnaShield	???
  
  Top-View of UnaShields	???
  
  Pin Assignment of UnaShields	???
  
  Feature & Function Description	???
  
  Frequently Asked Questions	???
  
 
## About the UnaShield

<kbd><img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image022.png" width="200"></kbd> 

UnaShield is an Arduino Shield with a SIGFOX transceiver module that is compatible with Arduino UNO and other Arduino-based platform. It uses SIGFOX-certified WISOL or Radiocrafts module for all RCZs (Radio Configuration Zone).

‧ RCZ1：Europe, South Africa …

‧ RCZ2：North America …

‧ RCZ3：Japan …

‧ RCZ4：Singapore, Taiwan, Australia, New Zealand, Hong Kong, South America …

| **Features** |  | **V1(A) (20161128)** | **V2 (20170325)** | **V2S (20170107)** | **V2S (20170325)** |					
| :---------- | :---------- | :----------: | :----------: | :----------: | :----------: |					
| **SIGFOX Module** | **Radiocrafts RC1692HP-SIG** | **V** |  |  |  |					
|  | **WISOL WSSFM10R** |  | **V** | **V** | **V** |					
|  | **SIGFOX RCZ** | **2 / 4** | **1 / 2 / 3 / 4** | **1 / 2 / 3 / 4** | **1 / 2 / 3 / 4** |					
| **Sensor** | **Accelerometer (MMA8451Q)** |  |  | **V** | **V** |					
|  | **Temperature Sensor (BME280)** |  |  | **V** | **V** |					
|  | **Humidity Sensor (BME280)** |  |  | **V** | **V** |					
|  | **Pressure Sensor (BME280)** |  |  | **V** | **V** |					
|  | **Push Button** |  | **V** | **V** | **V** |					
| **Peripheral Connection** | **Digital Grove (I2C)** |  | **V** | **V** | **V** |					
|  | **Analog Grove** |  | **V** | **V** | **V** |					
| **LED** | **Power Indication** | **V** | **V** | **V** | **V** |					
|  | **General Indication** |  | **V** | **V** | **V** |					
|  | **Module Status Monitor** |  | **V** | **V** | **V** |					
| **Antenna** | **Matching Circuit** |  | **V** |  | **V** |					

##  Top-View of UnaShields

<kbd><img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image012.png" width="500"></kbd><br>

**【UnaShield_V1A】**

-----

<kbd><img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image014.png" width="500"></kbd><br>

**【UnaShield_V2S】20170107**

-----

<kbd><img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image016.png" width="500"></kbd><br>

**【UnaShield_V2/V2S】20170325**

-----

##  Pin Assignment of UnaShields

| **Arduino Pins** | **UnaShield V1/V1A** | **UnaShield V2/V2S** | **Description** |			
| :----------: | :----------: | :----------: | :---------- |			
| **Reserved** | **NC** | **NC** | **Reserved** |			
| **IOREF** | **5V** | **5V** | **5V Power Source from Arduino platform** |			
| **RESET** | **RESET** | **RESET** | **Reset Arduino MCU & SIGFOX Module；Low active** |			
| **3V3** | **3V3** | **3V3** | **3V3 Power Source from Arduino platform** |			
| **5V** | **5V** | **5V** | **5V Power Source from Arduino platform** |			
| **GND** | **GND** | **GND** | **Grounding & power/signal reference level** |			
| **GND** | **GND** | **GND** | **Grounding & power/signal reference level** |			
| **VIN** | **NC** | **NC** | **Extra power source input of Arduino platform** |			
| **A0** | **NC** | **NC** | **Analog Pin-0** |			
| **A1** | **NC** | **NC** | **Analog Pin-1** |			
| **A2** | **NC** | **A2** | **Analog Pin-2；Grove Connector #2** |			
| **A3** | **NC** | **A3** | **Analog Pin-3；Grove Connector #2** |			
| **A4** | **NC** | **I2C-SDA** | **Analog Pin-4；Grove Connector #1** |			
| **A5** | **NC** | **I2C-SCL** | **Analog Pin-5；Grove Connector #1** |			
| **SCL** | **NC** | **NC** | **Branch of A5 (I2C-SCL)** |			
| **SDA** | **NC** | **NC** | **Branch of A4 (I2C-SDA)** |			
| **AREF** | **NC** | **NC** | **Reference level input for Arduino MCU** |			
| **GND** | **GND** | **GND** | **Grounding & power/signal reference level** |			
| **D13** | **NC** | **NC** | **Digital Pin-13** |			
| **D12** | **NC** | **NC** | **Digital Pin-12** |			
| **D11** | **NC** | **NC** | **Digital Pin-11** |			
| **D10** | **NC** | **NC** | **Digital Pin-10** |			
| **D9** | **NC** | **Red-LED** | **User Programmable Red LED** |			
| **D8** | **NC** | **Green-LED** | **User Programmable Green LED** |			
| **D7** | **NC** | **Wakeup** | **Wakeup onboard module from deep sleep mode** |			
| **D6** | **NC** | **Button** | **Push button；Push to low signal level** |			
| **D5** | **UART-RX** | **UART-RX** | **UART receiving pin** |			
| **D4** | **UART-TX** | **UART-TX** | **UART transmitting pin** |			
| **D3** | **NC** | **INT2** | **Interrupt#2 of Bosch sensor (BME280)** |			
| **D2** | **NC** | **INT1** | **Interrupt#1 of Bosch sensor (BME280)** |			
| **D1** | **NC** | **NC** | **Digital Pin-1** |			
| **D0** | **NC** | **NC** | **Digital Pin-0** |			
 
<kbd><img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image020.png" width="200"></kbd><br>

- All the pins marked with symbol * are essential for the onboard SIGFOX module. Even though UnaShield is designed on Arduino UNO-R3 platform, it can be integrated to be a standalone SIGFOX module if these essential five pins are properly connected.

- The onboard SIGFOX module works with DC-3V3 power. All the pins assigned on UnaShield are interfaced with the level-shifter to adjust the voltage to the acceptable voltage level, 3V3.

##  Feature & Function Description

<kbd><img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image008.png" width="300"></kbd>

### (1) SMA Connector

The SMA connector is used for antenna connection. In order not to damage the onboard SIGFOX module, always connect an antenna before firing a SIGFOX message; even better to connect the antenna before the system power is supplied.

### (2) SIGFOX Module

UnaShield_V1(A) adopts Radiocrafts SIGFOX module, RC1692HP-SIG, certified for RCZ2 & RCZ4; UnaShield_V2(S) adopts WISOL SIGFOX modules in WSSFM10R series, certified for all RCZs. All the SIGFOX modules are accessible via UART interface with AT commands.

**- V1/V1A：**Radiocrafts RC1692HP-SIG (RCZ2 & RCZ4)

**- V2/V2S：**WISOL WSSFM10R (All RCZs)

### (3) Arduino UNO Standard Header

There are four Arduino Standard headers on UnaShield; one 6-pin, two 8-pin, and one 10-pin headers. Not all the pins are used. User can use these un-used pins to extend the features of the Arduino-based system, but must be sure the interface level of Arduino UNO R3 is 5V, might not applicable to the targeted device or components.

For the details of each pin assignment and definition of Arduino UNO, please check with the Arduino official website (https://www.arduino.cc/en/Main/ArduinoBoardUno)[https://www.arduino.cc/en/Main/ArduinoBoardUno]. 

### (4) Push Button (UnaShield V2/V2S Only)

A push button (tact-switch) is connected to D6, a digital pin of Arduino UNO, and can be used to be the event-triggered initiator.

### (5) Grove Connector (UnaShield V2/V2S Only)

UnaShield V2S is equipped with two Grove connectors, a standard 4-pin connector type. User can connect any sensors or devices with Grove interfaces to extend the features of the Arduino-based system. 

**- Grove Connector #1：Connection through I2C digital interface (SCL/SDA)**

**- Grove Connector #2：Connection through the analog interface (A2/A3)**

The power level of onboard Grove connector is alterable between 3V3 and 5V. Choose the most proper power source to the module/device connected by **J204** configuration.

| **Grove-VCC Voltage** 	| **Floating**	| **5V**	 | **3.3V (Default)** |
| ---------------------- | :----------: | :-----: | :----------------: |
| **J204 Configuration** | <img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image024.png" width="100"> | <img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image026.png" width="100"> | <img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image027.png" width="100"> |

### (6) LED Indicator & Manual Switches (UnaShield V2/V2S Only)

There are eight onboard LEDs used to show the status of UnaShield operation. The LED indication can be enabled/disabled by J201/J202/J203 configuration respectively. 

#### A. J201 – the switch for LED status of WISOL module (TX, RX, CPU & RF)
| Indication Function	| Disabled	| Enabled (Default) |
| ------------------- | -------- | ----------------- |
| J201 Configuration	 | <img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image029.png" width="100"> | <img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image030.png" width="100"> |

#### B. J202 – the switch for LED status of onboard powers (3V3 & 5V)
| Indication Function	| Disabled	| Enabled (Default) |
| ------------------- | -------- | ----------------- |
| J202 Configuration	 | <img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image029.png" width="100"> | <img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image030.png" width="100"> |

#### C. J203 – the switch for LED status of GPIO Control (D8 & D9)
| Indication Function	| Disabled	| Enabled (Default) |
| ------------------- | -------- | ----------------- |
| J203 Configuration	 | <img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image029.png" width="100"> | <img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image030.png" width="100"> |

### (7) I2C Interface (UnaShield V2/V2S Only)

I2C interface is a two-wire and bi-directional protocol, which consists of one data line (SDA) and one clock (SCK). I2C works in the daisy-chain configuration, so one master device can communicate with more than one slave device by the unique device address.

Not only the two onboard sensors, but also the Grove Connector #1 are connected by a unique and alternative I2C address code by hardware setting. 

#### A. NXP Accelerometer (G-Sensor) – MMA8451Q
| SA0	 | I2C Address	| Default |
| :--: | :---------: | :-----: |
| LOW	 | 0x1C	       | V       |
| HIGH	| 0x1D	       |         |

#### B. BOSCH Temperature/Humidity/Pressure Sensor – BME280
| SD0	 | I2C Address	| Default |
| :--: | :---------: | :-----: |
| LOW	 | 0x76	       | V       |
| HIGH	| 0x77	       |         |

#### C. Grove Connector #1
Depending on the sensor connected through the Grove Connector #1, the I2C address should be set to an unused one to avoid address conflict. 

## Frequently Asked Questions

### (01) Can UnaShield be use on all Arduino platforms?

UnaShield is well-tested on Arduino Uno R3; however, it’s not compatible with all the variants of Arduino boards, because the pin definition difference. Here are two series Arduino platforms suffered from the incompatibility

#### - Mega & Mega2560

Only the following pins can be used for **RX in Mega & Mega2560:**<br>
**10, 11, 12, 13, 50, 51, 52, 53, 62, 63, 64, 65, 66, 67, 68, 69**

#### - Leonardo & Micro

Only the following pins can be used for **RX in Leonardo & Micro:** <br>
**8, 9, 10, 11, 14, 15, 16**

For the users of these incompatible Arduino platforms, the two steps below are recommended for fixing the incompatibility by switching the **UART receiving pin (UART-RX)** from the **Digital PIN 5** to another pin with RX function.

#### Step 1
Assign the original **PIN 5 (UART-RX)** as an input, by choosing a setting marked **Green** in the table shown below. 
You may keep **PIN 5 (UART-RX)** disconnected on the Arduino Uno R3.

#### Step 2
Connect **PIN 5 (UART-RX)** to one of the pins with receiving function, to be the new UART-RX. Use an an external metal wire.

| **DDxn** | **PORTxn** | **PUD (in MCUCR)** | **I/O** | **Pull-Up** | **Comment** |					
| :----------: | :----------: | :----------: | :----------: | :----------: | :----------: |					
| **0** | **0** | **X** | **INPUT** | **NO** | **HI-Z** |					
| **0** | **1** | **0** | **INPUT** | **YES** |  |					
| **0** | **1** | **1** | **INPUT** | **NO** | **HI-Z** |					
| **1** | **0** | **X** | **OUTPUT** | **NO** | **Output Low** |					
| **1** | **1** | **X** | **OUTPUT** | **NO** | **Output High** |					

### (02) Can UnaShield work as a breakout board?
UnaShield can be the breakout board of the onboard SIGFOX module. Only five pins need to connected, so that the SIGFOX module can be controlled by any external MCU (e.g. ARM CPU, Raspberry Pi) or integrated to any existing system.

#### Power Pins：3V3, 5V, GND

#### UART Interface：UART-TX (D4), UART-RX (D5)

**Both 3V3 and 5V** UART signaling levels are acceptable. The onboard level-shifting circuit regulates the 5V UART signaling to 3V3, which is the nominal power level of the onboard SIGFOX module. 

### (03) Can the UART Interface be reused?

The **D4 & D5** pins are used by the **UART interface** on UnaShield, for communicating with the onboard SIGFOX module. 

UART communications is designed for two endpoints only, so D4 & D5 cannot be connected for any other purpose.

### (04) Can the I2C Interface be reused?

The **A4 & A5** pins are the I2C interface on UnaShield, used to communicate with the **onboard sensors** 
and **Grove connector #1** as well. 

The **I2C interface** works in daisy-chain mode. Each terminal should have a unique I2C address so that they may be connected serially. 
Every message transmitted on I2C contains the unique I2C address of the receiver, so that only one of the terminals in the daisy-chain can intercept and process the message.

Any I2C device with a unique and distinguishable address can connect to these two pins simultaneously.

### (05) Can Grove Connector #2 (A2 & A3) be reused?

The **A2 & A3** pins are connected to **Grove Connector #2** for linking with Grove sensor connected to that port.
If Grove Connector #2 is not connected to any Grove sensor, then A2 & A3 can be used for other Analog Input/Output connections.

### (06) Can D8 & D9 be reused?

The **D8 & D9 pins** control the **user-programmable LED.** Remove the jumper on **J203** to disable the LED function, and D8 & D9 may be reused for other Digital Input/Output connections. 

### (08) What's the guideline for deciding if a pin is reusable?

Each pin can only be assigned to one function. The pin may not be reused until the default function of that pin has been deactivated.
If the same pin is used by two circuits (e.g. UART Interface and Digital Input/Output), 
the conflict in the electrical signalling will lead to failure of both functions.

The only exception is the I2C connection, which supports daisy-chaining of multiple sensors on the same I2C pins.

### (09) Any limitations on the I/O pins?

UnaShield is designed to run on the Arduino hardware platform. All the I/O pins derive from the MCU on Arduino platform. Maximal current for each I/O pin is **40mA** on Arduino Uno R3.

### (10) How to activate the UnaShield?

Follow the steps here to activate your UnaShield: (https://bit.ly/unashieldact)[https://bit.ly/unashieldact] 

Each UnaShield activated will enjoy two years of free Sigfox subscription.

### (11) What is the warranty for UnaShield?

The UnaShield is covered by a 3-month warranty, one-for-one exchange. Proof of purchase must be produced upon exchange. 

## UnaShield Developer Page

All the Arduino library and sample codes are ready for download at (https://bit.ly/unashield)[https://bit.ly/unashield]

## Getting the UnaShield

To order the UnaShield, please contact UnaBiz：

### Singapore 

Ms. Kimberley Thong

Business Development Manager

Kimberley.thong@unabiz.com

### Taiwan and Rest of the World

Mr. Nicolas Baele

Global Account Manager

Nicolas.baele@unabiz.com
 

