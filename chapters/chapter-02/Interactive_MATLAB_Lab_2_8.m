%% Interactive MATLAB Lab 2.8: Homogeneous First-Order Equations
% In a Live Script, turn domainChoice into a drop-down and c into a slider.

domainChoice = "x > 0";   % Other option: "x < 0"
c = 0;

syms x

switch domainChoice
    case "x > 0"
        solution = x*(log(x) + c);
        xMin = 0.2;
        xMax = 5;

    case "x < 0"
        solution = x*(log(-x) + c);
        xMin = -5;
        xMax = -0.2;
end

verificationResidual = simplify( ...
    diff(solution,x) - (1 + solution/x), ...
    'IgnoreAnalyticConstraints',true );

verification = isequal(verificationResidual,sym(0));

disp("Differential equation: y' = 1 + y/x")
disp("Homogeneous substitution: y = x v")
disp("Then y' = v + x v'")
disp("Chosen interval: " + domainChoice)
disp("Solution:")
disp(solution)
disp("Verification:")
disp(verification)
disp("The solution interval cannot cross x = 0.")

figure
fplot(solution,[xMin xMax],'LineWidth',1.6)
grid on
xlabel('x')
ylabel('y')
title('Homogeneous First-Order Solution Family')
