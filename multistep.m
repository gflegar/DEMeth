function y = multistep(alpha, t_0, y_0, f, h, n)
m = size(alpha, 1);
y = zeros(size(y_0, 1), n+1);
fs = zeros(size(y_0, 1), m);

K = [0 0 0 0; 0.5 0.5 0 0; 1 -1 2 0; 0 1/6 2/3 1/6];

a = [0; 1/2; 1];
A = [0 0 0; 1/2 0 0; -1 2 0];
ksi = [1/6; 2/3; 1/6];
tmp = rk(a, ksi, A, t_0, y_0, f, h, m-1);
size(tmp)
y(:,1:m) = tmp;

for i = 1:m
    fs(:,i) = f(t_0 + (i-1)*h, y(:,i));
end

for i = m:n
    y(:,i+1) = y(:,i) + h * (fs*alpha);
    fs = [fs(:, 2:end), f(t_0 + i*h, y(:,i+1))];
end

end
