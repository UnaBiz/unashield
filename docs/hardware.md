 
# Hardware Manual

Version：V1.0
 
## CONTENTS

  About the UnaShield	???
  
  Top-View of UnaShields	???
  
  Pin Assignment of UnaShields	???
  
  Feature & Function Description	???
  
  Frequently Asked Questions	???
 
## About the UnaShield
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

【UnaShield_V1A】

-----

<kbd><img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image014.png" width="500"></kbd><br>

【UnaShield_V2S】20170107

-----

<kbd><img src="https://storage.googleapis.com/unabiz-media/unashield/hardware/image016.png" width="500"></kbd><br>

【UnaShield_V2/V2S】20170325

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
 
* All the pins marked with symbol * are essential for the onboard SIGFOX module. Even though UnaShield is designed on Arduino UNO-R3 platform, it can be integrated to be a standalone SIGFOX module if these essential five pins are properly connected.
* The onboard SIGFOX module works with DC-3V3 power. All the pins assigned on UnaShield are interfaced with the level-shifter to adjust the voltage to the acceptable voltage level, 3V3.

##  Feature & Function Description

(1) SMA Connector

The SMA connector is used for antenna connection. In order not to damage the onboard SIGFOX module, always connect an antenna before firing a SIGFOX message; even better to connect the antenna before the system power is supplied.

(2) SIGFOX Module

UnaShield_V1(A) adopts Radiocrafts SIGFOX module, RC1692HP-SIG, certified for RCZ2 & RCZ4; UnaShield_V2(S) adopts WISOL SIGFOX modules in WSSFM10R series, certified for all RCZs. All the SIGFOX modules are accessible via UART interface with AT commands.
‧V1/V1A：Radiocrafts RC1692HP-SIG (RCZ2 & RCZ4)
‧V2/V2S：WISOL WSSFM10R (All RCZs)

(3) Arduino UNO Standard Header

There are four Arduino Standard headers on UnaShield; one 6-pin, two 8-pin, and one 10-pin headers. Not all the pins are used. User can use these un-used pins to extend the features of the Arduino-based system, but must be sure the interface level of Arduino UNO R3 is 5V, might not applicable to the targeted device or components.
For the details of each pin assignment and definition of Arduino UNO, please check with the Arduino official website (https://www.arduino.cc/en/Main/ArduinoBoardUno). 

(4) Push Button (V2/V2S Only)

A push button (tact-switch) is connected to D6, a digital pin of Arduino UNO, and can be used to be the event-triggered initiator.

(5) Grove Connector (V2/V2S Only)

UnaShield_V2S equips with two Grove connectors, a standard 4-pin connector type. User can connect any sensors or devices with Grove interfaces to extend the features of Arduino-based system. 

‧Grove Connector #1：Connection through I2C digital interface (SCL/SDA)

‧Grove Connector #2：Connection through the analog interface (A2/A3) 

The power level of onboard Grove connector is alterable between 3V3 and 5V. Choose the most proper power source to the module/device connected by J204 configuration.
Grove-VCC
Voltage	Floating	5V	3.3V (Default)
J204
Configuration	 	 

(6) LED Indicator & Manual Switches (V2/V2S Only)

There are eight onboard LEDs used to show the status of UnaShield operation. The LED indication can be enabled/disabled by J201/J202/J203 configuration respectively. 

A. J201 – the switch for LED status of WISOL module (TX, RX, CPU & RF)
Indication
Function	Disabled	Enabled (Default)
J201
Configuration	 	 

B. J202 – the switch for LED status of onboard powers (3V3 & 5V)
Indication
Function	Disabled	Enabled (Default)
J202
Configuration	 	 

C. J203 – the switch for LED status of GPIO Control (D8 & D9)
Indication
Function	Disabled	Enabled (Default)
J203
Configuration	 	 

(7) I2C Interface (V2/V2S Only)

I2C interface is a two-wire and bi-directional protocol, which consists of one data line (SDA) and one clock (SCK). I2C works in the daisy-chain configuration, so one master device can communicate with more than one slave device by the unique device address.
Not only the two onboard sensors, but also the Grove Connector #1 are connected by a unique and alternative I2C address code by hardware setting. 

A. NXP Accelerometer (G-Sensor) – MMA8451Q
SA0	I2C Address	Default
LOW	0x1C	V
HIGH	0x1D	

B. BOSCH Temperature/Humidity/Pressure Sensor – BME280
SD0	I2C Address	Default
LOW	0x76	V
HIGH	0x77	

C. Grove Connector #1
Depending on the sensor connected through the Grove Connector #1, the I2C address should be set to an un-used one to avoid the address confliction. 

## Frequently Asked Questions

(01) Can UnaShield use on all Arduino platforms?

UnaShield is well-tested on Arduino UNO R3; however, it’s not compatible with all the variants of Arduino boards, because the pin definition difference. Here are two series Arduino platforms suffered from the incompatibility

- ‧Mega & Mega2560

Only the following pins can be used for RX in Mega & Mega2560：<br>
10, 11, 12, 13, 50, 51, 52, 53, 62, 63, 64, 65, 66, 67, 68, 69

‧ Leonardo & Micro

Only the following pins can be used for RX in Leonardo & Micro：<br>
8, 9, 10, 11, 14, 15, 16

For the users of these incompatible Arduino platforms, two-step procedure is recommended to fix the incompatibility by switching the UART receiving pin (UART-RX) from the digital PIN5 to another pin with RX function.

**Step1**<br />
Assign the original PIN5 (UART-RX) as an input by the setting marked with color green in the table shown below, even though keep the PIN5 (UART-RX) pin un-connected is fine on Arduino UNO R3.

**Step2**<br />
Connect PIN5 (UART-RX) to one of the pins with receiving function to be the new UART-RX by an external metal wire.

| **DDxn** | **PORTxn** | **PUD (in MCUCR)** | **I/O** | **Pull-Up** | **Comment** |					
| :----------: | :----------: | :----------: | :----------: | :----------: | :----------: |					
| **0** | **0** | **X** | **INPUT** | **NO** | **HI-Z** |					
| **0** | **1** | **0** | **INPUT** | **YES** |  |					
| **0** | **1** | **1** | **INPUT** | **NO** | **HI-Z** |					
| **1** | **0** | **X** | **OUTPUT** | **NO** | **Output Low** |					
| **1** | **1** | **X** | **OUTPUT** | **NO** | **Output High** |					

(02) Can UnaShield work as a breakout board?
UnaShield can be the breakout board of the onboard SIGFOX module. Only five pin need to connect, so that the SIGFOX module can be controlled by any external MCU or integrated to any existed system.
‧Power Pins：3V3, 5V, GND
‧UART Interface：UART-TX (D4), UART-RX (D5)
Both the 3V3 and 5V UART signaling levels are acceptable. The onboard level-shifting circuit regulates the 5V UART signaling to 3V3, the nominal power level of onboard SIGFOX module. 

(03) Can UART-Interface reuse?

The D4 & D5 pins are the UART interface on UnaShield, used to communicate with the onboard SIGFOX module. UART interface is dedicated for communication between two terminals only, so D4 & D5 can’t be connected for any other usages.

(04) Can I2-Interface reuse?

The A4 & A5 pins are the I2C interface on UnaShield, used to communicate with the onboard sensors & the Grove connector #1 as well. I2C interface works in daisy-chain mode, which means each terminal owns a unique address. The message transmitted with the unique address of the receiver, so that only one of the terminals in the daisy-chain can catch and decode the message. Any I2C device with a unique and distinguishable address can connect to these two pins with parallel connection.

(05) Can A2 & A3 reuse?

The A2 & A3 pins are connected to Grove connector #2 for any possible extension via Grove interface. In case the Grove connector #2 is un-used, the A2 & A3 can be reserved for any analog connection.

(06) Can D8 & D9 reuse?

The D8 & D9 pins are assigned to be the user programmable LED control. Remove the short-jumper on J203 will disable the LED function, and then D8 & D9 will be free for any digital connection. 

(08) Any general rule to decide if a used pin reusable?

Any unexpected inputs make the collision and failure. Except the protocol like I2C, which supports daisy-chain connection, each pin can only be assigned to one function. Can’t be reused until the default function has been deactivated

(09) Any limited on the IO pin?

UnaShield is a shield for Arduino platform. All the IO pins derive from the MCU on Arduino platform. Maximal current for each IO pin is 40mA on Arduino UNO R3.

(10) How to activate the UnaShield on SIGFOX backend?

Follow the steps mentioned at https://bit.ly/unashieldact to activate your UnaShield. Each UnaShield activated at https://bit.ly/unashieldact can get two-year subscription for free.

(11) What is the warranty for UnaShield?

The UnaShield is covered by a 3-month warranty, one-for-one exchange. Proof of purchase must be produced upon exchange. 

## UnaShield Developer Page

All the Arduino library and sample codes are ready for download at https://bit.ly/unashield

## Getting the UnaShield

To order the UnaShield, please contact UnaBiz：
‧Singapore 
Ms. Kimberley Thong
Business Development Manager
Kimberley.thong@unabiz.com
‧Taiwan and Rest of the World
Mr. Nicolas Baele
Global Account Manager
Nicolas.baele@unabiz.com
 

