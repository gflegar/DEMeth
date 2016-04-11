function y = trapezoid(t_0, y_0, A, h, n)
y = zeros(size(y_0, 1), n+1);
y(:,1) = y_0;
if size(A, 1) == 0
    return;
end
I = eye(size(A));
for i = 1:n
    y(:,i+1) = (I - h/2 * A) \ (I - h/2 * A) * y(:,i);
end
end

