%% Interactive MATLAB Lab 2.2: First-Order Linear Differential Equations
% In a Live Script, turn p and y0 into sliders or numeric controls.

p = 2;
y0 = 1;

syms x

solution = x/p - 1/p^2 + (y0 + 1/p^2)*exp(-p*x);
longTerm = x/p - 1/p^2;
transient = (y0 + 1/p^2)*exp(-p*x);

residual = simplify(diff(solution,x) + p*solution - x);
check = isequal(residual,sym(0));

disp("Equation: y' + p y = x")
disp("p = " + string(p))
disp("Initial condition: y(0) = " + string(y0))
disp("Solution:")
disp(solution)
disp("Transient term:")
disp(transient)
disp("Long-term term:")
disp(longTerm)
disp("Verification:")
disp(check)

figure
fplot(solution,[0 6],'LineWidth',1.6)
hold on
fplot(longTerm,[0 6],'--','LineWidth',1.6)
hold off
grid on
xlabel('x')
ylabel('y')
legend('Full solution','Long-term part','Location','best')
title('First-Order Linear IVP')
