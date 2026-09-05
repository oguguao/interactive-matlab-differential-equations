%% Interactive MATLAB Lab 3.9: Selecting and Evaluating a Mathematical Model
% This version uses only base MATLAB optimization tools.
% In a Live Script, turn displayHorizon into a slider or numeric control.

displayHorizon = 10;

data = [
    0  50
    1  72
    2 104
    3 145
    4 190
    5 235
    6 270
];

tData = data(:,1);
pData = data(:,2);

% Exponential model P(t) = P0 exp(k t).
expFit = polyfit(tData,log(pData),1);
kExp = expFit(1);
p0Exp = exp(expFit(2));
exponentialModel = @(t) p0Exp.*exp(kExp.*t);

% Logistic model P(t) = K/(1 + a exp(-r t)).
% Optimize log-parameters so K, a, and r remain positive.
objective = @(theta) sum( ...
    (pData - ...
    exp(theta(1))./(1 + exp(theta(2)).* ...
    exp(-exp(theta(3)).*tData))).^2 );

theta0 = log([350 6 0.5]);
thetaFit = fminsearch(objective,theta0);

carryingCapacity = exp(thetaFit(1));
aValue = exp(thetaFit(2));
growthRate = exp(thetaFit(3));

logisticModel = @(t) carryingCapacity ./ ...
    (1 + aValue.*exp(-growthRate.*t));

exponentialResiduals = pData - exponentialModel(tData);
logisticResiduals = pData - logisticModel(tData);

exponentialSSE = sum(exponentialResiduals.^2);
logisticSSE = sum(logisticResiduals.^2);

disp("Exponential SSE = " + string(exponentialSSE))
disp("Logistic SSE = " + string(logisticSSE))
disp("Exponential parameters: P0 = " + string(p0Exp) + ...
    ", k = " + string(kExp))
disp("Logistic parameters: K = " + string(carryingCapacity) + ...
    ", a = " + string(aValue) + ...
    ", r = " + string(growthRate))

tPlot = linspace(0,displayHorizon,400);

figure
plot(tData,pData,'o','MarkerSize',7,'LineWidth',1.2)
hold on
plot(tPlot,exponentialModel(tPlot),'LineWidth',1.6)
plot(tPlot,logisticModel(tPlot),'LineWidth',1.6)
hold off
grid on
xlabel('t')
ylabel('population')
legend('observed data','exponential','logistic','Location','best')
title('Observed Data and Competing Models')
