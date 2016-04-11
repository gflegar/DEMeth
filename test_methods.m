function [] = test_methods(n, t, meths, styles)
if ~exist('meths')
    meths = {'euler', 'meuler', 'kutta', 'heun', 'ab4'};
end

if ~exist('styles')
    styles = {'r', 'r--', 'g', 'g--', 'c'};
end

styles = styles(1:length(meths));

meths{length(meths)+1} = 'solution';
styles{length(styles)+1} = 'k';

test = get_test(t);

s = test.s;
e = test.e;
h = (e - s) / n;
int = s:h:e;

close;
figure;
for i = 1:length(meths)
    y = run_method(meths{i}, test, n);
    sz = size(y, 1);
    for j = 1:sz
        subplot(sz, 1, j);
        hold on;
        plot(int, y(j,:), styles{i});
    end
end

for j = 1:sz
    subplot(sz, 1, j);
    legend(meths);
end

end
