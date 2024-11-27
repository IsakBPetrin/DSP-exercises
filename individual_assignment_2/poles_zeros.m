function [B,A] = poles_zeros(zeros,poles)
    B = poly(zeros);
    A = poly(poles);
end