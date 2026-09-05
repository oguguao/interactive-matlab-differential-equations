%% Interactive MATLAB Lab 7.7: Applications of Laplace Transforms
% Damped second-order system:
% y'' + 2y' + 5y = g(t), with zero initial conditions.
% In a Live Script, turn delayTime and forcingMagnitude into controls.

delayTime = 1;
forcingMagnitude = 10;

syms s

transferFunction = 1/(s^2 + 2*s + 5);
inputTransform = forcingMagnitude*exp(-delayTime*s)/s;
responseTransform = simplify(transferFunction*inputTransform);

timeValues = linspace(0,12,1200);
response = zeros(size(timeValues));

active = timeValues >= delayTime;
tau = timeValues(active)-delayTime;

% Unit-step response of 1/(s^2+2s+5):
baseStepResponse = @(u) ...
    1/5 - exp(-u).*(cos(2*u)/5 + sin(2*u)/10);

response(active) = forcingMagnitude*baseStepResponse(tau);

disp("Transfer function H(s):")
disp(transferFunction)
disp("Input transform G(s):")
disp(inputTransform)
disp("Response transform Y(s):")
disp(responseTransform)
disp("Delay factor: exp(-a s)")

figure
plot(timeValues,response,'LineWidth',1.6)
hold on
xline(delayTime,'--')
hold off
grid on
xlabel('t')
ylabel('response')
title('Delayed Damped Step Response')
