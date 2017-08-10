/*******************
Remotely Control the Bela

Use this project to boot scsynth on the Bela.

 * Please note that support for SuperCollider on Bela is still experimental,
 * so feel free to report issues here: https://github.com/sensestage/supercollider/issues
 *
 * This script simply starts scsynth, which then waits for messages.
 * Use the code in remote-examples to interact with the board from
 * the SuperCollider IDE running on the host.

*/

// NOTE: the settings provided here may not be the most sensible in terms of gains.

s = Server.default;

s.options.numAnalogInChannels = 4;
s.options.numAnalogOutChannels = 4;
s.options.numDigitalChannels = 16;
s.options.maxLogins = 4;

s.options.headphoneLevel = 0; // sets the headphone level to 0 dB
s.options.speakerMuted = 0;    // the speaker amps are muted to save power
s.options.dacLevel = 0;       // sets the gain of the dac to 0 dB
s.options.adcLevel = 0;       // sets the gain of the adc to 0 dB
s.options.numMultiplexChannels = 0; // do not enable multiplexer channels

s.options.memSize = 8192 * 16; // the default is 8192 which is quite little
s.options.blockSize = 16;

s.options.numInputBusChannels = 2;
s.options.numOutputBusChannels = 2;

s.boot;
