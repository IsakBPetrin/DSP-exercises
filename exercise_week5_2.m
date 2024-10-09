% Exercise 2.1
clear all;

m4aFilename = "C:\Users\jwhan\OneDrive\Documents\MATLAB\mini-me_short.wav";

[xn, Fs] = audioread(m4aFilename);
% sound(y, Fs);

delay = 100/1000 * Fs

alpha = 0.1;

yn = zeros(1,length(xn));
limit = 5
for i = 1:limit
    for k  = delay + 1:length(xn)
        yn(k) = alpha * xn(k-delay) + xn(k);
    end
    
    for k  = delay + 1:length(yn)
        xn(k) = alpha * yn(k-delay) + yn(k);
    end
end

sound(xn, Fs)

