function test_methods(n, t)
switch t
    case 1
        s = 1;
        e = 10;
        A = [];
        fn = @(t, y) -y/(t^2);
        sol = @(t) exp(1./t);
    case 2
        s = 1;
        e = 5;
        A = [];
        fn = @(t, y) 2*t*y;
        sol = @(t) exp(t.^2);
    case 3
        s = 0.1;
        e = 1;
        A = [];
        fn = @(t, y) -y / (t^2 * tan(1/t));
        sol = @(t) sin(1./t);
    case 4
        s = 1;
        e = 10;
        A = 1;
        fn = @(t, y) A*y;
        sol = @(t) exp(t);
    case 5
        s = 0;
        e = 1;
        A = [];
        fn = @(t, y) y*tan(t) + 1/cos(t);
        sol = @(t) t ./ cos(t);
    case 6
        s = 0;
        e = 5;
        A = [3 5; -2 -8];
        fn = @(t, y) A * y;
        sol = @(t) [5*exp(2*t) - 3*exp(-7*t); -exp(2*t) + 6*exp(-7*t)];
    case 7
        s = 0;
        e = 10;
        A = [0 -2; 2 0];
        fn = @(t, y) A * y + [3; -2*t];
        C = [1; 1];
        sol = @(t) [C(1)*cos(2*t) + C(2)*sin(2*t) + t; C(1)*sin(2*t) - C(2)*cos(2*t) + 1];
end
h = (e - s) / n;

K = [0 0 0 0; 0.5 0.5 0 0; 1 -1 2 0; 0 1/6 2/3 1/6];
H = [0 0 0 0; 1/3 1/3 0 0; 1 0 2/3 0; 0 1/4 0 3/4];

y_e = euler(s, sol(s), fn, h, n);
y_ee = enhanced_euler(s, sol(s), fn, h, n);
y_k = rk(K, s, sol(s), fn, h, n);
y_h = rk(H, s, sol(s), fn, h, n);
y_t = trapezoid(s, sol(s), A, h, n);
ab4 = 1/24 * [-9; 37; -59; 55];
ab5 = 1/720 * [251; -1274; 2616; -2774; 1901];
y_ab4 = multistep(ab4, s, sol(s), fn, h, n);
y_ab5 = multistep(ab5, s, sol(s), fn, h, n);
y_c = sol(s:h:e);

if size(y_c, 1) == 1
    plot(s:h:e, y_e, 'r');
    hold on;
    plot(s:h:e, y_ee, 'g');
    plot(s:h:e, y_k, 'c');
    %plot(s:h:e, y_h, 'k');
    %plot(s:h:e, y_t, 'm');
    plot(s:h:e, y_ab4, 'r--');
    plot(s:h:e, y_ab5, 'g--');
    hold on;
    plot(s:h:e, y_c);
    %legend('euler', 'enhanced euler', 'kutta', 'heun', 'trapezoid', 'ab4', 'real y');
    legend('euler', 'enhanced euler', 'kutta', 'ab4', 'ab5', 'real y');
else
    subplot(1, 2, 1);
    plot(s:h:e, y_e(1,:), 'r');
    hold on;
    plot(s:h:e, y_ee(1,:), 'g');
    plot(s:h:e, y_k(1,:), 'c');
    %plot(s:h:e, y_h(1,:), 'k');
    %plot(s:h:e, y_t(1,:), 'm');
    plot(s:h:e, y_ab4(1,:), 'r--');
    plot(s:h:e, y_ab5(1,:), 'g--');
    hold on;
    plot(s:h:e, y_c(1,:));
    %legend('euler', 'enhanced euler', 'kutta', 'heun', 'trapezoid', 'ab4', 'real y');
    legend('euler', 'enhanced euler', 'kutta', 'ab4', 'ab5', 'real y');
    subplot(1, 2, 2);
    plot(s:h:e, y_e(2,:), 'r');
    hold on;
    plot(s:h:e, y_ee(2,:), 'g');
    plot(s:h:e, y_k(2,:), 'c');
    %plot(s:h:e, y_h(2,:), 'k');
    %plot(s:h:e, y_t(2,:), 'm');
    plot(s:h:e, y_ab4(2,:), 'r--');
    plot(s:h:e, y_ab5(2,:), 'g--');
    hold on;
    plot(s:h:e, y_c(2,:));
    %legend('euler', 'enhanced euler', 'kutta', 'heun', 'trapezoid', 'ab4', 'real y');
    legend('euler', 'enhanced euler', 'kutta', 'ab4', 'ab5', 'real y');
end

pause
close

end
