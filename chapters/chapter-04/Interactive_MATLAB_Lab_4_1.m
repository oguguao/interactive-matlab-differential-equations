%% Interactive MATLAB Lab 4.1: Linearity, Wronskian, and Superposition
% In a Live Script, turn c1 and c2 into sliders or numeric controls.

c1 = 1;
c2 = 1;

syms x

basis1 = exp(x);
basis2 = exp(-x);

wronskianValue = simplify( ...
    basis1*diff(basis2,x) - basis2*diff(basis1,x) );

combination = c1*basis1 + c2*basis2;

check1 = isequal(simplify(diff(basis1,x,2) - basis1),sym(0));
check2 = isequal(simplify(diff(basis2,x,2) - basis2),sym(0));
checkCombination = isequal( ...
    simplify(diff(combination,x,2) - combination),sym(0));

disp("Wronskian:")
disp(wronskianValue)
disp("Basis 1 satisfies y'' - y = 0:")
disp(check1)
disp("Basis 2 satisfies y'' - y = 0:")
disp(check2)
disp("Linear combination satisfies y'' - y = 0:")
disp(checkCombination)
disp("Linear combination:")
disp(combination)

figure
fplot(combination,[-2 2],'LineWidth',1.6)
grid on
xlabel('x')
ylabel('y')
title('Superposition of Two Fundamental Solutions')
