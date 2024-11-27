%Part one
r_pole = 0.9;

zeros = [exp(2i*pi)];
poles = [r_pole * exp(i*pi)];

[B,A] = poles_zeros(zeros,poles);

figure(1)
zplane(zeros, poles)
title('Pole-Zero Plot')

%Part two
simple_knobs = [1,1,1,0,0,0,0,0,0,0,0,0];
bass_boost_knobs = [1.5 , 1.3 , 1.2, 1, 0.8, 0.7, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5];
treble_boost_knobs = [0.5, 0.5, 0.5, 0.5, 0.8, 1, 1.2, 1.3, 1.4, 1.5, 1.5, 1.5];
vocal_enhancer_knobs = [0.7, 0.8, 1, 1.3, 1.5, 1.3, 1, 0.8, 0.7, 0.6, 0.5, 0.5];
lo_fi_knobs = [0.5, 0.5, 0.6, 0.8, 1, 1, 0.8, 0.6, 0.5, 0.5, 0.5, 0.5];
concer_hall_knobs = [1.2, 1.1, 1, 1, 1, 1.1, 1.2, 1, 0.9, 0.8, 0.7, 0.6];
radio_effect_knobs = [0.3, 0.4, 0.6, 0.8, 1, 1.2, 1.2, 1, 0.6, 0.4, 0.3, 0.2];
party_knobs = [1.5, 0.7, 1.4, 0.8, 1.3, 0.6, 1.2, 0.7, 1.1, 0.8, 1.3, 0.9];






knobs = [1, 0.8, 1.2, 1, 1, 0.5, 1.5, 1, 0.9, 1.1, 0.7, 1.3];  % gains for each band on a normalised scale (0 - <1 means attenuate, >1 means amplify)

[signal, fs] = audioread("/Users/isakpetrin/Documents/GitHub/Fagprojekt/DSP-exercises/merry-christmas.wav");
[scrambled_eggs, egg_fs] = audioread("/Users/isakpetrin/Desktop/Semester 5/Week 1 - signals sampling aliasing/Week 6 - Design of digital filters/sounds/scrambled_eggs_5s.wav");
output_signal = bands(party_knobs,signal, fs);


% sound(scrambled_eggs, fs)
% sound(output_signal,fs)

% part three
[signal, Fs] = audioread("/Users/isakpetrin/Documents/GitHub/Fagprojekt/DSP-exercises/merry-christmas.wav");
delay = 1;
alpha = 0.5;


[yn, Fs] = echo(signal, Fs, delay, alpha);

sound(yn, Fs)




