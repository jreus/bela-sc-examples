/*******************
Hello Bela!
Connect your headphones to the stereo audio output of the Bela and run this program.
*/


s = Server.default;

// Set up options for the Bela
s.options.numAnalogInChannels = 2;
s.options.numAnalogOutChannels = 2;
s.options.numDigitalChannels = 0;
s.options.maxLogins = 4;
s.options.speakerMuted = 0;    // mute the onboard audio amps
s.options.numMultiplexChannels = 0; // do not enable multiplexer channels

s.options.blockSize = 16;
s.options.numInputBusChannels = 2;
s.options.numOutputBusChannels = 2;

s.waitForBoot {
	// Your code goes here.
	b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");

	{
		BufRd.ar(1, b, SinOsc.ar(0.08) * BufFrames.ir(b))
	}.play;
};






