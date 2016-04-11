function [y] = kutta(t_0, y_0, f, h, n)

a = [0; 1/2; 1];
A = [0 0 0; 1/2 0 0; -1 2 0];
ksi = [1/6; 2/3; 1/6];
y = rk(a, ksi, A, t_0, y_0, f, h, n);

end

