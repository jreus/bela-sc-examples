/*******************
Analog Input
Connect a potentiometer to analog input 0
Connect a FSR + fixed resistor to analog input 1

AnalogIn returns a value from 0-1

.ar (analogPin: 0, mul: 1, add: 0)

analogPin:  Analog pin number to read. Pin numbers begin at 0. This value can be modulated at audiorate.


*/

s = Server.default;

s.options.numAnalogInChannels = 2; // can only be 2, 4 or 8
s.options.numAnalogOutChannels = 2;
s.options.numDigitalChannels = 0;
s.options.maxLogins = 16;  	   // set max number of clients

s.options.speakerMuted = 1;    // the speakers are not muted (so active)
s.options.numMultiplexChannels = 0; // do not enable multiplexer channels

s.options.blockSize = 16;
s.options.numInputBusChannels = 2;
s.options.numOutputBusChannels = 2;

s.waitForBoot{
	"Server Booted".postln;
	{
		var pitch = AnalogIn.ar(0) * 880;
		var gain = AnalogIn.ar(1); // returns a value from 0-1
		Out.ar(0, SinOsc.ar(pitch).dup * gain);
	}.play;
};






