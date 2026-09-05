%% Interactive MATLAB Lab 7.6: Dirac Delta and Impulse Inputs
% In a Live Script, turn impulseTime and impulseStrength into controls.
% The impulse is represented through its exact delayed response rather
% than approximated by a very tall finite pulse.

impulseTime = pi;
impulseStrength = 1;

syms s

transformSolution = ...
    impulseStrength*exp(-impulseTime*s)/(s^2+1);

timeValues = linspace(0,12,1200);
response = zeros(size(timeValues));

active = timeValues >= impulseTime;
tau = timeValues(active)-impulseTime;
response(active) = impulseStrength*sin(tau);

disp("Impulse time = " + string(impulseTime))
disp("Impulse strength = " + string(impulseStrength))
disp("Transform-domain response:")
disp(transformSolution)
disp("Time response: J u(t-a) sin(t-a)")

figure
plot(timeValues,response,'LineWidth',1.6)
hold on
xline(impulseTime,'--')
hold off
grid on
xlabel('t')
ylabel('y(t)')
title('Oscillator Response to a Delayed Impulse')
