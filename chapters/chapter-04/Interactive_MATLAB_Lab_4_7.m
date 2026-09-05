%% Interactive MATLAB Lab 4.7: Undetermined Coefficients and Resonance
% In a Live Script, turn forcingChoice into a drop-down control.

forcingChoice = "Resonant";
% Options: "Resonant", "Nonresonant"

syms x

complementary = exp(x) + exp(2*x);

switch forcingChoice
    case "Nonresonant"
        forcing = exp(3*x);
        trial = sym('A')*exp(3*x);
        coefficientValue = sym(1)/2;
        particular = coefficientValue*exp(3*x);
        resonanceMessage = ...
            "No resonance: the usual exponential trial is sufficient.";

    case "Resonant"
        forcing = exp(x);
        trial = sym('A')*x*exp(x);
        coefficientValue = sym(-1);
        particular = -x*exp(x);
        resonanceMessage = ...
            "Resonance: multiply the usual exponential trial by x.";
end

operator = @(v) diff(v,x,2) - 3*diff(v,x) + 2*v;
verificationResidual = simplify(operator(particular)-forcing);
verification = isequal(verificationResidual,sym(0));

disp(resonanceMessage)
disp("Trial form:")
disp(trial)
disp("Required coefficient:")
disp(coefficientValue)
disp("Particular solution:")
disp(particular)
disp("Verification:")
disp(verification)
disp("A representative complementary solution:")
disp(complementary)
