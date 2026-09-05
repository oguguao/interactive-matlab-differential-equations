%% Interactive MATLAB Lab 3.2: Exponential Growth and Decay
% In a Live Script, turn the four input values into numeric controls.

initialAmount = 500;
measurementTime = 3;
measuredAmount = 650;
predictionTime = 10;

growthConstant = log(measuredAmount/initialAmount)/measurementTime;
model = @(t) initialAmount.*exp(growthConstant.*t);
prediction = model(predictionTime);

if growthConstant > 0
    classification = "Exponential growth";
    characteristicLabel = "Doubling time";
    characteristicTime = log(2)/growthConstant;
elseif growthConstant < 0
    classification = "Exponential decay";
    characteristicLabel = "Half-life";
    characteristicTime = log(2)/abs(growthConstant);
else
    classification = "Constant amount";
    characteristicLabel = "Characteristic time";
    characteristicTime = Inf;
end

disp("Classification: " + classification)
disp("Estimated k = " + string(growthConstant))

if isfinite(characteristicTime)
    disp(characteristicLabel + " = " + string(characteristicTime))
else
    disp(characteristicLabel + " = not applicable")
end

disp("Predicted amount at t = " + string(predictionTime) + ...
    ": " + string(prediction))

displayEnd = max(2*measurementTime,predictionTime);

figure
fplot(model,[0 displayEnd],'LineWidth',1.6)
grid on
xlabel('t')
ylabel('Q(t)')
title(classification)
