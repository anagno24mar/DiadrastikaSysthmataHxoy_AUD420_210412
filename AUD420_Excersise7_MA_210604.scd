/*
from : http://sccode.org/1-5eN
Παραθέτω το κομμάτι του Batuhan Bozkurt ( http://sccode.org/1-5eN, γραμμή 16 ).
Η επιλογή είναι τυχαία. Θα πειραματιστώ, αλλάζοντας τους αριθμούς στις παραμέτρους, για να δω το ακουστικό αποτέλεσμα.
*/

// Prototype.

{a=LocalIn.ar;LocalOut.ar(Mix.ar(x=SinOsc.ar((Decay.ar(Impulse.ar([4,4.005]),1e3*a.abs)*50), a).distort));x;}.play;//tryingharder_to_noavail

// First attempt. Ενδιαφέρον!!!

{a=LocalIn.ar;LocalOut.ar(Mix.ar(x=SinOsc.ar((Decay.ar(Impulse.ar([1,8.005]),1e3*a.abs)*50), a).distort));x;}.play;//tryingharder_to_noavail


// Play the composition with fade out, 5 seconds at the end.
(
{
var synth;
	synth = {a=LocalIn.ar;LocalOut.ar(Mix.ar(x=SinOsc.ar((Decay.ar(Impulse.ar([1,8.005]),1e3*a.abs)*50), a).distort));x;}.play;
	3.wait;
	synth release: 5
}.fork;
)

// Create a function for playing the above.

(
~sound1 = {| duration = 3, release = 5 |
	{
		var synth;
		synth = {a=LocalIn.ar;LocalOut.ar(Mix.ar(x=SinOsc.ar((Decay.ar(Impulse.ar([1,8.005]),1e3*a.abs)*50), a).distort));x;}.play;
		duration.wait;
		synth release: release
	}.fork;
}
)

// Understanding Impulse.
{ Impulse.ar(MouseX.kr(5, 50), 0, 0.3) }.scope;

{ Impulse.ar(MouseX.kr(5, 50) * [1, 2], 0, 0.3) }.scope;//multichannel expansion: stereo!

{ Mix(Impulse.ar(MouseX.kr(5, 50) * (1..20), 0, 0.3)) }.scope;//multichannel expansion, mixed!

{ Mix(Dust.ar(MouseX.kr(0.1, 5) / (1..20))) }.scope;//multichannel expansion, mixed!

/*

We feed the impulses produced by Dust into a Decay ugen, in order to extend their duration.
This produces a series of envelopes.
We use these envelopes as anplitude envelopes in order to form the anplitude of A noise signal.

*/
(
{
	var src, fx;
	src = Dust.kr(MouseX.kr(0.1, 5) / (1..20));
	fx = Decay.kr(src);
	Mix(fx) * WhiteNoise.ar(0.2);


}.scope;//extend using decay and noise!
)

{ Dust.ar(MouseX.kr(5, 50)) }.scope;


0.5 * [1, 2, 3, 4, 5];

0.5 + [1, 2, 3, 4, 5];

0.5 + (1..10);

(1..20) ** 0.5;

(1..20) ** (1/2);

(1..20) ** (1/3);

(1..20) ** 3.reciprocal;
(1..20) ** 2.reciprocal;

(1..20).squared;
(1..20).sqrt;







{ Impulse.ar(SinOsc.kr(0.1).range(0.5, 500), 0, 0.3) }.scope;

{ Impulse.ar(SinOsc.kr(0.1).range(MouseX.kr(0.5, 10), MouseY.kr(20, 500)), 0, 0.3) }.scope;



// Look at the contents of ~sound1.

~sound1;


// Evaluate a function contained ~sound1.

~sound1.value;

~sound1.value(2,0.07);

~sound1.(2,0.07);


// Repeat ~sound1 2 times. Wait 3 seconds before the second time.

(
{
	~sound1.value;
	3.wait;
	~sound1.value;
}.fork;
)


// Add arguments to customize number of repeats and wait time.
// " Parametrisation "

(
~piece1 = { | repeats = 3, delay = 3 |
	{
		repeats do: {
			~sound1.value;
			delay.wait;
		}

	}.fork;

}
)

// Look at the contents of ~piece1.

~piece1;
~piece2;

// Evaluate a function contained ~piece1.

~piece1.value;


// Change the number of repeats.
~piece1.value(12);

// Change the number of repeats and the waiting time.
~piece1.value(12, 0.3);

