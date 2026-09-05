%% Interactive MATLAB Lab 4.9: Cauchy-Euler Root Explorer
% In a Live Script, turn caseChoice into a drop-down control.

caseChoice = "Repeated";
% Options: "Distinct", "Repeated", "Complex"

syms x m

switch caseChoice
    case "Distinct"
        aCoeff = -1;
        bCoeff = -3;
        candidate = x^3 + x^(-1);
        classification = "Distinct real indicial roots";

    case "Repeated"
        aCoeff = -3;
        bCoeff = 4;
        candidate = x^2*(1 + log(x));
        classification = "Repeated real indicial root";

    case "Complex"
        aCoeff = 1;
        bCoeff = 4;
        candidate = cos(2*log(x)) + sin(2*log(x));
        classification = "Complex conjugate indicial roots";
end

indicialPolynomial = expand(m*(m-1) + aCoeff*m + bCoeff);
indicialRoots = solve(indicialPolynomial == 0,m);

equationResidual = simplify( ...
    x^2*diff(candidate,x,2) + ...
    aCoeff*x*diff(candidate,x) + ...
    bCoeff*candidate );

verification = isequal(equationResidual,sym(0));

disp("Classification: " + classification)
disp("Indicial polynomial:")
disp(indicialPolynomial)
disp("Indicial roots:")
disp(indicialRoots)
disp("Representative solution:")
disp(candidate)
disp("Residual:")
disp(equationResidual)
disp("Verification:")
disp(verification)

figure
fplot(candidate,[0.2 5],'LineWidth',1.6)
grid on
xlabel('x')
ylabel('y')
title('Cauchy-Euler Representative Solution on x > 0')
