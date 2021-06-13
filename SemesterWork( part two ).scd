s.boot;

s.quit;

s.meter;


(
~vib = {
	var sig, vib;

	vib = SinOsc.ar(6, 0, 20, 300);
sig = SinOsc.ar(vib, mul: 0.2)!2;


}.play;
)

