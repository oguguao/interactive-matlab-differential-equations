%% Interactive MATLAB Lab 2.4: Exact Equations and Inspection
% In a Live Script, turn c into a slider or numeric control.

c = 0;

syms x y

mExpr = 2*x*y + 3;
nExpr = x^2 + 4*y;
potentialExpr = x^2*y + 3*x + 2*y^2;

my = diff(mExpr,y);
nx = diff(nExpr,x);

exactnessResidual = simplify(my - nx);
gradientResidual = simplify([ ...
    diff(potentialExpr,x) - mExpr, ...
    diff(potentialExpr,y) - nExpr ...
]);

exactnessCheck = isequal(exactnessResidual,sym(0));
gradientCheck = all(arrayfun(@(z) isequal(z,sym(0)), gradientResidual));

disp("M(x,y) =")
disp(mExpr)
disp("N(x,y) =")
disp(nExpr)
disp("M_y =")
disp(my)
disp("N_x =")
disp(nx)
disp("Exactness check:")
disp(exactnessCheck)
disp("Potential function F(x,y) =")
disp(potentialExpr)
disp("Gradient verification:")
disp(gradientCheck)
disp("Selected solution constant C = " + string(c))

figure
fimplicit(@(x,y) x.^2.*y + 3*x + 2*y.^2 - c,[-3 3 -3 3], ...
    'LineWidth',1.6)
grid on
xlabel('x')
ylabel('y')
title('Implicit Solution Curve F(x,y) = C')
