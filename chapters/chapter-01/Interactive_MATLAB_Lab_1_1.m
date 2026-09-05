%% Interactive MATLAB Lab 1.1: Is It a Solution?
% In a Live Script, turn "choice" into a drop-down control.

choice = "exp(x^2)";   % Options: "exp(x^2)", "exp(x^2)+1", "3exp(x^2)", "x^2"

syms x

switch choice
    case "exp(x^2)"
        candidate = exp(x^2);
    case "exp(x^2)+1"
        candidate = exp(x^2) + 1;
    case "3exp(x^2)"
        candidate = 3*exp(x^2);
    case "x^2"
        candidate = x^2;
end

lhs = diff(candidate,x);
rhs = 2*x*candidate;
residual = simplify(lhs-rhs);
check = isequal(residual,sym(0));

disp("Differential equation: y' = 2xy")
disp("Proposed solution:")
disp(candidate)
disp("Left side y'(x):")
disp(lhs)
disp("Right side 2xy:")
disp(rhs)
disp("Residual lhs-rhs:")
disp(residual)

if check
    disp("YES - the proposed function satisfies the differential equation.")
else
    disp("NO - the proposed function does not satisfy the differential equation.")
end

figure
fplot(candidate,[-2 2],'LineWidth',1.5)
grid on
xlabel('x')
ylabel('y')
title('Proposed Solution')
