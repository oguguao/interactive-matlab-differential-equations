%% Interactive MATLAB Lab 6.7: Comparing Numerical Methods
% Compare Euler, Modified Euler, and RK4 for y' = y, y(0) = 1.
% In a Live Script, turn baseStep into a drop-down control.
% Choose a value that divides the interval [0,1] exactly.

baseStep = 0.2;   % Try 0.2, 0.1, 0.05

slopeFunction = @(x,y) y;
exactFinalValue = exp(1);

methods = ["Euler","Modified Euler","RK4"];
orders = [1 2 4];

comparison = zeros(3,7);

for methodIndex = 1:3
    methodName = methods(methodIndex);
    methodOrder = orders(methodIndex);

    coarseValue = advanceToOne(methodName,baseStep,slopeFunction);
    fineValue = advanceToOne(methodName,baseStep/2,slopeFunction);

    coarseError = abs(coarseValue-exactFinalValue);
    fineError = abs(fineValue-exactFinalValue);

    if fineError > 0
        observedReduction = coarseError/fineError;
    else
        observedReduction = Inf;
    end

    estimatedFineError = ...
        abs(fineValue-coarseValue)/(2^methodOrder-1);

    extrapolatedValue = fineValue + ...
        (fineValue-coarseValue)/(2^methodOrder-1);

    comparison(methodIndex,:) = [ ...
        coarseValue, fineValue, coarseError, fineError, ...
        observedReduction, estimatedFineError, extrapolatedValue];
end

comparisonTable = array2table(comparison, ...
    'VariableNames',{ ...
    'A_h','A_h2','error_h','error_h2', ...
    'errorReduction','estimatedFineError','extrapolatedValue'}, ...
    'RowNames',cellstr(methods));

disp("Exact value y(1) = e = " + string(exactFinalValue))
disp("Base step h = " + string(baseStep))
disp(comparisonTable)

figure
bar(categorical(methods),comparison(:,4))
set(gca,'YScale','log')
grid on
ylabel('fine-step absolute error')
title('Fine-Step Error by Method')

%% Local function
function yFinal = advanceToOne(methodName,h,f)

    x = 0;
    y = 1;
    numberOfSteps = round(1/h);

    for n = 1:numberOfSteps
        switch methodName
            case "Euler"
                y = y + h*f(x,y);

            case "Modified Euler"
                k1 = f(x,y);
                predictor = y + h*k1;
                k2 = f(x+h,predictor);
                y = y + h/2*(k1+k2);

            case "RK4"
                k1 = f(x,y);
                k2 = f(x+h/2,y+h*k1/2);
                k3 = f(x+h/2,y+h*k2/2);
                k4 = f(x+h,y+h*k3);
                y = y + h/6*(k1+2*k2+2*k3+k4);
        end

        x = x + h;
    end

    yFinal = y;
end
