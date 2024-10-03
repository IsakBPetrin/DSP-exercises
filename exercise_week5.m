
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
%}


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










