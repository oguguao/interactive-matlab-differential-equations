%% Interactive MATLAB Lab 7.4: Unit Steps and Delayed Inputs
% In a Live Script, turn switchingTime into a slider or numeric control.
% This implementation avoids ambiguity at the switching point by using
% a logical step for plotting.

switchingTime = 2;

syms s

inputTransform = exp(-switchingTime*s)/s;
responseTransform = exp(-switchingTime*s)/(s*(s+1));

timeValues = linspace(0,8,800);
stepInput = double(timeValues >= switchingTime);

response = zeros(size(timeValues));
active = timeValues >= switchingTime;
tau = timeValues(active)-switchingTime;
response(active) = 1-exp(-tau);

disp("Switching time = " + string(switchingTime))
disp("Transform of delayed unit-step input:")
disp(inputTransform)
disp("Transform of response:")
disp(responseTransform)
disp("The factor exp(-a s) represents the time delay.")

figure
plot(timeValues,stepInput,'LineWidth',1.5)
hold on
plot(timeValues,response,'LineWidth',1.6)
xline(switchingTime,'--')
hold off
grid on
xlabel('t')
ylabel('value')
legend('input','response','switching time','Location','best')
title('Delayed Unit-Step Input and First-Order Response')
