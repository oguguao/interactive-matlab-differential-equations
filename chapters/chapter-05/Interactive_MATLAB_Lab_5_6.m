%% Interactive MATLAB Lab 5.6: Pendulum Motion and Linearization
% Convert initialAngle and length into Live Editor controls.

initialAngle = 0.2;   % radians
length = 1;
gravity = 9.81;

nonlinearODE = @(t,z) [
    z(2)
    -(gravity/length)*sin(z(1))
];

linearODE = @(t,z) [
    z(2)
    -(gravity/length)*z(1)
];

timeSpan = linspace(0,15,1000);
initialState = [initialAngle;0];

[tNonlinear,zNonlinear] = ode45(nonlinearODE,timeSpan,initialState);
[tLinear,zLinear] = ode45(linearODE,timeSpan,initialState);

nonlinearAngle = zNonlinear(:,1);
linearAngle = zLinear(:,1);

approximatePeriod = 2*pi*sqrt(length/gravity);
maximumDifference = max(abs(nonlinearAngle-linearAngle));

disp("Initial angle = " + string(initialAngle) + " radians")
disp("Small-angle period = " + string(approximatePeriod))
disp("Maximum model difference on 0 <= t <= 15 = " + ...
    string(maximumDifference))

figure
plot(tNonlinear,nonlinearAngle,'LineWidth',1.6)
hold on
plot(tLinear,linearAngle,'--','LineWidth',1.6)
hold off
grid on
xlabel('time')
ylabel('angle (radians)')
legend('Nonlinear','Linearized','Location','best')
title('Exact Pendulum vs Small-Angle Approximation')
