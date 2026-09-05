%% Interactive MATLAB Lab 2.10: Method-Selection Challenge
% In a Live Script, turn problemNumber into a drop-down or numeric control.
% Turn revealAnswer into a check box or drop-down control.

problemNumber = 1;
revealAnswer = false;

equations = [
    "y' = x y"
    "y' + 2y = x"
    "(2xy + 1) + (x^2 + 2y)y' = 0"
    "y' + y = x y^2"
    "y' = 1 + y/x"
    "y' = (x + y)^2"
];

preferredMethods = [
    "Separation of variables"
    "First-order linear"
    "Exact equation"
    "Bernoulli"
    "Homogeneous substitution y = v x"
    "Composite substitution u = x + y"
];

otherMethods = [
    "Also a homogeneous first-order linear equation"
    "No simpler standard method is more direct"
    "Exactness is the most direct structure"
    "Bernoulli is the natural transformation"
    "Also a first-order linear equation"
    "Composite substitution is the natural simplification"
];

reasons = [
    "The right-hand side is a product of a function of x and a function of y."
    "The equation is already in the form y' + P(x)y = Q(x)."
    "In differential form, the required mixed partial derivatives agree."
    "The equation contains the nonlinear power y^2 in Bernoulli form."
    "The right-hand side depends only on the ratio y/x, although the equation is also linear."
    "The repeated quantity x + y appears as a single composite expression."
];

disp("Problem " + string(problemNumber))
disp("Equation: " + equations(problemNumber))

if revealAnswer
    disp("Preferred method: " + preferredMethods(problemNumber))
    disp("Other observation: " + otherMethods(problemNumber))
    disp("Why: " + reasons(problemNumber))
else
    disp("Classify the equation before revealing the suggestion.")
end
