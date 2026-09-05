%% Interactive MATLAB Lab 9.6: Frobenius Method
% Regular Frobenius/Bessel solution for integer order nu:
%
% J_nu(x) = sum_{k=0}^\infty
% (-1)^k (x/2)^(2k+nu) / [k! Gamma(k+nu+1)]
%
% In a Live Script, turn orderParameter and seriesOrder
% into drop-down controls.

orderParameter = 1;      % Try 0, 1, 2
seriesOrder = 9;         % Try 5, 7, 9, 11, 13

nu = orderParameter;

% Indicial equation r^2 - nu^2 = 0.
indicialRoots = [-nu; nu];

kMax = floor((seriesOrder-nu)/2);

if kMax < 0
    error("seriesOrder must be at least as large as orderParameter.")
end

kValues = 0:kMax;
powers = 2*kValues + nu;

coefficients = (-1).^kValues ./ ...
    (factorial(kValues).*gamma(kValues+nu+1).*2.^powers);

termTable = table( ...
    kValues.',powers.',coefficients.', ...
    'VariableNames',{'k','powerOfX','coefficient'});

disp("Bessel order nu = " + string(nu))
disp("Indicial roots:")
disp(indicialRoots)
disp("Retained Frobenius terms:")
disp(termTable)

xValues = linspace(0,3,600);

yTruncated = zeros(size(xValues));
yPrime = zeros(size(xValues));
ySecond = zeros(size(xValues));

for j = 1:numel(kValues)
    p = powers(j);
    c = coefficients(j);

    yTruncated = yTruncated + c*xValues.^p;

    if p >= 1
        yPrime = yPrime + c*p*xValues.^(p-1);
    end

    if p >= 2
        ySecond = ySecond + c*p*(p-1)*xValues.^(p-2);
    end
end

% Residual for x^2 y'' + x y' + (x^2-nu^2)y.
residual = xValues.^2.*ySecond + ...
    xValues.*yPrime + ...
    (xValues.^2-nu^2).*yTruncated;

exactBessel = besselj(nu,xValues);

% For this truncation, the first uncancelled residual term is the
% highest retained series coefficient times x^(highestPower+2).
leadingResidualPower = powers(end)+2;
leadingResidualCoefficient = coefficients(end);

localMask = xValues <= 1.5;
maximumLocalResidual = max(abs(residual(localMask)));

disp("Leading residual power = " + string(leadingResidualPower))
disp("Leading residual coefficient = " + ...
    string(leadingResidualCoefficient))
disp("Maximum residual magnitude on 0 <= x <= 1.5 = " + ...
    string(maximumLocalResidual))

figure
plot(xValues,exactBessel,'LineWidth',1.6)
hold on
plot(xValues,yTruncated,'--','LineWidth',1.6)
hold off
grid on
xlabel('x')
ylabel('y')
legend('besselj(\nu,x)','truncated Frobenius series','Location','best')
title("Bessel/Frobenius Approximation, nu = " + string(nu))

figure
semilogy(xValues,max(abs(residual),eps),'LineWidth',1.5)
grid on
xlabel('x')
ylabel('|ODE residual|')
title('Residual of the Truncated Frobenius Series')
