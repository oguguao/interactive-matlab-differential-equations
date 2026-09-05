%% Interactive MATLAB Lab 5.7: Selecting and Interpreting Second-Order Models
% Convert systemChoice into a drop-down control.
% Convert the three coefficients into sliders or numeric controls.

systemChoice = "Spring-mass";
% Options: "Spring-mass", "RLC circuit", "Linearized pendulum"

secondDerivativeCoefficient = 1;
firstDerivativeCoefficient = 2;
dependentVariableCoefficient = 5;

a = secondDerivativeCoefficient;
b = firstDerivativeCoefficient;
c = dependentVariableCoefficient;

discriminant = b^2 - 4*a*c;
rootValues = roots([a b c]);

tolerance = 1e-10;

if abs(b) <= tolerance && discriminant < -tolerance
    classification = "Undamped oscillation";
elseif discriminant < -tolerance
    classification = "Underdamped / oscillatory decay";
elseif abs(discriminant) <= tolerance
    classification = "Critically damped";
else
    classification = "Overdamped";
end

switch systemChoice
    case "Spring-mass"
        interpretation = ...
            "Dependent variable = displacement; first-derivative coefficient = mechanical damping.";
    case "RLC circuit"
        interpretation = ...
            "Dependent variable = charge; first-derivative coefficient = electrical resistance.";
    case "Linearized pendulum"
        interpretation = ...
            "Dependent variable = angle; first-derivative coefficient = rotational damping.";
end

disp("Physical system: " + systemChoice)
disp("Discriminant = " + string(discriminant))
disp("Classification: " + classification)
disp("Characteristic roots:")
disp(rootValues)
disp("Interpretation:")
disp(interpretation)
