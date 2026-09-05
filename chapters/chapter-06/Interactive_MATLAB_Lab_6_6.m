%% Interactive MATLAB Lab 6.6: Higher-Order Initial-Value Problems
% Exact nonlinear pendulum:
% theta'' + (g/L) sin(theta) = 0
%
% State variables:
% u1 = theta
% u2 = theta'
%
% In a Live Script, turn initialAngle, initialAngularVelocity,
% pendulumLength, and timeHorizon into sliders/numeric controls.

initialAngle = 0.8;
initialAngularVelocity = 0;
pendulumLength = 1;
gravity = 9.81;
timeHorizon = 15;

pendulumSystem = @(t,u) [
    u(2)
    -(gravity/pendulumLength)*sin(u(1))
];

initialState = [initialAngle;initialAngularVelocity];

[t,u] = ode45( ...
    pendulumSystem,[0 timeHorizon],initialState);

angle = u(:,1);
angularVelocity = u(:,2);

disp("First-order system:")
disp("u1' = u2")
disp("u2' = -(g/L) sin(u1)")
disp("Initial angle = " + string(initialAngle))
disp("Initial angular velocity = " + string(initialAngularVelocity))

figure
plot(t,angle,'LineWidth',1.6)
grid on
xlabel('time')
ylabel('angle (radians)')
title('Nonlinear Pendulum Angle')

figure
plot(angle,angularVelocity,'LineWidth',1.6)
grid on
xlabel('angle')
ylabel('angular velocity')
title('Nonlinear Pendulum Phase Curve')
