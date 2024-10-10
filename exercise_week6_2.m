% Given specifications:
G_p = 0.785; % Passband gain
G_s = 0.2818; % Stopband gain

% Analog frequencies (rad/s):
omega_h = 35; % Highest frequency to be processed
omega_p = 10; % Passband frequency
omega_s = 15; % Stopband frequency

T = 1 / (omega_h / pi);

f_s = omega_h;  % Assume highest frequency corresponds to sampling rate

% Pre-warp the frequencies for bilinear transform
Omega_p = (2 / T) * tan((omega_p * T) / 2);
Omega_s = (2 / T) * tan((omega_s * T) / 2);



% Convert dB specifications
Rp = 2;  % Passband ripple in dB
Rs = 11; % Stopband attenuation in dB

[n, Wn] = buttord(Omega_p , Omega_s, Rp, Rs, 's');

[B, A] = butter(n, Wn, 's');

[bz, az] = bilinear(B, A, f_s);

fs = f_s;

% Plot the amplitude and phase response of the filter
[H, w] = freqz(bz, az, 1024, fs);
figure;
subplot(2,1,1);
plot(w, 20*log10(abs(H)));
title(sprintf('Amplitude Response of the Filter\nPassband ≤ %d rad/s, Stopband ≥ %d rad/s', omega_p, omega_s));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

subplot(2,1,2);
plot(w, angle(H));
title('Phase Response of the Filter');
xlabel('Frequency (Hz)');
ylabel('Phase (Radians)');
grid on;