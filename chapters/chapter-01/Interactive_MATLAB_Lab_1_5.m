%% Interactive MATLAB Lab 1.5: Forcing-Function Explorer
% In a Live Script, turn A, y0, and v0 into sliders or numeric controls.

A = 0;
y0 = 1;
v0 = 0;

syms x y(x)

forcing = A*exp(3*x);
ode = diff(y,x,2) - 3*diff(y,x) + 2*y == forcing;

Dy = diff(y,x);
conditions = [y(0) == y0, subs(Dy,x,0) == v0];

solution = dsolve(ode,conditions);

verificationResidual = simplify( ...
    diff(solution,x,2) - 3*diff(solution,x) + 2*solution - forcing );

verified = isequal(verificationResidual,sym(0));

if A == 0
    classification = "Homogeneous Linear Equation";
    plotTitle = "Homogeneous Response";
else
    classification = "Nonhomogeneous Linear Equation";
    plotTitle = "Response With External Forcing";
end

disp("Differential equation:")
disp(ode)
disp("Forcing amplitude A: " + string(A))
disp("Forcing function:")
disp(forcing)
disp("Classification: " + classification)
disp("Solution:")
disp(solution)
disp("Verification:")
disp(verified)

figure
fplot(solution,[0 2],'LineWidth',1.5)
grid on
xlabel('x')
ylabel('y')
title(plotTitle)
