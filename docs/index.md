---
title: "UnaShield Developer Guide"
menus:
  header:
    title: "Developer Guide"
---

## About UnaShield

<kbd><img src="https://raw.githubusercontent.com/UnaBiz/unashield/master/img/hardware/image022.png" width="200" align="right"></kbd>UnaShield is an Arduino Shield with a Sigfox transceiver module that is compatible with Arduino Uno R3 and other Arduino-based development boards. It uses Sigfox-certified WISOL or Radiocrafts modules to support all RCZs (Radio Configuration Zones).

- **RCZ1:** Europe, Iran, Oman, South Africa

- **RCZ2:** Brazil, Mexico, USA  

- **RCZ3:** Japan

- **RCZ4:** Argentina, Australia, Colombia, Hong Kong, Malaysia, New Zealand, Singapore, Taiwan, Thailand

There are 2 versions of the UnaShield:

* **UnaShield V2S:** Based on Sigfox module by WISOL.  Includes onboard sensors for temperature, humidity, air pressure, accelerometer and two ports for connecting Grove sensors.<br>

* **UnaShield V1:** Based on Sigfox module by Radiocrafts.<br>

For hardware specifications please refer to the UnaShield Hardware Guide:
[https://unabiz.github.io/unashield/hardware](https://unabiz.github.io/unashield/hardware)

The UnaBiz team has built an Arduino library for the UnaShield, the source code may be found here: 
[https://github.com/UnaBiz/unabiz-arduino](https://github.com/UnaBiz/unabiz-arduino)

This page explains how to use the Arduino library to send Sigfox messages with the UnaShield.

## Getting the UnaShield

To order the UnaShield, please contact [UnaBiz](http://www.unabiz.com):

**Singapore**<br>
Ms Kimberley Thong<br>
Business Development Manager<br>
kimberley.thong@unabiz.com<br>
[_(Getting to UnaBiz for self-collection orders)_](https://raw.githubusercontent.com/UnaBiz/unashield/master/img/developer/GettingToUnaBizSingapore.pdf)

**Taiwan and Rest of the World**<br>
Mr Nicolas Baele<br>
Global Account Manager<br>
nicolas.baele@unabiz.com

The UnaShield is covered by a 3-month warranty, one-for-one exchange. Proof of purchase must be produced upon exchange.

<kbd><img src="https://raw.githubusercontent.com/UnaBiz/unashield/master/img/developer/unashield.jpg" width="500"></kbd><br>

*UnaShield V1*

## Activating the UnaShield

To activate the UnaShield and get access to Sigfox Backend, please refer to

[https://github.com/UnaBiz/unabiz-arduino/wiki/Activation](https://github.com/UnaBiz/unabiz-arduino/wiki/Activation)

## Installing the unabiz-arduino library

To install the unabiz-arduino library for sending Sigfox messages:

1. Install the latest Arduino Integrated Development Environment (IDE) from 
[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

1. Browse to [https://github.com/UnaBiz/unabiz-arduino](https://github.com/UnaBiz/unabiz-arduino)

1. Click **"Clone Or Download"** then **"Download ZIP"**

   <kbd><img src="https://raw.githubusercontent.com/UnaBiz/unashield/master/img/developer/github-download.png" width="500"></kbd>

1. Launch the Arduino integrated development environment. Click **"Sketch"** → **"Include Library"** → **"Add .ZIP Library"**

1. Select the downloaded zip file.  After the installation you should see unabiz-arduino or unabiz-arduino-master when you click **File** → **Examples**.

More details on installing Arduino libraries: 
[https://www.arduino.cc/en/Guide/Libraries](https://www.arduino.cc/en/Guide/Libraries)

## Sample sketch for UnaShield

Refer to this sample Arduino sketch for sending Sigfox messages:

**For UnaShield V1:**<br>
<span style="font-size: smaller">[https://github.com/UnaBiz/unabiz-arduino/blob/master/examples/DemoTestUnaShieldV1/DemoTestUnaShieldV1.ino](https://github.com/UnaBiz/unabiz-arduino/blob/master/examples/DemoTestUnaShieldV1/DemoTestUnaShieldV1.ino)</span>

**For UnaShieldV2S:**<br>
<span style="font-size: smaller">[https://github.com/UnaBiz/unabiz-arduino/blob/master/examples/DemoTestUnaShieldV2S/DemoTestUnaShieldV2S.ino](https://github.com/UnaBiz/unabiz-arduino/blob/master/examples/DemoTestUnaShieldV2S/DemoTestUnaShieldV2S.ino)</span>

The sample sketch may also be found in the Arduino integrated development environment by clicking **File** → **Examples** → **unabiz-arduino** or **unabiz-arduino-master**

## Declaring the transceiver

To declare a transceiver object for sending Sigfox messages:

{% highlight c++ linenos %}
#include "SIGFOX.h"                         //  Include the unabiz-arduino library.
static const String device = "g88pi";       //  Set this to your device name if you're using UnaBiz Emulator.
static const bool useEmulator = false;      //  Set to true if using UnaBiz Emulator.
static const bool echo = true;              //  Set to true if the Sigfox library should display the executed commands.
static const Country country = COUNTRY_SG;  //  Set this to your country to configure the Sigfox transmission frequencies.
static UnaShieldV2S transceiver(country, useEmulator, device, echo);
{% endhighlight %}

If you're using UnaShield V1, change UnaShieldV2S to UnaShieldV1.

Change COUNTRY_SG to your country code (e.g. COUNTRY_AU, COUNTRY_NZ). This sets the transceiver object to use the Sigfox frequencies for your country.

useEmulator should always be set to false.  If you are connecting the UnaShield V2S to the SNEK emulator, set useEmulator to true.  **You will not be able to connect the UnaShield to the actual Sigfox network when useEmulator is set to true.**

The following sections explain how to use the transceiver.sendMessage method to send a raw Sigfox message, and the Message class to send a structured message.

## Initialising the transceiver

Initialise the transceiver object in the setup function before sending any messages:

{% highlight c++ linenos %}
if (!transceiver.begin()) stop(F("Unable to init Sigfox module, may be missing"));
{% endhighlight %}

The message "Unable to init..." is displayed if the transceiver could not be initialised, e.g. when the UnaShield is not connected to the Arduino board.  The F(...) function stores the message string into flash memory instead of highly-limited static RAM, to support larger Arduino sketches.

## Sending a raw message

To send a raw message of up to 12 bytes:

{% highlight c++ linenos %}
transceiver.sendMessage("0102030405060708090a0b0c");  //  Send raw message.
delay(10000);                                         //  Wait 10 seconds.
{% endhighlight %}

This sends a Sigfox message containing the bytes "0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0a 0x0b 0x0c".

Note that we may not send two messages within 10 seconds due to the Sigfox rate limit.  Each Sigfox device may send up to 140 messages within a 24-hour period.

## Sending a text message

To send a message containing a text string of up to 12 ASCII characters:

{% highlight c++ linenos %}
transceiver.sendString("123456789abc");  //  Send text message.
delay(10000);                            //  Wait 10 seconds.
{% endhighlight %}

This sends a Sigfox message containing the bytes 0x31 0x32 0x33 0x34 0x35 0x36 0x37 0x38 0x39 0x61 0x62 0x63. This is equivalent to calling:

{% highlight c++ linenos %}
transceiver.sendMessage("313233343536373839616263");  //  Send raw message.
delay(10000);                                         //  Wait 10 seconds.
{% endhighlight %}

Helper methods are provided in the transceiver object to help encode various Arduino types into hexadecimal strings for sending via sendMessage:

{% highlight c++ linenos %}
String encode1 = transceiver.toHex(0x1234);  //  Returns "3412" (least significant byte first).
String encode2 = transceiver.toHex(1.23);    //  Returns "a4709d3f" (IEEE 574 float encoding, least significant byte first).
transceiver.sendMessage(encode1 + encode2);  //  Send the 6-byte message "3412a4709d3f".

//  Second argument is the number of characters to encode.
String encode3 = transceiver.toHex("123456789abc", 12)  //  Returns "313233343536373839616263".
transceiver.sendMessage(encode3);  //  Send the 12-byte message "313233343536373839616263".
{% endhighlight %}

## Sending a structured message

The unabiz-arduino library includes a Message class that allows us to send structured messages containing up to 3 data fields, packed into a 12-byte Sigfox message.  The Message class is used like this:

{% highlight c++ linenos %}
  Message msg(transceiver);          //  Will contain the structured sensor data.
  msg.addField("ctr", counter);      //  4 bytes for the counter.
  msg.addField("tmp", temperature);  //  4 bytes for the temperature.
  msg.addField("vlt", voltage);      //  4 bytes for the voltage.
                                     //  Total 12 bytes out of 12 bytes used.
  if (msg.send()) {                  //  Send the message.
    successCount++;                  //  If successful, count the message sent successfully.
  }
  delay(10000);                      //  Wait 10 seconds.
{% endhighlight %}

Each addField(name, value) method adds a data field to the message:

* name: Name of data field, up to 3 lowercase letters or digits allowed

* value: Value of data field of type int, float or String (up to 3 characters)

This transmits an encoded message that looks like 920e5a00b051680194597b00.  The 12-byte encoded message contains the field names ctr, tmp, vlt as well as the field values.  To decode the message at the server side, refer to the next section.

## Decoding a structured message

To decode a structured message at the server, refer to the Node.js / JavaScript function decodeMessage here:

[https://github.com/UnaBiz/sigfox-gcloud/blob/master/decodeStructuredMessage/structuredMessage.js](https://github.com/UnaBiz/sigfox-gcloud/blob/master/decodeStructuredMessage/structuredMessage.js)

At UnaBiz we call decodeMessage to decode the structured messages when tracing messages via Slack:

<img src="https://raw.githubusercontent.com/UnaBiz/unashield/master/img/developer/decode-message-slack.jpg" height="300">

The Structured Message Format is described in the section "Format of structured message" below.

## Sending a Sigfox Custom Payload message

If you don't wish to use the above Structured Message Format and perform message decoding in your cloud, 
you may use the Sigfox Custom Payload format to allow Sigfox to decode simple message formats and pass the decoded 
fields in the Sigfox callback.  Note that each Sigfox Message Type is allowed to have only 1 Custom Payload format.

Refer to these documents for details:

[Create a callback in Sigfox backend using JSON](https://blog.sigfox.com/create-callback-sigfox-backend/)

[Getting Started with UnaShield and Sigfox on Ubidots](https://unabiz.github.io/unashield/ubidots)

## Getting the downlink response from Sigfox

Refer to 
[https://github.com/UnaBiz/unabiz-arduino/wiki/Downlink](https://github.com/UnaBiz/unabiz-arduino/wiki/Downlink)

## Checking messages sent by the UnaShield

The **Sigfox Backend Portal** enables us to view the messages received by Sigfox from the UnaShield.

Log on to the Sigfox Backend Portal at **[http://backend.sigfox.com](http://backend.sigfox.com)**

<kbd><img src="https://raw.githubusercontent.com/UnaBiz/unashield/master/img/developer/sigfox-messages.png" width="500"></kbd>

## Processing messages sent by the UnaShield

To process the messages sent by the UnaShield, we need to provide a server with a public address.  The Sigfox cloud will send a **HTTP POST request** to our server whenever Sigfox receives a message from the UnaShield.  UnaBiz has provided an **open-source server application** for processing Sigfox messages in Google Cloud:

[https://www.npmjs.com/package/sigfox-gcloud](https://www.npmjs.com/package/sigfox-gcloud)

To use your own server, follow the instructions above to configure the Sigfox callback URL for your device type.  Enter your callback URL instead of the one shown in the instructions.  For more details please refer to this page in the Sigfox backend:

[https://backend.sigfox.com/apidocs/callback](https://backend.sigfox.com/apidocs/callback)

## Changes from UnaShieldV1 interface to UnaShieldV2S

An Arduino sketch built for UnaShield V1 (Radiocrafts) can run on UnaShield V2S (Wisol) with virtually no changes.  The only change to the interface is for

{% highlight c++ linenos %}
bool Wisol::getTemperature(float &temperature)
{% endhighlight %}

Previously it was int, now it's float.  The class UnaShieldV2S is an alias to the Wisol class.  

## Demo sketches for UnaShield V2S sensors

The following Arduino sketches show how we may access the other sensors on the UnaShield V2S:

* **Temperature, humidity, barometric pressure sensors:**

  For sending sensor data in Structured Message Format:
  
  [https://github.com/UnaBiz/unabiz-arduino/tree/master/examples/send-altitude-structured](https://github.com/UnaBiz/unabiz-arduino/tree/master/examples/send-altitude-structured)

  For sending sensor data in Sigfox Custom Payload Format:

  [https://github.com/UnaBiz/unabiz-arduino/tree/master/examples/send-altitude](https://github.com/UnaBiz/unabiz-arduino/tree/master/examples/send-altitude)

* **Accelerometer sensor:**

  [https://github.com/UnaBiz/unabiz-arduino/tree/master/examples/accelerometer-sensor](https://github.com/UnaBiz/unabiz-arduino/tree/master/examples/accelerometer-sensor)

* **Button sensor:**

  [https://github.com/UnaBiz/unabiz-arduino/tree/master/examples/button-sensor](https://github.com/UnaBiz/unabiz-arduino/tree/master/examples/button-sensor)

* **Grove sensor** (Grove Light Sensor):

  [https://github.com/UnaBiz/unabiz-arduino/tree/master/examples/grove-sensor](https://github.com/UnaBiz/unabiz-arduino/tree/master/examples/grove-sensor)

* **Handling multiple sensors with a Finite State Machine**:

  [https://github.com/UnaBiz/unabiz-arduino/blob/master/examples/multiple_inputs/multiple_inputs.ino](https://github.com/UnaBiz/unabiz-arduino/blob/master/examples/multiple_inputs/multiple_inputs.ino)

## Getting the Sigfox Device ID and PAC (Porting Authorization Code)

When the above demo code runs, the Arduino Serial Monitor will show the Sigfox Device ID and PAC like this:

{% highlight linenos %}
 - Wisol.getID: returned id=002BEDB4, pac=C53D6575A5DA0000
 - Sigfox ID = 002BEDB4
 - PAC = C53D6575A5DA0000
{% endhighlight %}

The Device ID and PAC will be used to activate the UnaShield with the Sigfox Operator. Note that the PAC is only valid for one use only.  Once a device has been activated with the PAC, the device cannot be activated again on a different Sigfox Operator with the same PAC.

## Support for LightBlue Bean+

<img src="https://raw.githubusercontent.com/UnaBiz/unashield/master/img/developer/unatumbler.jpg" width="400">

The **[LightBlue Bean+ by Punch Through](https://punchthrough.com/bean)** is a tiny Arduino-compatible board with built-in:

0. **Lithium battery (600mAh)**

0. **Accelerometer**

0. **Temperature sensor**

0. **Two ports for Grove sensors**

0. **RGB LED**

0. And **Bluetooth 4.0,** supporting **iBeacon and Arduino flashing / log access over Bluetooth**

By adding the UnaShield to the Bean+, you create a self-powered sensing device that can send sensor data to the Sigfox cloud for ***many days on a single charge***

Check out [https://github.com/UnaBiz/unabiz-arduino/wiki/Bean](https://github.com/UnaBiz/unabiz-arduino/wiki/Bean)

## Support for Raspberry Pi and other devices

This article explains the pins on the UnaShield that should be connected for proper operation.  When the send/receive, power and ground pins are connected to the Raspberry Pi or other devices, you should be able to send commands to the Wisol or Radiocrafts module via the Serial / UART interface.

[https://github.com/UnaBiz/unabiz-arduino/wiki/Bean](https://github.com/UnaBiz/unabiz-arduino/wiki/Bean)

Also check these articles for compatibility information:

- [Arduino Mega / Leonardo / Micro](https://unabiz.github.io/unashield/hardware)

## Format of structured message

The structured message format was created such that all 12 bytes in a Sigfox message could be used to transmit 3 fields efficiently, including a 3-letter field name (e.g. ctr).  The field name was included so that any generic IoT platform (e.g. Amazon Web Services IoT) could decode the fields and refer to the fields by name for IoT rules, alerts, dashboards and other types of IoT data processing.

* Each structured message contains 1 to 3 data fields of 4 bytes each:

  **Structured Message: (12 bytes)**

  Data Field 1 (mandatory) | Data Field 2 (optional) | Data Field 3 (optional)
  :---: | :---: | :---:
  _4 bytes_ | _4 bytes_ | _4 bytes_

* Each data field contains 2 bytes for the field name (e.g. ctr), followed by 2 bytes for the field value (int, float or String):

  **Data Field: (4 bytes)**

  Field Name | Field Value
  :---: | :---: | :---:
  _2 bytes_ | _2 bytes_

* Field name consists of 1 to 3 lowercase letters or digits, packed as 5 bits each.

  **Field Name / String Value Encoding: (2 bytes)**

  First Letter/Digit | Second Letter/Digit | Third Letter/Digit | Unused
  :---: | :---: | :---: | :---:
  _5 bits_ | _5 bits_  | _5 bits_  | _1 bit_

* A letter/digit is mapped to 5 bits as follows:

  **Letter/Digit Encoding: (5 bits)**

  Letter/Digit | Value
  :---: | :---:
  _End of field_ | 0
  a | 1
  b | 2
  ... | ...
  z | 26
  0 | 27
  1 | 28
  ... | ...
  9 | 36

* Field value is encoded into 2 bytes as follows:

  **Field Value: (2 bytes)**

  Field Type | Encoding
  :---: | :---
  int | Multiply value by 10 and encode as 16-bit integer
  float | Multiply value by 10 and encode as 16-bit integer
  String | Use **Field Name / String Value Encoding** above

The Arduino code for encoding a structured message may be found here:

[https://github.com/UnaBiz/unabiz-arduino/blob/master/Message.cpp](https://github.com/UnaBiz/unabiz-arduino/blob/master/Message.cpp)
