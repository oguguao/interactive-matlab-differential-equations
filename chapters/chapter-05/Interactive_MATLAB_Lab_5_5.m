%% Interactive MATLAB Lab 5.5: Series RLC Circuits
% Convert the electrical parameters into Live Editor controls.

inductance = 1;
resistance = 2;
capacitance = 0.25;
voltageAmplitude = 10;
forcingFrequency = 3;
initialCharge = 0;
initialCurrent = 0;

voltage = @(t) voltageAmplitude*sin(forcingFrequency*t);

criticalResistance = 2*sqrt(inductance/capacitance);
discriminant = resistance^2 - 4*inductance/capacitance;
tolerance = 1e-10;

if discriminant < -tolerance
    classification = "Underdamped";
elseif abs(discriminant) <= tolerance
    classification = "Critically damped";
else
    classification = "Overdamped";
end

circuitODE = @(t,z) [
    z(2)
    (voltage(t)-resistance*z(2)-z(1)/capacitance)/inductance
];

[t,z] = ode45(circuitODE,[0 20],[initialCharge; initialCurrent]);

charge = z(:,1);
current = z(:,2);

disp("Source-free classification: " + classification)
disp("Critical resistance = " + string(criticalResistance))
disp("Mechanical analogy:")
disp("mass m <-> inductance L")
disp("damping c <-> resistance R")
disp("spring constant k <-> 1/C")

figure
plot(t,charge,'LineWidth',1.6)
grid on
xlabel('time')
ylabel('charge')
title('Charge q(t)')

figure
plot(t,current,'LineWidth',1.6)
grid on
xlabel('time')
ylabel('current')
title('Current i(t)')
