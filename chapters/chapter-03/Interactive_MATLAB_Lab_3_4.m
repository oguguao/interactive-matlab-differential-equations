%% Interactive MATLAB Lab 3.4: Logistic Population Growth
% In a Live Script, turn carryingCapacity, growthRate, and initialFraction
% into sliders or numeric controls.

carryingCapacity = 1000;
growthRate = 0.4;
initialFraction = 0.05;

initialPopulation = initialFraction*carryingCapacity;
aValue = (carryingCapacity - initialPopulation)/initialPopulation;

populationModel = @(t) carryingCapacity ./ ...
    (1 + aValue.*exp(-growthRate.*t));

halfCapacityTime = log(aValue)/growthRate;
maximumGrowthRate = growthRate*carryingCapacity/4;

disp("Initial population = " + string(initialPopulation))
disp("Carrying capacity K = " + string(carryingCapacity))
disp("Time to reach K/2 = " + string(halfCapacityTime))
disp("Maximum growth rate rK/4 = " + string(maximumGrowthRate))

figure
fplot(populationModel,[0 30],'LineWidth',1.6)
hold on
yline(carryingCapacity,'--','LineWidth',1.4)
yline(carryingCapacity/2,':','LineWidth',1.4)
hold off
ylim([0 1.1*carryingCapacity])
grid on
xlabel('t')
ylabel('population')
legend('P(t)','K','K/2','Location','best')
title('Logistic Population Model')
