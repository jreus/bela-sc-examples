/*******************
Blink a LED

DigitalOut takes three arguments:
ar (digitalPin: 0, output: 0, writeMode: 0, mul: 1, add: 0)

digitalPin:  Digital pin number to write to. Pin numbers begin at 0. This value cannot be modulated.

output:  Value to write out to the pin - the value will be 1 when the argument is larger than 0, otherwise 0.

writeMode:	Mode of writing to the output, this can be 0 (using Bela's DigitalWrite and only when value changes) or 1 (using Bela's DigitalWriteOnce). This value cannot be modulated.

*/

~blinker = {
	DigitalOut.kr(0, LFPulse.kr(0.5), 0);
}.play;


