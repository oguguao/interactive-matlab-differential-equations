%% Interactive MATLAB Lab 6.3: Modified Euler's Method
% This chapter uses the predictor-corrector form (Heun's method).
% In a Live Script, turn stepSize into a drop-down or numeric control.

stepSize = 0.2;   % Try 0.5, 0.25, 0.2, 0.1, 0.05

slopeFunction = @(x,y) y - x.^2 + 1;
exactSolution = @(x) (x + 1).^2 - 0.5*exp(x);

x0 = 0;
y0 = 0.5;
xFinal = 2;

numberOfSteps = round((xFinal-x0)/stepSize);

xValues = zeros(numberOfSteps+1,1);
yModified = zeros(numberOfSteps+1,1);

xValues(1) = x0;
yModified(1) = y0;

for n = 1:numberOfSteps
    xCurrent = xValues(n);
    yCurrent = yModified(n);

    beginningSlope = slopeFunction(xCurrent,yCurrent);

    predictor = yCurrent + stepSize*beginningSlope;

    endpointSlope = slopeFunction( ...
        xCurrent+stepSize, predictor);

    yModified(n+1) = yCurrent + ...
        stepSize/2*(beginningSlope+endpointSlope);

    xValues(n+1) = xCurrent + stepSize;
end

exactValues = exactSolution(xValues);
absoluteError = abs(exactValues-yModified);

errorTable = table( ...
    xValues,yModified,exactValues,absoluteError, ...
    'VariableNames',{'x','ModifiedEuler','exact','absoluteError'});

finalError = absoluteError(end);

disp("Step size h = " + string(stepSize))
disp("Final approximation = " + string(yModified(end)))
disp("Final absolute error = " + string(finalError))
disp(errorTable)

xPlot = linspace(0,2,500);

figure
plot(xValues,yModified,'o-','LineWidth',1.4)
hold on
plot(xPlot,exactSolution(xPlot),'LineWidth',1.6)
hold off
grid on
xlabel('x')
ylabel('y')
legend('Modified Euler','Exact','Location','best')
title('Modified Euler and Exact Solution')
