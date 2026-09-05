%% Interactive MATLAB Lab 1.4: Linearity Tester
% In a Live Script, turn "choice" into a drop-down control.
% Optional: turn a and b into sliders.

choice = 1;   % 1=linear variable coefficients, 2=y^2, 3=sin(y), 4=linear complicated coefficients
a = 2;
b = 1;

syms x
syms f(x) g(x)

switch choice
    case 1
        op = @(z) x^2*diff(z,x,2) + x*diff(z,x) - z;
        description = "L[y] = x^2 y'' + x y' - y";
        classification = "Linear";
    case 2
        op = @(z) diff(z,x) + z^2;
        description = "L[y] = y' + y^2";
        classification = "Nonlinear";
    case 3
        op = @(z) diff(z,x,2) + sin(z);
        description = "L[y] = y'' + sin(y)";
        classification = "Nonlinear";
    case 4
        op = @(z) exp(x)*diff(z,x,2) + cos(x)*diff(z,x) + x^2*z;
        description = "L[y] = e^x y'' + cos(x)y' + x^2 y";
        classification = "Linear";
end

residual = simplify(expand( ...
    op(a*f(x)+b*g(x)) - a*op(f(x)) - b*op(g(x)) ));

superpositionHolds = isequal(residual,sym(0));

disp("Selected Operator")
disp(description)
disp("Residual in L[af+bg] - aL[f] - bL[g]:")
disp(residual)

if superpositionHolds
    disp("YES - the superposition property holds.")
else
    disp("NO - the superposition property fails.")
end

disp("Classification: " + classification)
