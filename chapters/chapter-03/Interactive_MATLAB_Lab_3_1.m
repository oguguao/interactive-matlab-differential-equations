%% Interactive MATLAB Lab 3.1: Building a Differential-Equation Model
% In a Live Script, turn inputRate, lossConstant, and initialAmount
% into sliders or numeric controls.

inputRate = 12;
lossConstant = 0.3;
initialAmount = 5;

equilibriumAmount = inputRate/lossConstant;

solution = @(t) equilibriumAmount + ...
    (initialAmount - equilibriumAmount).*exp(-lossConstant.*t);

initialRate = inputRate - lossConstant*initialAmount;

disp("Model: Q' = R - kQ")
disp("Initial condition: Q(0) = " + string(initialAmount))
disp("Equilibrium amount R/k = " + string(equilibriumAmount))
disp("Initial rate of change Q'(0) = " + string(initialRate))

figure
fplot(solution,[0 20],'LineWidth',1.6)
hold on
yline(equilibriumAmount,'--','LineWidth',1.4)
hold off
grid on
xlabel('t')
ylabel('Q')
legend('Q(t)','equilibrium','Location','best')
title('Approach to Equilibrium')
