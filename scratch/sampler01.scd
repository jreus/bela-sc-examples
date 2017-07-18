SynthDef('looper', {arg buf, outChan=0;
	var ctrl = AnalogIn.ar(0);
	var sig = PlayBuf.ar(1, buf, rate: ctrl.range(0.4, 5.0), loop: 1);
	Out.ar(outChan, sig.dup);
}).add;

b = Buffer.alloc(s, 44100 * 1.0, 1);

SynthDef('record', {arg buf;
	var in = SoundIn.ar(0);
	var button = DigitalIn.ar(7);
	RecordBuf.ar(in, buf, run: button, trigger: button);
}).add;

s.sync;

l = Synth('looper', ['buf', b]);
r = Synth('record', ['buf', b]);