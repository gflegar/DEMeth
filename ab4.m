function [y] = ab4(t_0, y_0, f, h, n)

alpha = 1/24 * [-9; 37; -59; 55];
y = ab(alpha, t_0, y_0, f, h, n);

end

