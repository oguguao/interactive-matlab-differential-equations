%% Interactive MATLAB Lab 5.1: Modeling Spring-Mass Systems
% Convert the main parameters into Live Editor sliders/numeric controls.

mass = 2;
dampingCoefficient = 3;
springConstant = 8;
forcingAmplitude = 4;
forcingFrequency = 2;
initialDisplacement = 0.5;
initialVelocity = 0;

forcingFunction = @(t) forcingAmplitude*cos(forcingFrequency*t);

if dampingCoefficient == 0 && forcingAmplitude == 0
    modelType = "Free undamped";
elseif dampingCoefficient > 0 && forcingAmplitude == 0
    modelType = "Free damped";
elseif dampingCoefficient == 0 && forcingAmplitude ~= 0
    modelType = "Forced undamped";
else
    modelType = "Forced damped";
end

systemODE = @(t,z) [
    z(2)
    (forcingFunction(t) - dampingCoefficient*z(2) ...
        - springConstant*z(1))/mass
];

timeSpan = [0 20];
initialState = [initialDisplacement; initialVelocity];

[t,z] = ode45(systemODE,timeSpan,initialState);

disp("Classification: " + modelType)
disp("Model: m x'' + c x' + k x = F0 cos(omega t)")
disp("m = " + string(mass))
disp("c = " + string(dampingCoefficient))
disp("k = " + string(springConstant))
disp("F0 = " + string(forcingAmplitude))
disp("omega = " + string(forcingFrequency))

figure
plot(t,z(:,1),'LineWidth',1.6)
grid on
xlabel('time')
ylabel('displacement')
title(modelType)
