%% Interactive MATLAB Lab 2.3: Integrating-Factor Builder
% In a Live Script, turn p into a slider or numeric control.

p = 2;

syms x C1 y(x)

mu = exp(p*x);
integrand = expand(mu*x);

generalSolution = simplify((int(integrand,x) + C1)/mu);
identityResidual = simplify(diff(mu*y,x) - mu*(diff(y,x) + p*y));
verificationResidual = simplify(diff(generalSolution,x) + p*generalSolution - x);

identityVerified = isequal(identityResidual,sym(0));
solutionVerified = isequal(verificationResidual,sym(0));

disp("P(x) = " + string(p))
disp("Integrating factor:")
disp(mu)
disp("Product-rule identity verified:")
disp(identityVerified)
disp("General solution:")
disp(generalSolution)
disp("Differential-equation verification:")
disp(solutionVerified)
