% echo function

function [yn, Fs] = echo(signal, Fs, delay, alpha)
    yn = zeros(1,length(signal));
    for k  = delay + 1:length(signal)
        yn(k) = alpha * signal(k - (delay * Fs)) + signal(k);
        disp(k)
    end
end

