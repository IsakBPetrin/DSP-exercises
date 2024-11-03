% Design of filters meeting the specifications

% Specifications
Fs = 20000;  % Sampling frequency in Hz
Wp = 1000 / (Fs/2);  % Passband edge normalized
Ws = 2000 / (Fs/2);  % Stopband edge normalized
Rp = 2;    % Maximum passband ripple in dB
Rs = 40;   % Minimum stopband attenuation in dB
T = 1;

% Butterworth filter
[n_butter, Wn_butter] = buttord(Wp, Ws, Rp, Rs);
[b_butter, a_butter] = butter(n_butter, Wn_butter);

% Chebyshev Type I filter
[n_cheby1, Wp_cheby1] = cheb1ord(Wp, Ws, Rp, Rs);
[b_cheby1, a_cheby1] = cheby1(n_cheby1, Rp, Wp_cheby1);

% Chebyshev Type II filter
[n_cheby2, Ws_cheby2] = cheb2ord(Wp, Ws, Rp, Rs);
[b_cheby2, a_cheby2] = cheby2(n_cheby2, Rs, Ws_cheby2);

% Elliptic filter
[n_ellip, Wp_ellip] = ellipord(Wp, Ws, Rp, Rs);
[b_ellip, a_ellip] = ellip(n_ellip, Rp, Rs, Wp_ellip);

%{
% Frequency responses
figure;
freqz(b_butter, a_butter, 1024, Fs);
title('Butterworth Filter Frequency Response');

figure;
freqz(b_cheby1, a_cheby1, 1024, Fs);
title('Chebyshev Type I Filter Frequency Response');

figure;
freqz(b_cheby2, a_cheby2, 1024, Fs);
title('Chebyshev Type II Filter Frequency Response');

figure;
freqz(b_ellip, a_ellip, 1024, Fs);
title('Elliptic Filter Frequency Response');

% Display filter order
fprintf('Butterworth Filter Order: %d\n', n_butter);
fprintf('Chebyshev Type I Filter Order: %d\n', n_cheby1);
fprintf('Chebyshev Type II Filter Order: %d\n', n_cheby2);
fprintf('Elliptic Filter Order: %d\n', n_ellip);
%}
T1 = 3;
t = 1/Fs: 1/Fs: T1;
F0 = 0;
F1 = 5000;


n = randn(Fs*T1, 1);
whitenoise = n / (max(n)) * .99;

s = chirp(t, F0, T1, F1);
chirp_signal = s * .99;

% Apply filters to the white noise and chirp signals
whitenoise_butter = filter(b_butter, a_butter, whitenoise);
whitenoise_cheby1 = filter(b_cheby1, a_cheby1, whitenoise);
whitenoise_cheby2 = filter(b_cheby2, a_cheby2, whitenoise);
whitenoise_ellip = filter(b_ellip, a_ellip, whitenoise);

chirp_butter = filter(b_butter, a_butter, chirp_signal);
chirp_cheby1 = filter(b_cheby1, a_cheby1, chirp_signal);
chirp_cheby2 = filter(b_cheby2, a_cheby2, chirp_signal);
chirp_ellip = filter(b_ellip, a_ellip, chirp_signal);
%{
Play filtered signals
fprintf('Playing filtered white noise signals...\n');
sound(whitenoise_butter, Fs);
pause(T1 + 1);
sound(whitenoise_cheby1, Fs);
pause(T1 + 1);
sound(whitenoise_cheby2, Fs);
pause(T1 + 1);
sound(whitenoise_ellip, Fs);
pause(T1 + 1);

fprintf('Playing filtered chirp signals...\n');
sound(chirp_butter, Fs);
pause(T1 + 1);
sound(chirp_cheby1, Fs);
pause(T1 + 1);
sound(chirp_cheby2, Fs);
pause(T1 + 1);
sound(chirp_ellip, Fs);
pause(T1 + 1);
%}

[hum, hum_fs] = audioread("/Users/isakpetrin/Desktop/Semester 5/Week 1 - signals sampling aliasing/Week 6 - Design of digital filters/sounds/hum.wav");
[scrambled_eggs, egg_fs] = audioread("/Users/isakpetrin/Desktop/Semester 5/Week 1 - signals sampling aliasing/Week 6 - Design of digital filters/sounds/scrambled_eggs_5s.wav");

% Adjust hum length to match scrambled_eggs
if length(hum) < length(scrambled_eggs)
    hum = repmat(hum, ceil(length(scrambled_eggs) / length(hum)), 1);
    hum = hum(1:length(scrambled_eggs));
end

% Overlay hum on scrambled_eggs
combined_signal = scrambled_eggs + hum;

% Play the combined signal
sound(combined_signal, egg_fs);

Fs = 20000;  % Sampling frequency in Hz
Wp = 50 / (Fs/2);  % Passband edge normalized
Ws = 0 / (Fs/2);  % Stopband edge normalized
Rp = 40;    % Maximum passband ripple in dB
Rs = 2;   % Minimum stopband attenuation in dB
T = 1;

% Butterworth filter
[n_butter, Wn_butter] = buttord(Wp, Ws, Rp, Rs);
[b_butter, a_butter] = butter(n_butter, Wn_butter);

% Chebyshev Type I filter
[n_cheby1, Wp_cheby1] = cheb1ord(Wp, Ws, Rp, Rs);
[b_cheby1, a_cheby1] = cheby1(n_cheby1, Rp, Wp_cheby1);

% Chebyshev Type II filter
[n_cheby2, Ws_cheby2] = cheb2ord(Wp, Ws, Rp, Rs);
[b_cheby2, a_cheby2] = cheby2(n_cheby2, Rs, Ws_cheby2);

% Elliptic filter
[n_ellip, Wp_ellip] = ellipord(Wp, Ws, Rp, Rs);
[b_ellip, a_ellip] = ellip(n_ellip, Rp, Rs, Wp_ellip);

