function [y] = am(alpha, t_0, y_0, f, h, n)

m = length(alpha) - 1;
y = zeros(length(y_0), n+1);
fs = zeros(length(y_0), m);
y(:,1:m) = runge_kutta(t_0, y_0, f, h, m-1);
for i = 1:m
    fs(:,i) = f(t_0 + (i-1)*h, y(:,i));
end
for i = m:n
    ti = t_0 + (i-1)*h;
    y_i0 = y(:,i) + h*fs(:,end);
    fn = @(cy) h*(fs*alpha(1:end-1) + alpha(end)*f(ti+h,cy)) + y(:,i) - cy;
    y(:,i+1) = fsolve(fn, y_i0);
    fs = [fs(:, 2:end), f(ti + h, y(:,i+1))];
end

end

