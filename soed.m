function [x] = soed(f, r, q, a, b, alpha, beta, n)
    h = (b - a) / (n + 1);
    A = zeros(n,n);
    b = zeros(n,1);
    for i = 1:n
        A(i,i) = 2 - q(a + i*h);
        b(i) = f(a + i*h);
        if i > 1
            A(i,i-1) = r(a + i*h)*h/2 - 1;
        else
            b(i) = b(i) + (1/h^2 - r(a) / (2*h)) * alpha;
        end
        if i < n
            A(i,i+1) = - r(a + i*h)*h/2 - 1;
        else
            b(i) = b(i) + (1/h^2 + r(b) / (2*h)) * beta;
        end
    end

    x = A \ b;
end

