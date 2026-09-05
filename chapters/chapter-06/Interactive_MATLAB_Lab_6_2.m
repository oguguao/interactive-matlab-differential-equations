%% Interactive MATLAB Lab 6.2: Euler's Method
% In a Live Script, turn stepSize into a drop-down or numeric control.
% Choose a step size that divides the interval length 2 exactly.

stepSize = 0.2;   % Try 0.5, 0.25, 0.2, 0.1, 0.05

slopeFunction = @(x,y) y - x.^2 + 1;
exactSolution = @(x) (x + 1).^2 - 0.5*exp(x);

x0 = 0;
y0 = 0.5;
xFinal = 2;

numberOfSteps = round((xFinal-x0)/stepSize);

xValues = zeros(numberOfSteps+1,1);
yEuler = zeros(numberOfSteps+1,1);

xValues(1) = x0;
yEuler(1) = y0;

for n = 1:numberOfSteps
    xCurrent = xValues(n);
    yCurrent = yEuler(n);

    yEuler(n+1) = yCurrent + ...
        stepSize*slopeFunction(xCurrent,yCurrent);

    xValues(n+1) = xCurrent + stepSize;
end

exactValues = exactSolution(xValues);
absoluteError = abs(exactValues-yEuler);

errorTable = table( ...
    xValues,yEuler,exactValues,absoluteError, ...
    'VariableNames',{'x','Euler','exact','absoluteError'});

finalError = absoluteError(end);

disp("Step size h = " + string(stepSize))
disp("Number of steps = " + string(numberOfSteps))
disp("Final approximation = " + string(yEuler(end)))
disp("Final absolute error = " + string(finalError))
disp(errorTable)

xPlot = linspace(0,2,500);

figure
plot(xValues,yEuler,'o-','LineWidth',1.4)
hold on
plot(xPlot,exactSolution(xPlot),'LineWidth',1.6)
hold off
grid on
xlabel('x')
ylabel('y')
legend('Euler','Exact','Location','best')
title('Euler Approximation and Exact Solution')
