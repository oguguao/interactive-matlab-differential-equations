%% Interactive MATLAB Lab 5.2: Free Undamped Motion
% Convert mass, springConstant, initialDisplacement, and initialVelocity
% into Live Editor sliders/numeric controls.

mass = 1;
springConstant = 9;
initialDisplacement = 2;
initialVelocity = 0;

naturalFrequency = sqrt(springConstant/mass);
coefficient1 = initialDisplacement;
coefficient2 = initialVelocity/naturalFrequency;

amplitude = sqrt(coefficient1^2 + coefficient2^2);
period = 2*pi/naturalFrequency;

displacement = @(t) coefficient1*cos(naturalFrequency*t) + ...
    coefficient2*sin(naturalFrequency*t);

velocity = @(t) -coefficient1*naturalFrequency*sin(naturalFrequency*t) + ...
    coefficient2*naturalFrequency*cos(naturalFrequency*t);

energy = @(t) 0.5*mass*velocity(t).^2 + ...
    0.5*springConstant*displacement(t).^2;

sampleTimes = linspace(0,4*period,500);

disp("Natural angular frequency = " + string(naturalFrequency))
disp("Amplitude = " + string(amplitude))
disp("Period = " + string(period))
disp("Energy variation over four periods = " + ...
    string(max(energy(sampleTimes))-min(energy(sampleTimes))))

figure
plot(sampleTimes,displacement(sampleTimes),'LineWidth',1.6)
grid on
xlabel('time')
ylabel('displacement')
title('Free Undamped Motion')

figure
plot(displacement(sampleTimes),velocity(sampleTimes),'LineWidth',1.6)
grid on
xlabel('displacement')
ylabel('velocity')
title('Closed Phase Curve')
