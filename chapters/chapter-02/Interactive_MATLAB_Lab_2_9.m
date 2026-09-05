%% Interactive MATLAB Lab 2.9: Substitution and Transformation Explorer
% In a Live Script, turn initialValue into a slider or numeric control.

initialValue = 0;

syms x

uSolution = tan(x + atan(initialValue));
ySolution = simplify(uSolution - x);

equationResidual = simplify(diff(ySolution,x) - (x + ySolution)^2);
initialResidual = simplify(subs(ySolution,x,0) - initialValue);

equationCheck = isequal(equationResidual,sym(0));
initialCheck = isequal(initialResidual,sym(0));

leftEndpoint = -pi/2 - atan(initialValue);
rightEndpoint = pi/2 - atan(initialValue);

disp("Original equation: y' = (x+y)^2")
disp("Substitution: u = x + y")
disp("Since u' = 1 + y', the transformed equation is u' = 1 + u^2")
disp("u(x) =")
disp(uSolution)
disp("y(x) =")
disp(ySolution)
disp("Equation verification:")
disp(equationCheck)
disp("Initial-condition verification:")
disp(initialCheck)
disp("Largest interval containing x=0:")
disp("(" + string(leftEndpoint) + ", " + string(rightEndpoint) + ")")

figure
fplot(ySolution,[leftEndpoint+0.05 rightEndpoint-0.05],'LineWidth',1.6)
ylim([-10 10])
grid on
xlabel('x')
ylabel('y')
title('Transformed IVP Solution')
