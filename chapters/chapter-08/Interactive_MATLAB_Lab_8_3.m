%% Interactive MATLAB Lab 8.3: Nonhomogeneous Linear Systems
% System:
% x' = A x + g(t),  x(0) = 0
%
% A = [0 1; -2 -3]
% g(t) = [0; F exp(r t)]
%
% In a Live Script, turn forcingAmplitude and forcingRate into controls.

forcingAmplitude = 1;
forcingRate = 1;

A = [0 1; -2 -3];
initialVector = [0;0];

forcingFunction = @(t) [
    0
    forcingAmplitude*exp(forcingRate*t)
];

systemODE = @(t,x) A*x + forcingFunction(t);

timeValues = linspace(0,5,121);

% Direct numerical solution.
[tDirect,xDirect] = ode45(systemODE,timeValues,initialVector);

% Variation-of-constants representation:
% x(t) = expm(A t)x0 + integral_0^t expm(A(t-tau))g(tau) dtau
%
% Here the integral is evaluated transparently with a trapezoidal rule
% so students can see the accumulated effect of past forcing.
xVariation = zeros(numel(timeValues),2);

for k = 1:numel(timeValues)
    currentTime = timeValues(k);

    if currentTime == 0
        xVariation(k,:) = initialVector.';
        continue
    end

    tauValues = linspace(0,currentTime,301);
    integrandValues = zeros(2,numel(tauValues));

    for j = 1:numel(tauValues)
        tau = tauValues(j);

        integrandValues(:,j) = ...
            expm(A*(currentTime-tau))*forcingFunction(tau);
    end

    forcingContribution = trapz( ...
        tauValues,integrandValues,2);

    naturalContribution = expm(A*currentTime)*initialVector;

    xVariation(k,:) = ...
        (naturalContribution + forcingContribution).';
end

difference = xVariation - xDirect;
maximumDifference = max(vecnorm(difference,2,2));

disp("Coefficient matrix A:")
disp(A)
disp("Forcing amplitude = " + string(forcingAmplitude))
disp("Forcing rate = " + string(forcingRate))
disp("Maximum difference between ode45 and variation-of-constants calculation:")
disp(maximumDifference)
disp("With zero initial conditions, the response is entirely forcing-driven.")

figure
plot(tDirect,xDirect(:,1),'LineWidth',1.6)
hold on
plot(tDirect,xDirect(:,2),'LineWidth',1.6)
plot(timeValues,xVariation(:,1),'--','LineWidth',1.2)
plot(timeValues,xVariation(:,2),'--','LineWidth',1.2)
hold off
grid on
xlabel('t')
ylabel('value')
legend( ...
    'x_1: ode45','x_2: ode45', ...
    'x_1: variation of constants','x_2: variation of constants', ...
    'Location','best')
title('Forced Linear System')

figure
plot(xDirect(:,1),xDirect(:,2),'LineWidth',1.6)
grid on
xlabel('x_1')
ylabel('x_2')
title('Forced-System Trajectory')
