%% Interactive MATLAB Lab 2.6: Integrating Factors for Nonexact Equations
% In a Live Script, turn stageChoice into a drop-down control.

stageChoice = "Original Equation";
% Options: "Original Equation", "Find Integrating Factor", "Transformed Equation"

syms x y c

mExpr = x + 2*y;
nExpr = x;

originalResidual = simplify(diff(mExpr,y) - diff(nExpr,x));
originalExact = isequal(originalResidual,sym(0));

ratio = simplify((diff(mExpr,y) - diff(nExpr,x))/nExpr);

% Since ratio = 1/x, one convenient integrating factor is mu(x)=x
% on an interval that does not cross x=0.
mu = x;

mStar = expand(mu*mExpr);
nStar = expand(mu*nExpr);

transformedResidual = simplify(diff(mStar,y) - diff(nStar,x));
transformedExact = isequal(transformedResidual,sym(0));

potentialExpr = simplify(int(mStar,x));
potentialResidual = simplify([ ...
    diff(potentialExpr,x) - mStar, ...
    diff(potentialExpr,y) - nStar ...
]);
potentialCheck = all(arrayfun(@(z) isequal(z,sym(0)), potentialResidual));

disp("Interactive MATLAB Lab 2.6")

switch stageChoice
    case "Original Equation"
        disp("M(x,y) =")
        disp(mExpr)
        disp("N(x,y) =")
        disp(nExpr)
        disp("Original equation exact?")
        disp(originalExact)

    case "Find Integrating Factor"
        disp("Test ratio (M_y - N_x)/N =")
        disp(ratio)
        disp("Integrating factor mu(x) =")
        disp(mu)
        disp("Use an interval that does not cross x = 0.")

    case "Transformed Equation"
        disp("Transformed M* =")
        disp(mStar)
        disp("Transformed N* =")
        disp(nStar)
        disp("Transformed equation exact?")
        disp(transformedExact)
        disp("Potential function:")
        disp(potentialExpr)
        disp("Potential verification:")
        disp(potentialCheck)
        disp("Implicit solution: F(x,y) = C")
end
