

s.boot;

(
SynthDef('karp', {arg freq=200, amp=0.5, pan=0, dur=1, trig=1, deltime=0.01, dectime=2, coef=0.1;
	var sig, env;
	sig = Pluck.ar(WhiteNoise.ar(0.1), trig, 1, freq.reciprocal, 2, coef);
	env = EnvGen.ar(Env.perc(0.01, 1), trig, timeScale: dur, doneAction: 2);
	Out.ar(0, Pan2.ar(sig * env * amp, pan));
}).send(s);
);
(
Ndef('ctrl', {
	var a0 = SinOsc.kr(0.1).range(0, 1);
	var a1 = SinOsc.kr(0.3).range(0, 1);
	SendReply.kr(Impulse.kr(10), '/ctrl', [a0,a1]);
}).play;

// Use this when controlling remotely
OSCdef('listen', {arg msg;
	~dur = msg[3].linlin(0.0, 1.0, 0.5, 1);
	~pitch = msg[4].linlin(0.0, 1.0, 300, 900);
	[~dur, ~pitch].postln;
}, '/ctrl');
);

(
a = Pdef('pattern',
	Pbind('instrument', 'karp',
	'freq', Pbinop('*', Pseq(Scale.dorian.ratios * [1, 2, 4], inf), Pfunc({~pitch})),
	'amp', Pwhite(0.3, 0.7),
	'dur', Pfunc({~dur}),
	'coef', Pseq([-1, 0, 0.3, 1],inf),
	'pan', Pseq([-1, 1],inf),
)).play;
);

Pattern



s.options.memSize * 16

Scale.dorian.ratios

Pmul

a.stop;
