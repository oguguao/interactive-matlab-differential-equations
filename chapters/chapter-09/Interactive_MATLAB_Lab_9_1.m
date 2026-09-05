%% Interactive MATLAB Lab 9.1: Power-Series Review
% Taylor polynomials for f(x) = exp(x) cos(x).
% In a Live Script, turn degree into a drop-down control and
% evaluationPoint into a slider or numeric control.

degree = 4;              % Try 2, 4, 6, 8, 10
evaluationPoint = 1;

timeFunction = @(x) exp(x).*cos(x);

% Since exp(x)cos(x) = Re(exp((1+i)x)),
% the Maclaurin coefficient of x^n is Re((1+i)^n)/n!.
powers = 0:degree;
coefficients = real((1+1i).^powers)./factorial(powers);

% Remove tiny roundoff values that should be exactly zero.
coefficients(abs(coefficients) < 1e-12) = 0;

taylorPolynomial = @(x) polyval(fliplr(coefficients),x);

pointError = abs( ...
    timeFunction(evaluationPoint) - ...
    taylorPolynomial(evaluationPoint));

coefficientTable = table( ...
    powers.',coefficients.', ...
    'VariableNames',{'power','coefficient'});

disp("Taylor polynomial degree = " + string(degree))
disp("Maclaurin coefficients:")
disp(coefficientTable)
disp("Absolute error at x = " + string(evaluationPoint) + ...
    " is " + string(pointError))

xPlot = linspace(-2,2,600);

figure
plot(xPlot,timeFunction(xPlot),'LineWidth',1.6)
hold on
plot(xPlot,taylorPolynomial(xPlot),'--','LineWidth',1.6)
plot(evaluationPoint,timeFunction(evaluationPoint),'o','MarkerSize',7)
hold off
grid on
xlabel('x')
ylabel('value')
legend('exp(x)cos(x)','Taylor polynomial','evaluation point', ...
    'Location','best')
title('Taylor Approximation Centered at x = 0')
