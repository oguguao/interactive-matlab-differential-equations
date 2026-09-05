%% Interactive MATLAB Lab 5.3: Free Damped Motion
% Convert mass, springConstant, dampingCoefficient,
% initialDisplacement, and initialVelocity into Live Editor controls.

mass = 1;
springConstant = 5;
dampingCoefficient = 4;
initialDisplacement = 1;
initialVelocity = 0;

criticalDamping = 2*sqrt(mass*springConstant);
dampingRatio = dampingCoefficient/criticalDamping;
discriminant = dampingCoefficient^2 - 4*mass*springConstant;

tolerance = 1e-10;

if discriminant < -tolerance
    classification = "Underdamped";
elseif abs(discriminant) <= tolerance
    classification = "Critically damped";
else
    classification = "Overdamped";
end

systemODE = @(t,z) [
    z(2)
    (-dampingCoefficient*z(2)-springConstant*z(1))/mass
];

[t,z] = ode45(systemODE,[0 15],[initialDisplacement; initialVelocity]);

displacement = z(:,1);
velocity = z(:,2);
energy = 0.5*mass*velocity.^2 + 0.5*springConstant*displacement.^2;

disp("Classification: " + classification)
disp("Critical damping = " + string(criticalDamping))
disp("Damping ratio = " + string(dampingRatio))
disp("Discriminant = " + string(discriminant))
disp("Initial energy = " + string(energy(1)))
disp("Final computed energy = " + string(energy(end)))

figure
plot(t,displacement,'LineWidth',1.6)
grid on
xlabel('time')
ylabel('displacement')
title(classification)

figure
plot(t,energy,'LineWidth',1.6)
grid on
xlabel('time')
ylabel('mechanical energy')
title('Mechanical Energy Loss')
