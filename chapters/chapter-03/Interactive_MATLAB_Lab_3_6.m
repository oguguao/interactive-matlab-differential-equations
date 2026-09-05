%% Interactive MATLAB Lab 3.6: Motion and Linear Air Resistance
% Positive velocity is taken downward.
% In a Live Script, turn mass, dragCoefficient, and initialVelocity
% into sliders or numeric controls.

mass = 80;
dragCoefficient = 12;
gravity = 9.81;
initialVelocity = 0;

terminalVelocity = mass*gravity/dragCoefficient;

velocityModel = @(t) terminalVelocity + ...
    (initialVelocity - terminalVelocity).* ...
    exp(-(dragCoefficient/mass).*t);

timeToFivePercentGap = -(mass/dragCoefficient)*log(0.05);

disp("Terminal velocity = " + string(terminalVelocity) + " m/s")
disp("Time for the velocity gap to shrink to 5% = " + ...
    string(timeToFivePercentGap) + " s")

figure
fplot(velocityModel,[0 30],'LineWidth',1.6)
hold on
yline(terminalVelocity,'--','LineWidth',1.4)
hold off
grid on
xlabel('seconds')
ylabel('velocity (m/s)')
legend('v(t)','terminal velocity','Location','best')
title('Velocity with Linear Air Resistance')
