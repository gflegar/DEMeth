function [t] = get_test(n)

tests = {
    struct(
        's', 1,    
        'e', 10,
        'A', [],
        'fn', @(t, y) -y/(t^2),
        'sol', @(t) exp(1./t));
    struct(
        's', 1,
        'e', 5,
        'fn', @(t, y) 2*t*y,
        'sol', @(t) exp(t.^2),
        'A', []);
    struct(
        's', 0.1,
        'e', 1,
        'fn', @(t, y) -y ./ (t^2 * tan(1./t)),
        'sol', @(t) sin(1./t),
        'A', []);
    struct(
        's', 1,
        'e', 10,
        'fn', @(t, y) y,
        'sol', @(t) exp(t),
        'A', 1);
    struct(
        's', 0,
        'e', 1,
        'fn', @(t, y) y*tan(t) + 1/cos(t),
        'sol', @(t) t ./ cos(t),
        'A', []);
    struct(
        's', 0,
        'e', 5,
        'fn', @(t, y) [3 5; -2 -8]*y,
        'sol', @(t) [5*exp(2*t) - 3*exp(-7*t); -exp(2*t) + 6*exp(-7*t)],
        'A', [3, 5; -2 -8]);
    struct(
        's', 0,
        'e', 10,
        'fn', @(t, y) [0 -2; 2 0]*y + [3; -2*t],
        'sol', @(t) [1*cos(2*t) + 1*sin(2*t); 1*sin(2*t) - 1*cos(2*t) + 1]);
};

t = tests{n};

end
