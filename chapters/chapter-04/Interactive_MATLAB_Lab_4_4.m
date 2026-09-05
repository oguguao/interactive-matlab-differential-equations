%% Interactive MATLAB Lab 4.4: Complex Conjugate Characteristic Roots
% In a Live Script, turn alpha, beta, initialValue, and initialSlope
% into sliders or numeric controls. Keep beta > 0.

alpha = -0.5;
beta = 2;
initialValue = 1;
initialSlope = 0;

c1 = initialValue;
c2 = (initialSlope - alpha*initialValue)/beta;

solution = @(x) exp(alpha.*x).*( ...
    c1.*cos(beta.*x) + c2.*sin(beta.*x));

period = 2*pi/abs(beta);
amplitudeFactor = sqrt(c1^2 + c2^2);
upperEnvelope = @(x) amplitudeFactor.*exp(alpha.*x);
lowerEnvelope = @(x) -upperEnvelope(x);

syms xs
symbolicSolution = exp(alpha*xs)*( ...
    c1*cos(beta*xs) + c2*sin(beta*xs));

residual = simplify( ...
    diff(symbolicSolution,xs,2) - ...
    2*alpha*diff(symbolicSolution,xs) + ...
    (alpha^2 + beta^2)*symbolicSolution );

verification = isequal(residual,sym(0));

disp("Roots: alpha +/- i beta")
disp("alpha = " + string(alpha))
disp("beta = " + string(beta))
disp("Period = " + string(period))
disp("Differential-equation verification:")
disp(verification)

figure
fplot(solution,[0 10],'LineWidth',1.6)
hold on
fplot(upperEnvelope,[0 10],'--','LineWidth',1.2)
fplot(lowerEnvelope,[0 10],'--','LineWidth',1.2)
hold off
grid on
xlabel('x')
ylabel('y')
legend('solution','upper envelope','lower envelope','Location','best')
title('Complex-Root Oscillation and Exponential Envelope')
