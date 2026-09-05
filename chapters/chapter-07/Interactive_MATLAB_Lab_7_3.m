%% Interactive MATLAB Lab 7.3: Operational Properties I
% In a Live Script, turn propertyChoice into a drop-down control.
% This lab requires Symbolic Math Toolbox.

propertyChoice = "Exponential shift";
% Other option: "Multiply by t^2"

syms t s

switch propertyChoice
    case "Exponential shift"
        baseTimeFunction = sin(3*t);
        baseTransform = simplify(laplace(baseTimeFunction,t,s));

        byProperty = simplify(subs(baseTransform,s,s-2));
        directTransform = simplify(laplace(exp(2*t)*sin(3*t),t,s));

        propertyDescription = ...
            "Multiplication by exp(2t) shifts s to s-2.";

    case "Multiply by t^2"
        baseTimeFunction = cos(t);
        baseTransform = simplify(laplace(baseTimeFunction,t,s));

        byProperty = simplify(diff(baseTransform,s,2));
        directTransform = simplify(laplace(t^2*cos(t),t,s));

        propertyDescription = ...
            "Multiplication by t^2 corresponds to d^2/ds^2.";
end

agreement = isAlways(simplify(byProperty-directTransform) == 0);

disp("Property: " + propertyChoice)
disp(propertyDescription)
disp("Base transform:")
disp(baseTransform)
disp("Using the operational property:")
disp(byProperty)
disp("Direct MATLAB transform:")
disp(directTransform)
disp("Agreement:")
disp(agreement)
