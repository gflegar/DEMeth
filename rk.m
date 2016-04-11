function [y] = rk(a, ksi, A, t_0, y_0, f, h, n)

psi = @(t_i, y_i, h_i) step(a, ksi, A, t_i, y_i, f, h_i);
y = onestep(t_0, y_0, h, n, psi);

%y = zeros(size(y_0, 1), n+1);
%y(:,1) = y_0;
%for i = 1:n
%    ti = t_0 + (i-1)*h;
%    psi_1 = f(ti, y(:,i));
%    psi_2 = f(ti + A(2,1)*h, y(:,i) + h*A(2,2)*psi_1);
%    psi_3 = f(ti + A(3,1)*h, y(:,i) + h*(A(3,2)*psi_1 + A(3,3) * psi_2));
%    y(:,i+1) = y(:,i) + h *(A(4,2)*psi_1 + A(4,3)*psi_2 + A(4,4)*psi_3);
%end
end

function [y_n] = step(a, ksi, A, t, y, f, h)

k = size(a, 1);
psi = zeros(size(y, 1), k);
for i = 1:k
    psi(:,i) = f(t + a(i)*h, y + h * (psi * A(i,:)'));
end

y_n = y + h * (psi * ksi');

end
