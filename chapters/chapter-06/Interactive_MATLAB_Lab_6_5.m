%% Interactive MATLAB Lab 6.5: Numerical Methods for Systems
% In a Live Script, turn methodChoice into a drop-down control.
% Turn stepSize, initialU, and initialV into numeric controls.

methodChoice = "Euler";   % Options: "Euler", "RK4"
stepSize = 0.05;
initialU = 1;
initialV = 0;

vectorField = @(state) [
    state(1)-state(2)
    state(1)+state(2)
];

t0 = 0;
tFinal = 2;
numberOfSteps = round((tFinal-t0)/stepSize);

timeValues = zeros(numberOfSteps+1,1);
stateValues = zeros(numberOfSteps+1,2);

timeValues(1) = t0;
stateValues(1,:) = [initialU initialV];

for n = 1:numberOfSteps
    currentTime = timeValues(n);
    currentState = stateValues(n,:).';

    switch methodChoice
        case "Euler"
            nextState = currentState + ...
                stepSize*vectorField(currentState);

        case "RK4"
            k1 = vectorField(currentState);
            k2 = vectorField(currentState + stepSize*k1/2);
            k3 = vectorField(currentState + stepSize*k2/2);
            k4 = vectorField(currentState + stepSize*k3);

            nextState = currentState + ...
                stepSize/6*(k1+2*k2+2*k3+k4);
    end

    timeValues(n+1) = currentTime + stepSize;
    stateValues(n+1,:) = nextState.';
end

uValues = stateValues(:,1);
vValues = stateValues(:,2);

disp("Method: " + methodChoice)
disp("Step size: " + string(stepSize))
disp("Final state [u,v] =")
disp(stateValues(end,:))

figure
plot(timeValues,uValues,'LineWidth',1.5)
hold on
plot(timeValues,vValues,'LineWidth',1.5)
hold off
grid on
xlabel('t')
ylabel('value')
legend('u(t)','v(t)','Location','best')
title(methodChoice + " Time Traces")

figure
plot(uValues,vValues,'LineWidth',1.6)
grid on
xlabel('u')
ylabel('v')
title(methodChoice + " Phase Curve")
