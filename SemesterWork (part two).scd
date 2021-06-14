s.boot; // This line of code activates the server.


s.meter; // This line of code displays the audio counting bars in a new window.


/*

Below i quote to you the function of the audio track

*/


(
~mypiece = {
	arg freq = 7;
	var aud, vibrato;

	vibrato = SinOsc.ar(freq, 0, 20, 300);
	aud = SinOsc.ar(vibrato, mul: 0.2)!2;
	aud = aud + Pulse.ar(freq * [1, 1, 1.5], 0.1);
	aud = aud + BrownNoise.ar(0.02!2);
	aud = aud * Line.ar(1, 5, 8);

};
)


m = ~mypiece.play(args: [\freq,7]); // Press here ctrl + (.) to play the track.


m.set(\gate, 0, \fadeTime, 5); // Press here ctrl + (.), after 7 seconds, to stop the audio track.


s.quit; // This line of code shuts down the server.







































