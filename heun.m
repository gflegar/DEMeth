function [y] = heun(t_0, y_0, f, h, n)

a = [0; 1/3; 1];
A = [0 0 0; 1/3 0 0; 0 2/3 0];
ksi = [1/4; 0; 3/4];
y = rk(a, ksi, A, t_0, y_0, f, h, n);

end

