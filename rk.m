function y = rk(A, t_0, y_0, f, h, n)
y = zeros(size(y_0, 1), n+1);
y(:,1) = y_0;
for i = 1:n
    ti = t_0 + (i-1)*h;
    psi_1 = f(ti, y(:,i));
    psi_2 = f(ti + A(2,1)*h, y(:,i) + h*A(2,2)*psi_1);
    psi_3 = f(ti + A(3,1)*h, y(:,i) + h*(A(3,2)*psi_1 + A(3,3) * psi_2));
    y(:,i+1) = y(:,i) + h *(A(4,2)*psi_1 + A(4,3)*psi_2 + A(4,4)*psi_3);
end
end
