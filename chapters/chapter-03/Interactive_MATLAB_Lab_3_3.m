%% Interactive MATLAB Lab 3.3: Newton's Law of Cooling and Heating
% In a Live Script, turn process into a drop-down control.
% Turn the remaining values into sliders or numeric controls.

process = "Cooling";   % Options: "Cooling", "Heating"
ambientTemperature = 20;
initialDifference = 70;
coolingConstant = 0.08;
measurementTime = 10;

if process == "Cooling"
    initialTemperature = ambientTemperature + initialDifference;
else
    initialTemperature = ambientTemperature - initialDifference;
end

temperatureModel = @(t) ambientTemperature + ...
    (initialTemperature - ambientTemperature).*exp(-coolingConstant.*t);

temperatureAtMeasurement = temperatureModel(measurementTime);

disp("Process: " + process)
disp("Initial temperature = " + string(initialTemperature))
disp("Ambient temperature = " + string(ambientTemperature))
disp("Temperature at t = " + string(measurementTime) + ...
    ": " + string(temperatureAtMeasurement))

figure
fplot(temperatureModel,[0 40],'LineWidth',1.6)
hold on
yline(ambientTemperature,'--','LineWidth',1.4)
hold off
grid on
xlabel('time')
ylabel('temperature')
legend('T(t)','ambient temperature','Location','best')
title('Approach to Ambient Temperature')
