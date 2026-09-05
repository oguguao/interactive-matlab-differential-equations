%% Interactive MATLAB Lab 3.7: First-Order Electrical Circuits
% In a Live Script, turn circuitType into a drop-down control.
% The remaining parameters may be numeric controls or drop-down menus.

circuitType = "RC";   % Options: "RC", "RL"
voltage = 12;
resistance = 1000;
capacitance = 0.001;
inductance = 4;

if circuitType == "RC"
    timeConstant = resistance*capacitance;

    firstFunction = @(t) capacitance*voltage.* ...
        (1 - exp(-t./timeConstant));

    secondFunction = @(t) (voltage/resistance).* ...
        exp(-t./timeConstant);

    steadyValue = capacitance*voltage;
    firstLabel = "charge q(t)";
    secondLabel = "current i(t)";
else
    timeConstant = inductance/resistance;

    firstFunction = @(t) (voltage/resistance).* ...
        (1 - exp(-t./timeConstant));

    secondFunction = @(t) voltage - resistance.*firstFunction(t);

    steadyValue = voltage/resistance;
    firstLabel = "current i(t)";
    secondLabel = "inductor voltage";
end

disp("Circuit type: " + circuitType)
disp("Time constant = " + string(timeConstant))
disp("Steady primary value = " + string(steadyValue))

displayEnd = max(0.01,6*timeConstant);

figure
fplot(firstFunction,[0 displayEnd],'LineWidth',1.6)
hold on
fplot(secondFunction,[0 displayEnd],'LineWidth',1.6)
xline(timeConstant,':','LineWidth',1.2)
hold off
grid on
xlabel('time')
ylabel('value')
legend(firstLabel,secondLabel,'time constant','Location','best')
title('First-Order Circuit Response')
