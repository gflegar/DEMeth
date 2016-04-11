function [y] = euler(t_0, y_0, f, h, n)

y = onestep(t_0, y_0, h, n, @(t_i, y_i, h_i) f(t_i, y_i));

end
