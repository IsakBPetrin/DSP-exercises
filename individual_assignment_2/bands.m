function [filtered_signal] = bands(knobs, signal, freq)
    Fs = 44100;  % Sampling frequency in Hz
    Rp = 2;      % Maximum passband ripple in dB
    Rs = 40;     % Minimum stopband attenuation in dB
    f_list = [1, 60, 125, 250, 500, 1000, 2000, 4000, 8000, 12000, 14000, 16000, 20000];

    % Initialize the filtered signal
    filtered_signal = zeros(size(signal));

    % Loop through each band
    for i = 1:12
        % Define the passband and stopband frequencies
        Wp = f_list(i+1) / (freq/2);
        Ws = f_list(i) / (freq/2);
        display(Wp)
        display(Ws)
        % Calculate Butterworth filter order and cutoff
        [n_butter, Wn_butter] = buttord(Wp, Ws, Rp, Rs);
        [b_butter, a_butter] = butter(n_butter, Wn_butter);

        % Apply the filter to the input signal
        band_filtered = filter(b_butter, a_butter, signal);

        % Scale the filtered band by the corresponding knob value
        band_filtered = knobs(i) * band_filtered;

        % Add the scaled band to the final output
        filtered_signal = filtered_signal + band_filtered;

    end
end
