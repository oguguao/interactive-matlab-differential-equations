%% Interactive MATLAB Lab 5.4: Forced Motion and Resonance
% Convert mass, springConstant, dampingCoefficient,
% forcingAmplitude, and forcingFrequency into Live Editor controls.

mass = 1;
springConstant = 4;
dampingCoefficient = 0;
forcingAmplitude = 1;
forcingFrequency = 2;

naturalFrequency = sqrt(springConstant/mass);
forcingFunction = @(t) forcingAmplitude*cos(forcingFrequency*t);

systemODE = @(t,z) [
    z(2)
    (forcingFunction(t)-dampingCoefficient*z(2)-springConstant*z(1))/mass
];

[t,z] = ode45(systemODE,[0 40],[0;0]);

frequencyDifference = forcingFrequency-naturalFrequency;
resonanceTolerance = 1e-8;

if dampingCoefficient == 0 && abs(frequencyDifference) < resonanceTolerance
    responseType = "Ideal Resonance";
elseif dampingCoefficient == 0 && abs(frequencyDifference) < 0.25
    responseType = "Near Resonance / Beats";
elseif dampingCoefficient > 0
    responseType = "Damped Forced Response";
else
    responseType = "Forced Response";
end

disp("Natural frequency = " + string(naturalFrequency))
disp("Forcing frequency = " + string(forcingFrequency))
disp("Frequency difference = " + string(frequencyDifference))
disp("Response type: " + responseType)

figure
plot(t,z(:,1),'LineWidth',1.6)
grid on
xlabel('time')
ylabel('displacement')
title(responseType)
