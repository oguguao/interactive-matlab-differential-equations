%% Interactive MATLAB Lab 6.4: Fourth-Order Runge-Kutta Method
% In a Live Script, turn stepSize into a drop-down or numeric control.

stepSize = 0.2;   % Try 0.5, 0.25, 0.2, 0.1, 0.05

slopeFunction = @(x,y) y - x.^2 + 1;
exactSolution = @(x) (x + 1).^2 - 0.5*exp(x);

x0 = 0;
y0 = 0.5;
xFinal = 2;

numberOfSteps = round((xFinal-x0)/stepSize);

xValues = zeros(numberOfSteps+1,1);
yRK4 = zeros(numberOfSteps+1,1);

xValues(1) = x0;
yRK4(1) = y0;

for n = 1:numberOfSteps
    xCurrent = xValues(n);
    yCurrent = yRK4(n);

    k1 = slopeFunction(xCurrent,yCurrent);

    k2 = slopeFunction( ...
        xCurrent+stepSize/2, ...
        yCurrent+stepSize*k1/2);

    k3 = slopeFunction( ...
        xCurrent+stepSize/2, ...
        yCurrent+stepSize*k2/2);

    k4 = slopeFunction( ...
        xCurrent+stepSize, ...
        yCurrent+stepSize*k3);

    yRK4(n+1) = yCurrent + ...
        stepSize/6*(k1+2*k2+2*k3+k4);

    xValues(n+1) = xCurrent + stepSize;
end

exactValues = exactSolution(xValues);
absoluteError = abs(exactValues-yRK4);
finalError = absoluteError(end);

disp("Step size h = " + string(stepSize))
disp("Final approximation = " + string(yRK4(end)))
disp("Final absolute error = " + string(finalError))

comparisonTable = table( ...
    xValues,yRK4,exactValues,absoluteError, ...
    'VariableNames',{'x','RK4','exact','absoluteError'});

disp(comparisonTable)

xPlot = linspace(0,2,500);

figure
plot(xValues,yRK4,'o-','LineWidth',1.4)
hold on
plot(xPlot,exactSolution(xPlot),'LineWidth',1.6)
hold off
grid on
xlabel('x')
ylabel('y')
legend('RK4','Exact','Location','best')
title('RK4 Approximation and Exact Solution')
