%% Interactive MATLAB Lab 9.5: Singular Points
% Bessel equation:
% x^2 y'' + x y' + (x^2 - nu^2)y = 0
%
% Standard form:
% y'' + (1/x)y' + (1 - nu^2/x^2)y = 0
%
% In a Live Script, turn orderParameter into a drop-down control.

orderParameter = 1;      % Try 0, 1, 2, 3

nu = orderParameter;

ordinaryAtZero = false;

% Regular-singular tests at x = 0:
% lim x P(x) = 1
% lim x^2 Q(x) = -nu^2
regularTestP = 1;
regularTestQ = -nu^2;

isRegularSingular = isfinite(regularTestP) && isfinite(regularTestQ);

% Indicial equation:
% r(r-1) + p0 r + q0 = 0
% = r^2 - nu^2 = 0.
indicialCoefficients = [1 0 -nu^2];
indicialRoots = roots(indicialCoefficients);

if nu == 0
    rootRelationship = "Repeated indicial root r = 0";
else
    rootRelationship = ...
        "Distinct roots r = +/-nu; they differ by the integer " + string(2*nu);
end

disp("Bessel order nu = " + string(nu))
disp("Ordinary at x = 0:")
disp(ordinaryAtZero)
disp("lim x P(x) = " + string(regularTestP))
disp("lim x^2 Q(x) = " + string(regularTestQ))
disp("Regular singular at x = 0:")
disp(isRegularSingular)
disp("Indicial polynomial: r^2 - nu^2")
disp("Indicial roots:")
disp(indicialRoots)
disp(rootRelationship)
