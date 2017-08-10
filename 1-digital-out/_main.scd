/*******************
Blink a LED
Connect a LED+resistor to digital pin 0

DigitalOut takes three arguments:
ar (digitalPin: 0, output: 0, writeMode: 0, mul: 1, add: 0)

digitalPin:  Digital pin number to write to. Pin numbers begin at 0. This value cannot be modulated.
Pin numbers are labled in the Pin Diagram tab in the Bela IDE.

output:  Value to write out to the pin - the value will be 1 when the argument is larger than 0, otherwise 0.

writeMode:	Mode of writing to the output, this can be 0 (using Bela's DigitalWrite and only when value changes) or 1 (using Bela's DigitalWriteOnce). This value cannot be modulated.

*/

s = Server.default;

s.options.numAnalogInChannels = 2;
s.options.numAnalogOutChannels = 2;
s.options.numDigitalChannels = 16;
s.options.maxLogins = 16;  	   // set max number of clients

s.options.speakerMuted = 0;    // the speakers are not muted (so active)
s.options.numMultiplexChannels = 0; // do not enable multiplexer channels

s.options.blockSize = 16;
s.options.numInputBusChannels = 2;
s.options.numOutputBusChannels = 2;

s.waitForBoot{
	SynthDef('blinker', {arg outPin, rate=1;
		DigitalOut.ar(outPin, LFPulse.ar(rate))
	}).add;
	
	s.sync;
	
	a = Synth('blinker', ['outPin', 6, 'rate', 1]);
};

