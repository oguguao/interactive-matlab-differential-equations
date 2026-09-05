%% Interactive MATLAB Lab 4.2: Distinct Real Characteristic Roots
% In a Live Script, turn caseChoice into a drop-down control.
% Turn initialValue and initialSlope into sliders or numeric controls.

caseChoice = "Both negative";
% Options: "Both negative", "Opposite signs", "Both positive"

initialValue = 1;
initialSlope = 0;

switch caseChoice
    case "Both negative"
        root1 = -2;
        root2 = -3;
    case "Opposite signs"
        root1 = 1;
        root2 = -2;
    case "Both positive"
        root1 = 1;
        root2 = 3;
end

coefficient1 = (initialSlope - root2*initialValue)/(root1-root2);
coefficient2 = initialValue - coefficient1;

solution = @(x) coefficient1.*exp(root1.*x) + ...
    coefficient2.*exp(root2.*x);

initialValueCheck = abs(solution(0)-initialValue) < 1e-10;
initialSlopeCheck = abs( ...
    coefficient1*root1 + coefficient2*root2 - initialSlope) < 1e-10;

disp("Root pattern: " + caseChoice)
disp("Roots: " + string(root1) + ", " + string(root2))
disp("Coefficient c1 = " + string(coefficient1))
disp("Coefficient c2 = " + string(coefficient2))
disp("Initial-value check:")
disp(initialValueCheck)
disp("Initial-slope check:")
disp(initialSlopeCheck)

figure
fplot(solution,[0 4],'LineWidth',1.6)
grid on
xlabel('x')
ylabel('y')
title('Distinct Real Characteristic Roots')
