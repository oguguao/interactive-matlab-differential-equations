%% Interactive MATLAB Lab 4.6: Nonhomogeneous Solution Decomposition
% In a Live Script, turn forcingAmplitude, c1, and c2
% into sliders or numeric controls.

forcingAmplitude = 1;
c1 = 1;
c2 = 0;

syms x

complementary = c1*exp(x) + c2*exp(-x);
particular = forcingAmplitude/3*exp(2*x);
completeSolution = complementary + particular;

complementaryCheck = isequal( ...
    simplify(diff(complementary,x,2)-complementary),sym(0));

particularCheck = isequal( ...
    simplify(diff(particular,x,2)-particular- ...
    forcingAmplitude*exp(2*x)),sym(0));

completeCheck = isequal( ...
    simplify(diff(completeSolution,x,2)-completeSolution- ...
    forcingAmplitude*exp(2*x)),sym(0));

disp("Complementary solution:")
disp(complementary)
disp("Particular solution:")
disp(particular)
disp("Complementary verification:")
disp(complementaryCheck)
disp("Particular verification:")
disp(particularCheck)
disp("Complete-solution verification:")
disp(completeCheck)

figure
fplot(complementary,[-1 2],'LineWidth',1.5)
hold on
fplot(particular,[-1 2],'LineWidth',1.5)
fplot(completeSolution,[-1 2],'LineWidth',1.8)
hold off
grid on
xlabel('x')
ylabel('y')
legend('y_c','y_p','y_c + y_p','Location','best')
title('Complementary and Particular Components')
