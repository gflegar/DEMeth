function [y] = onestep_imp(t_0, y_0, h, n, solver)

y = zeros(length(y_0), n+1);
y(:,1) = y_0;

for i = 1:n
    y(:,i+1) = solver(t_0 + (i-1)*h, y(:,i), h);
end

end

