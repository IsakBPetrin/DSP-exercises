clear all;
zero_r1 = 1;
pole_r1 = 1;

zeros_1 = zero_r1 * [exp(1i*(pi/4)),exp(-1i*(pi/4))];
poles_1 = [pole_r1 * exp(3i*(pi/4)), pole_r1 * exp(-3i*(pi/4))];
B1 = poly(zeros_1)
A1 = poly(poles_1)





zero_r2 = 1.05;
pole_r2 = 0.95;

zeros_2 = zero_r2 * [exp(pi*(1/4i)),exp(pi*(-1/4i))];
poles_2 = pole_r2 * [exp(3i*(pi/4)), exp(-3i*(pi/4))];
B2 = poly(zeros_2)
A2 = poly(poles_2)




% Plot Z-plane for both systems in figure 1
figure(1)
subplot(2,1,1)  % Create a 2-row, 1-column grid, plot in 1st cell
zplane(zeros_1, poles_1)
title('Z-plane of System 1')

subplot(2,1,2)  % Plot in 2nd cell
zplane(zeros_2, poles_2)
title('Z-plane of System 2')

% Frequency response for both systems in figure 2
figure(2)
subplot(2,1,1)  % Create a 2-row, 1-column grid, plot in 1st cell
freqz(B1, A1, 1024, 'whole')
title('Frequency Response of System 1')

figure(3)
subplot(2,1,2)  % Plot in 2nd cell
freqz(B2, A2, 1024, 'whole')
title('Frequency Response of System 2')

% Impulse response for both systems in figure 3
figure(4)
subplot(2,1,1)  % Create a 2-row, 1-column grid, plot in 1st cell
impz(B1, A1)
title('Impulse Response of System 1')

subplot(2,1,2)  % Plot in 2nd cell
impz(B2, A2)
title('Impulse Response of System 2')

