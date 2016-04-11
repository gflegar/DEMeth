function [y] = meuler(t_0, y_0, f, h, n)

phi = @(t_i, y_i, h_i) f(t_i + h_i/2, y_i + h/2 * f(t_i, y_i));
y = onestep(t_0, y_0, h, n, phi);

end

