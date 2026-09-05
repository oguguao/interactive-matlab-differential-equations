%% Interactive MATLAB Lab 9.3: Power-Series Solutions at Ordinary Points
% IVP:
% y'' + x y = 0,  y(0)=y0,  y'(0)=v0
%
% Recurrence:
% a2 = 0,
% a_(n+2) = -a_(n-1)/[(n+2)(n+1)],  n >= 1.
%
% In a Live Script, turn seriesOrder into a drop-down control and
% initialValue / initialSlope into sliders or numeric controls.

seriesOrder = 10;        % Try 4, 6, 8, 10, 12, 14
initialValue = 1;
initialSlope = 0;

coefficients = zeros(1,seriesOrder+1);

% a0 = y(0), a1 = y'(0)
coefficients(1) = initialValue;

if seriesOrder >= 1
    coefficients(2) = initialSlope;
end

% The x^0 coefficient gives a2 = 0.
if seriesOrder >= 2
    coefficients(3) = 0;
end

% Mathematical index n runs from 1 to seriesOrder-2.
for n = 1:(seriesOrder-2)
    % a_(n+2) is stored at index n+3.
    % a_(n-1) is stored at index n.
    coefficients(n+3) = ...
        -coefficients(n)/((n+2)*(n+1));
end

seriesPolynomial = @(x) polyval(fliplr(coefficients),x);

coefficientTable = table( ...
    (0:seriesOrder).',coefficients.', ...
    'VariableNames',{'power','coefficient'});

disp("Series coefficients a_n:")
disp(coefficientTable)

% Numerical reference solution using ode45.
systemODE = @(x,z) [
    z(2)
    -x*z(1)
];

initialState = [initialValue;initialSlope];

[xPositive,zPositive] = ode45( ...
    systemODE,linspace(0,3,301),initialState);

[xNegative,zNegative] = ode45( ...
    systemODE,linspace(0,-3,301),initialState);

xNumerical = [
    flipud(xNegative(2:end))
    xPositive
];

yNumerical = [
    flipud(zNegative(2:end,1))
    zPositive(:,1)
];

ySeries = seriesPolynomial(xNumerical);
absoluteError = abs(ySeries-yNumerical);

disp("Maximum absolute error on [-3,3] = " + ...
    string(max(absoluteError)))

figure
plot(xNumerical,yNumerical,'LineWidth',1.6)
hold on
plot(xNumerical,ySeries,'--','LineWidth',1.6)
hold off
grid on
xlabel('x')
ylabel('y')
legend('ode45 reference','truncated series','Location','best')
title("Power-Series Approximation Through Degree " + string(seriesOrder))

figure
semilogy(xNumerical,max(absoluteError,eps),'LineWidth',1.5)
grid on
xlabel('x')
ylabel('absolute error')
title('Local Error of the Truncated Series')
