%% Interactive MATLAB Lab 4.3: Repeated Real Characteristic Roots
% In a Live Script, turn rootValue, c1, and c2 into sliders or numeric controls.

rootValue = -1;
c1 = 1;
c2 = 1;

syms x

basis1 = exp(rootValue*x);
basis2 = x*exp(rootValue*x);

wronskianValue = simplify( ...
    basis1*diff(basis2,x) - basis2*diff(basis1,x) );

solution = c1*basis1 + c2*basis2;

operatorResidual = simplify( ...
    diff(solution,x,2) - ...
    2*rootValue*diff(solution,x) + ...
    rootValue^2*solution );

operatorCheck = isequal(operatorResidual,sym(0));

disp("Repeated root:")
disp(rootValue)
disp("Basis functions:")
disp([basis1; basis2])
disp("Wronskian:")
disp(wronskianValue)
disp("Differential-equation verification:")
disp(operatorCheck)

figure
fplot(solution,[0 4],'LineWidth',1.6)
grid on
xlabel('x')
ylabel('y')
title('Repeated-Root Solution')
