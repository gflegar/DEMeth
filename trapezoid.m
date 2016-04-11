function [y] = trapezoid(t_0, y_0, f, h, n)

y = onestep_imp(t_0, y_0, h, n, @(t_i, y_i, h_i) solver(f, t_i, y_i, h_i));

end

function [y_n] = solver(f, t_i, y_i, h)

y_0 = y_i + h * f(t_i, y_i);
y_n = fsolve(@(y) (h/2)*(f(t_i, y_i) + f(t_i+h,y)) + y_i - y, y_0);

end

