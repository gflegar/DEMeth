function [y] = am4(t_0, y_0, f, h, n)

alpha = 1/720 * [-19; 106; -264; 646; 251];
y = am(alpha, t_0, y_0, f, h, n);

end

