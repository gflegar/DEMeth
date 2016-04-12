function [y] = ab(alpha, t_0, y_0, f, h, n)

m = length(alpha);
y = zeros(length(y_0), n+1);
fs = zeros(length(y_0), m);
y(:,1:m) = runge_kutta(t_0, y_0, f, h, m-1);
for i = 1:m
    fs(:,i) = f(t_0 + (i-1)*h, y(:,i));
end
for i = m:n
    y(:,i+1) = y(:,i) + h*(fs*alpha);
    fs = [fs(:, 2:end), f(t_0 + i*h, y(:,i+1))];
end

end
