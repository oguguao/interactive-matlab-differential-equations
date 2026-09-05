%% Interactive MATLAB Lab 6.1: Introduction to Numerical Approximation
% In a Live Script, turn sampleSpacing into a drop-down or numeric control.
% This lab uses ode45 for a high-accuracy numerical reference at selected
% output points, then compares those values with the known exact solution.

sampleSpacing = 0.2;   % Try 0.5, 0.25, 0.2, 0.1

slopeFunction = @(x,y) y - x.^2 + 1;
exactSolution = @(x) (x + 1).^2 - 0.5*exp(x);

samplePoints = 0:sampleSpacing:2;

options = odeset('RelTol',1e-10,'AbsTol',1e-12);
[xNumerical,yNumerical] = ode45( ...
    slopeFunction, samplePoints, 0.5, options);

exactValues = exactSolution(xNumerical);
absoluteError = abs(exactValues - yNumerical);

comparisonTable = table( ...
    xNumerical, yNumerical, exactValues, absoluteError, ...
    'VariableNames', {'x','numerical','exact','absoluteError'});

maximumError = max(absoluteError);

disp("Selected output-point spacing = " + string(sampleSpacing))
disp("Largest displayed absolute error = " + string(maximumError))
disp(comparisonTable)

xPlot = linspace(0,2,500);

figure
plot(xPlot,exactSolution(xPlot),'LineWidth',1.6)
hold on
plot(xNumerical,yNumerical,'o','MarkerSize',6,'LineWidth',1.2)
hold off
grid on
xlabel('x')
ylabel('y')
legend('Exact solution','Numerical values','Location','best')
title('Exact Curve and Selected Numerical Values')
