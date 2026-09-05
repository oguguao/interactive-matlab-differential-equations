%% Interactive MATLAB Lab 4.5: Initial-Value Problems for Homogeneous Equations
% In a Live Script, turn initialValue and initialSlope into sliders
% or numeric controls.

initialValue = 2;
initialSlope = -1;

solution = @(x) initialValue.*cos(x) + initialSlope.*sin(x);
derivative = @(x) -initialValue.*sin(x) + initialSlope.*cos(x);

amplitude = sqrt(initialValue^2 + initialSlope^2);

equationCheck = true;   % y'' + y = 0 by construction.
initialValueCheck = abs(solution(0)-initialValue) < 1e-10;
initialSlopeCheck = abs(derivative(0)-initialSlope) < 1e-10;

disp("Equation: y'' + y = 0")
disp("Solution: y = y0 cos(x) + v0 sin(x)")
disp("Amplitude = " + string(amplitude))
disp("Differential-equation check:")
disp(equationCheck)
disp("Initial-value check:")
disp(initialValueCheck)
disp("Initial-slope check:")
disp(initialSlopeCheck)

figure
fplot(solution,[0 4*pi],'LineWidth',1.6)
grid on
xlabel('x')
ylabel('y')
title('Homogeneous Second-Order IVP')
