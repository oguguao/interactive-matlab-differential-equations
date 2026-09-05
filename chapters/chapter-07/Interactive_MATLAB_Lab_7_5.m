%% Interactive MATLAB Lab 7.5: The Convolution Theorem
% In a Live Script, turn frequency into a slider or numeric control.
% Symbolic Math Toolbox is used to verify the theorem symbolically.

frequency = 1;

syms t tau s w positive

firstFunction = sym(1);
secondFunction = sin(w*t);

convolutionGeneral = simplify( ...
    int(sin(w*(t-tau)),tau,0,t));

firstTransform = laplace(firstFunction,t,s);
secondTransform = laplace(secondFunction,t,s);
productTransform = simplify(firstTransform*secondTransform);

inverseProduct = simplify(ilaplace(productTransform,s,t));
agreement = isAlways(simplify(convolutionGeneral-inverseProduct) == 0);

convolution = simplify(subs(convolutionGeneral,w,frequency));
productTransformNumeric = simplify(subs(productTransform,w,frequency));

disp("Convolution (f*g)(t):")
disp(convolution)
disp("Product F(s)G(s):")
disp(productTransformNumeric)
disp("Symbolic agreement:")
disp(agreement)

figure
fplot(convolution,[0 10],'LineWidth',1.6)
grid on
xlabel('t')
ylabel('(f*g)(t)')
title('Convolution of 1 and sin(\omega t)')
