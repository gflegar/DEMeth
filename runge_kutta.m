function [y] = runge_kutta(t_0, y_0, f, h, n)

a = [0; 1/2; 1/2; 0];
A = [0 0 0 0; 1/2 0 0 0; 0 1/2 0 0;  0 0 1 0];
ksi = [1/6; 1/3; 1/3; 1/6];
y = rk(a, ksi, A, t_0, y_0, f, h, n);

end

