%% Interactive MATLAB Lab 7.2: Inverse Transforms and Derivative Formulas
% In a Live Script, turn initialValue and initialSlope into numeric controls.
% Symbolic Math Toolbox is used for the transform-domain verification.

initialValue = 1;
initialSlope = 0;

syms s t y0 v0

transformSolutionGeneral = simplify( ...
    (s*y0 + v0 + 3*y0)/(s^2 + 3*s + 2));

timeSolutionGeneral = simplify( ...
    ilaplace(transformSolutionGeneral,s,t));

transformSolution = simplify(subs( ...
    transformSolutionGeneral,[y0 v0],[initialValue initialSlope]));

timeSolution = simplify(subs( ...
    timeSolutionGeneral,[y0 v0],[initialValue initialSlope]));

odeResidual = simplify(diff(timeSolution,t,2) + ...
    3*diff(timeSolution,t) + 2*timeSolution);

initialValueResidual = simplify(subs(timeSolution,t,0)-initialValue);
initialSlopeResidual = simplify(subs(diff(timeSolution,t),t,0)-initialSlope);

verification = isAlways(odeResidual == 0) && ...
    isAlways(initialValueResidual == 0) && ...
    isAlways(initialSlopeResidual == 0);

disp("Transform-domain solution Y(s):")
disp(transformSolution)
disp("Recovered time-domain solution:")
disp(timeSolution)
disp("Verification:")
disp(verification)

figure
fplot(timeSolution,[0 8],'LineWidth',1.6)
grid on
xlabel('t')
ylabel('y(t)')
title('Inverse-Laplace IVP Solution')
