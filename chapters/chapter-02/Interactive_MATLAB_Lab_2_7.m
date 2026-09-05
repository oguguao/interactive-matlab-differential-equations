%% Interactive MATLAB Lab 2.7: Bernoulli Transformation Explorer
% In a Live Script, turn initialValue into a slider or numeric control.

initialValue = 1;

syms x

vSolution = x + 1 + (1/initialValue - 1)*exp(x);
ySolution = simplify(1/vSolution);

equationResidual = simplify( ...
    diff(ySolution,x) + ySolution - x*ySolution^2 );

initialResidual = simplify(subs(ySolution,x,0) - initialValue);

equationCheck = isequal(equationResidual,sym(0));
initialCheck = isequal(initialResidual,sym(0));

disp("Original equation: y' + y = x y^2")
disp("Bernoulli exponent: n = 2")
disp("Substitution: v = y^(-1)")
disp("Transformed linear equation: v' - v = -x")
disp("Initial condition for v: v(0) = 1/y(0)")
disp("v(x) =")
disp(vSolution)
disp("Recovered y(x) =")
disp(ySolution)
disp("Equation verification:")
disp(equationCheck)
disp("Initial-condition verification:")
disp(initialCheck)
disp("The equilibrium solution y = 0 also satisfies the original equation.")

figure
fplot(ySolution,[0 3],'LineWidth',1.6)
ylim([-4 4])
grid on
xlabel('x')
ylabel('y')
title('Bernoulli IVP Solution')
