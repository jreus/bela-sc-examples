/*******************
Blink a LED using a Tactile Switch
Connect a LED+resistor to digital pin 0
Connect a tactile switch+pull-down resistor to digital pin 1

DigitalOut takes three arguments:
ar (digitalPin: 0, output: 0, writeMode: 0, mul: 1, add: 0)

digitalPin:  Digital pin number to write to. Pin numbers begin at 0. This value cannot be modulated.
Pin numbers are labled in the Pin Diagram tab in the Bela IDE.

output:  Value to write out to the pin - the value will be 1 when the argument is larger than 0, otherwise 0.

writeMode:	Mode of writing to the output, this can be 0 (using Bela's DigitalWrite and only when value changes) or 1 (using Bela's DigitalWriteOnce). This value cannot be modulated.

DigitalInput takes three arguments:



*/

s = Server.default;

s.options.numAnalogInChannels = 2;
s.options.numAnalogOutChannels = 2;
s.options.numDigitalChannels = 1;
s.options.maxLogins = 16;  	   // set max number of clients

s.options.speakerMuted = 1;    // the speakers are not muted (so active)
s.options.numMultiplexChannels = 0; // do not enable multiplexer channels

s.options.blockSize = 16;
s.options.numInputBusChannels = 2;
s.options.numOutputBusChannels = 2;

s.waitForBoot{
	"Server Booted".postln;
	{
		DigitalOut.ar(0, LFPulse.ar(0.5).poll(1), 0);
	}.play;
};


/*
DigitalOut & DigitalIn are more efficient than DigitalIO
DigitalIO is writing data every frame and checking the pin IO status
*/




