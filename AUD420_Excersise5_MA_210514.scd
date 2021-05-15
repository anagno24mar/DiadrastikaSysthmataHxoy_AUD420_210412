/*
from : http://sccode.org/1-5eN

Παραθέτω το κομμάτι του Batuhan Bozkurt ( http://sccode.org/1-5eN, γραμμή 16 ).

Η επιλογή είναι τυχαία. Θα πειραματιστώ, αλλάζοντας τους αριθμούς στις παραμέτρους, για να δω το ακουστικό αποτέλεσμα.

*/

// Prototype.

{a=LocalIn.ar;>LocalOut.ar(Mix.ar(x=SinOsc.ar((Decay.ar(Impulse.ar([4,4.005]),1e3*a.abs)*50), a).distort));x;}.play;//tryingharder_to_noavail

// First attempt. Ενδιαφέρον!!!

{a=LocalIn.ar;L>ocalOut.ar(Mix.ar(x=SinOsc.ar((Decay.ar(Impulse.ar([1,8.005]),1e3*a.abs)*50), a).distort));x;}.play;//tryingharder_to_noavail


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
~sound1 = {
{
var synth;
	synth = {a=LocalIn.ar;LocalOut.ar(Mix.ar(x=SinOsc.ar((Decay.ar(Impulse.ar([1,8.005]),1e3*a.abs)*50), a).distort));x;}.play;
		3.wait;
		synth release: 5
	}.fork;
}
)


// Look at the contents of ~sound1.

~sound1;


// Evaluate a function contained ~sound1.

~sound1.value;


// Repeat ~sound1 2 times. Wait 3 seconds before the second time.

(
{
	~sound1.value;
	3.wait;
	~sound1.value;
}.fork;
)

//


