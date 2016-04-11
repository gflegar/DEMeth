function [y] = run_method(name, test, n)

h = (test.e - test.s) / n;
switch name
case 'euler'
    y = euler(test.s, test.sol(test.s), test.fn, h, n);
case 'meuler'
    y = meuler(test.s, test.sol(test.s), test.fn, h, n);
case 'kutta'
    y = kutta(test.s, test.sol(test.s), test.fn, h, n);
case 'heun'
    y = heun(test.s, test.sol(test.s), test.fn, h, n);
case 'rk'
    y = runge_kutta(test.s, test.sol(test.s), test.fn, h, n);
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

