function [y] = run_method(name, test, n)

h = (test.e - test.s) / n;
switch name
case 'euler'
    y = euler(test.s, test.sol(test.s), test.fn, h, n);
case 'meuler'
    y = meuler(test.s, test.sol(test.s), test.fn, h, n);
case 'kutta'
    K = [0 0 0 0; 0.5 0.5 0 0; 1 -1 2 0; 0 1/6 2/3 1/6];
    y = rk(K, test.s, test.sol(test.s), test.fn, h, n);
case 'heun'
    H = [0 0 0 0; 1/3 1/3 0 0; 1 0 2/3 0; 0 1/4 0 3/4];
    y = rk(H, test.s, test.sol(test.s), test.fn, h, n);
case 'trap'
    y = trapezoid(test.s, test.sol(test.s), test.A, h, n);
case 'ab4'
    ab4 = 1/24 * [-9; 37; -59; 55];
    y = multistep(ab4, test.s, test.sol(test.s), test.fn, h, n);
case 'ab5'
    ab5 = 1/720 * [251; -1274; 2616; -2774; 1901];
    y = multistep(ab5, test.s, test.sol(test.s), test.fn, h, n);
case 'solution'
    interval = num2cell(test.s:h:test.e);
    ycell = cellfun(test.sol, interval, 'UniformOutput', false);
    y = cell2mat(ycell);
end

