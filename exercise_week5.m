
% Exercise 1
%% Running sum filter
% Order 3
%{
N = 3;
h = ones(1,N);
h_roots = roots(h);
poles = roots([1,0,0]);
disp("zeros 3")
disp(h_roots);
disp("poles 3")
disp(poles);

figure(1)
zplane(h_roots, poles)
title('Pole-Zero Plot for N=3')
B = poly(h_roots);
A = poly(poles);
figure(2)
freqz(B, A, 1024, 'whole')
title('Frequency Response for N=3')



% Order 5

N = 5;
h = ones(1,N);
zeros = roots(h);
poles = roots([1 0 0 0 0]);
disp("zeros 5")
disp(zeros);
disp("poles 5")
disp(poles);
figure(3)
zplane(zeros, poles)
title('Pole-Zero Plot for N=5')

B = poly(zeros);
A = poly(poles);
figure(4)
freqz(B, A, 1024, 'whole')
title('Frequency Response for N=5')


%% Moving Average

% Order 5 moving average
N = 5;
h = ones(1,N) / (N + 1);
zeros = roots(h);
poles = roots([1 0 0 0 0]);
disp("zeros 5")
disp(zeros);
disp("poles 5")
disp(poles);
figure(5)
zplane(zeros, poles)
title('Pole-Zero Plot for N=5 (average)')

B = poly(zeros);
A = poly(poles);
figure(6)
freqz(B, A, 1024, 'whole')
title('Frequency Response for N=5 (average)')


%Designing filter in the z-domain


r  = 0.9
zeros = [exp(2*pi * 0.1i); exp(-2*pi * 0.1i); conj(exp(0.8i*pi)); conj(exp(-0.8i*pi))];
poles  = [r * exp(2*pi * 0.1i); r * exp(-2*pi * 0.1i); r * conj(exp(0.8i*pi)); r * conj(exp(-0.8i*pi))];

%figure(1)
zplane(zeros, poles)

B = poly(zeros);
A = poly(poles);
figure(2)
freqz(B, A, 1024, 'whole')
%}


%{
r  = 0.5;
%zeros = [exp(2*pi * 0.05i); exp(2i*pi)];
%poles  = [r * exp(2*pi * 0.05i); r * exp(2i*pi)];

zeros = [exp(1i*pi)]
poles = [r * exp(2i*pi)]

B = poly(zeros);
A = poly(poles);
h = B/A;

a = 1;
f = 200;
phi = 0;
fs = 10000;
T = 1;
[signal_1, t_1] = generate_sinusoid(a,f * 1,phi,fs,T);
[signal_2, t_2] = generate_sinusoid(a,f * 5,phi,fs,T);
[signal_3, t_3] = generate_sinusoid(a,f * 10,phi,fs,T);
signal = signal_1 + signal_2 + signal_3;

[filtered_signal, zf]= filter(h,1, signal);

[Y_filtered, freq_filtered] = make_spectrum(filtered_signal, fs, true);
[Y, freq] = make_spectrum(signal, fs, true);

figure(1)
plot(freq_filtered, Y_filtered)
figure(2)
plot(freq, Y)
%}



%{
hold on;
figure(1)
plot(t_1, filtered_signal)
plot(t_1, signal)
legend({'filtered signal','signal'})
xlim([0 0.1])

hold off;
%}

%Exercise 1.2

%{
r_pole = 0.9

zeros = [exp(1i*pi)];
poles = [r_pole * exp(2i*pi)];



zeros_poly = poly(zeros);
poles_poly = poly(poles);
h = zeros_poly/poles_poly;


a = 1;
f = 20;
phi = 0;
fs = 100000;
T = 1;

signal
[signal_1, t_1] = generate_sinusoid(a,f * 1,phi,fs,T);
[signal_2, t_2] = generate_sinusoid(a,f * 5,phi,fs,T);
[signal_3, t_3] = generate_sinusoid(a,f * 10,phi,fs,T);
signal = signal_1 + signal_2 + signal_3;
%}


%{
hold on;
plot(t_1,signal_1)
plot(t_2,signal_2)
plot(t_3,signal_3)
xlim([0,0.1])
hold off;
%}

%{
hold on;
figure(1)
plot(t_1, filtered_signal)
plot(t_1, signal)
xlim([0 0.1])
hold off;

[Y_filtered, freq_filtered] = make_spectrum(filtered_signal, fs, true);
[Y, freq] = make_spectrum(signal, fs, true);
filtered_signal = filter(zeros_poly,poles_poly,signal)
hold on;
figure(2)
plot(freq, Y)
xlim([0 500])
hold off;

hold on;
figure(3)
plot(freq, Y_filtered)
xlim([0 500])
hold off;

%}




r_pole = 0.9;

zeros = [exp(2i*pi)];
poles = [r_pole * exp(i*pi)];



zeros_poly = poly(zeros);
poles_poly = poly(poles);

m4aFilename = "Voice.m4a";
[y, Fs] = audioread(m4aFilename);
%sound(y, Fs);

filtered_voice = real(filter(zeros_poly, poles_poly, y));

sound(filtered_voice, Fs);
