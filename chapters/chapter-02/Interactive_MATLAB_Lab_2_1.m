%% Interactive MATLAB Lab 2.1: Separable Differential Equations
% In a Live Script, turn y0 into a slider or numeric control.

y0 = 0;

syms x

solution = tan(x^2/2 + atan(y0));
residual = simplify(diff(solution,x) - x*(1 + solution^2));
check = isequal(residual,sym(0));

disp("Initial condition: y(0) = " + string(y0))
disp("Solution:")
disp(solution)
disp("Differential-equation verification:")
disp(check)

figure
fplot(solution,[-1.7 1.7],'LineWidth',1.5)
ylim([-10 10])
grid on
xlabel('x')
ylabel('y')
title('Separable IVP Solution')
