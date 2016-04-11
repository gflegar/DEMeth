function [y] = rk(a, ksi, A, t_0, y_0, f, h, n)

phi = @(t_i, y_i, h_i) step(a, ksi, A, f, t_i, y_i, h_i);
y = onestep(t_0, y_0, h, n, phi);

end

function [val] = step(a, ksi, A, f, t, y, h)

k = size(a, 1);
psi = zeros(size(y, 1), k);
for i = 1:k
    psi(:,i) = f(t + a(i)*h, y + h * (psi * A(i,:)'));
end
val = psi * ksi;

end
