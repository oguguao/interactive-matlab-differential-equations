%% Interactive MATLAB Lab 7.1: Definition of the Laplace Transform
% In a Live Script, turn functionChoice into a drop-down control.
% This lab requires Symbolic Math Toolbox.

functionChoice = "t^2";   % Options: "t^2", "t^3", "exp(2t)"

syms t s positive

switch functionChoice
    case "t^2"
        timeFunction = t^2;
        convergenceCondition = "s > 0";

    case "t^3"
        timeFunction = t^3;
        convergenceCondition = "s > 0";

    case "exp(2t)"
        timeFunction = exp(2*t);
        assumeAlso(s > 2)
        convergenceCondition = "s > 2";
end

fromDefinition = simplify(int(exp(-s*t)*timeFunction,t,0,inf));
fromCommand = simplify(laplace(timeFunction,t,s));
agreement = isAlways(fromDefinition == fromCommand);

disp("Time-domain function:")
disp(timeFunction)
disp("From the defining integral:")
disp(fromDefinition)
disp("From MATLAB laplace:")
disp(fromCommand)
disp("Convergence condition: " + convergenceCondition)
disp("Agreement:")
disp(agreement)
