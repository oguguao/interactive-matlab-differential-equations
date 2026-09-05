%% Interactive MATLAB Lab 3.5: Mixture Problems
% In a Live Script, turn all four parameters into sliders or numeric controls.

tankVolume = 100;
flowRate = 2;
incomingConcentration = 5;
initialAmount = 0;

equilibriumAmount = tankVolume*incomingConcentration;

amountModel = @(t) equilibriumAmount + ...
    (initialAmount - equilibriumAmount).* ...
    exp(-(flowRate/tankVolume).*t);

concentrationModel = @(t) amountModel(t)./tankVolume;

rateIn = flowRate*incomingConcentration;

disp("Rate in = " + string(rateIn) + " amount-units/time")
disp("Equilibrium amount = " + string(equilibriumAmount))
disp("Limiting concentration = " + string(incomingConcentration))

figure
fplot(amountModel,[0 150],'LineWidth',1.6)
hold on
yline(equilibriumAmount,'--','LineWidth',1.4)
hold off
grid on
xlabel('time')
ylabel('amount')
legend('A(t)','equilibrium amount','Location','best')
title('Constant-Volume Mixture')

figure
fplot(concentrationModel,[0 150],'LineWidth',1.6)
grid on
xlabel('time')
ylabel('concentration')
title('Tank Concentration')
