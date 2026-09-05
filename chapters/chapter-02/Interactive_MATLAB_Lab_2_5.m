%% Interactive MATLAB Lab 2.5: Systematic Potential-Function Method
% In a Live Script, turn startChoice into a drop-down control.

startChoice = "Integrate M first";   % Other option: "Integrate N first"

syms x y

mExpr = 3*x^2*y + 2*y;
nExpr = x^3 + 2*x + 4*y^3;

exactResidual = simplify(diff(mExpr,y) - diff(nExpr,x));
exactCheck = isequal(exactResidual,sym(0));

switch startChoice
    case "Integrate M first"
        partialPotential = int(mExpr,x);
        missingDerivative = simplify(nExpr - diff(partialPotential,y));
        potentialExpr = simplify(partialPotential + int(missingDerivative,y));

    case "Integrate N first"
        partialPotential = int(nExpr,y);
        missingDerivative = simplify(mExpr - diff(partialPotential,x));
        potentialExpr = simplify(partialPotential + int(missingDerivative,x));
end

gradientResidual = simplify([ ...
    diff(potentialExpr,x) - mExpr, ...
    diff(potentialExpr,y) - nExpr ...
]);

gradientCheck = all(arrayfun(@(z) isequal(z,sym(0)), gradientResidual));

disp("M(x,y) =")
disp(mExpr)
disp("N(x,y) =")
disp(nExpr)
disp("Exactness check:")
disp(exactCheck)
disp("Starting method: " + startChoice)
disp("Starting partial potential:")
disp(partialPotential)
disp("Missing derivative:")
disp(missingDerivative)
disp("Potential function F(x,y):")
disp(potentialExpr)
disp("Gradient verification:")
disp(gradientCheck)
disp("Implicit solution: F(x,y) = C")
