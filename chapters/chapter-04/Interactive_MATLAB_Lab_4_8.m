%% Interactive MATLAB Lab 4.8: Variation of Parameters
% This lab uses Symbolic Math Toolbox.
% The formulas are evaluated on an interval contained in (-pi/2, pi/2).

syms x

basis1 = cos(x);
basis2 = sin(x);
forcing = sec(x);

wronskianValue = simplify( ...
    basis1*diff(basis2,x) - basis2*diff(basis1,x) );

parameter1 = simplify(int(-basis2*forcing/wronskianValue,x));
parameter2 = simplify(int( basis1*forcing/wronskianValue,x));

particular = simplify(basis1*parameter1 + basis2*parameter2);

verificationResidual = simplify( ...
    diff(particular,x,2) + particular - forcing );

verification = isequal(verificationResidual,sym(0));

disp("Wronskian:")
disp(wronskianValue)
disp("u1(x):")
disp(parameter1)
disp("u2(x):")
disp(parameter2)
disp("Particular solution:")
disp(particular)
disp("Differential-equation verification:")
disp(verification)
disp("Use an interval that does not contain a zero of cos(x).")

figure
fplot(particular,[-1.4 1.4],'LineWidth',1.6)
grid on
xlabel('x')
ylabel('y_p(x)')
title('Variation-of-Parameters Particular Solution')
