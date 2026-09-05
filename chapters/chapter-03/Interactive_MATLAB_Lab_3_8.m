%% Interactive MATLAB Lab 3.8: Financial Models with Deposits and Withdrawals
% cashFlow > 0 represents deposits; cashFlow < 0 represents withdrawals.
% In a Live Script, turn the parameters into sliders or numeric controls.

initialBalance = 100000;
interestRate = 0.05;
cashFlow = -8000;

balanceModel = @(t) ...
    (initialBalance + cashFlow/interestRate).*exp(interestRate.*t) ...
    - cashFlow/interestRate;

initialRate = interestRate*initialBalance + cashFlow;
equilibriumBalance = -cashFlow/interestRate;

if cashFlow < -interestRate*initialBalance
    depletionTime = log(cashFlow / ...
        (cashFlow + interestRate*initialBalance))/interestRate;
else
    depletionTime = NaN;
end

disp("Initial rate of change = $" + string(initialRate) + " per year")
disp("Formal equilibrium balance = $" + string(equilibriumBalance))

if isnan(depletionTime)
    disp("Depletion time: No positive depletion time under these parameters")
else
    disp("Depletion time = " + string(depletionTime) + " years")
end

figure
fplot(balanceModel,[0 30],'LineWidth',1.6)
yline(0,'--')
grid on
xlabel('years')
ylabel('balance')
title('Continuous Financial Model')
