function y = enhanced_euler(t_0, y_0, f, h, n)
y = zeros(size(y_0, 1), n+1);
y(:,1) = y_0;
for i = 1:n
    ti = t_0 + (i-1) * h;
    y(:,i+1) = y(:,i) + h * f(ti + h/2, y(:,i) + (h/2)*f(ti,y(:,i)));
end
end
