%% Interactive MATLAB Lab 8.1: Preliminary Theory - Linear Systems
% In a Live Script, turn entry11, entry12, entry21, and entry22
% into sliders or numeric controls.

entry11 = 3;
entry12 = 2;
entry21 = 1;
entry22 = 4;

A = [entry11 entry12; entry21 entry22];

[eigenvectors,eigenvalueMatrix] = eig(A);
eigenvalues = diag(eigenvalueMatrix);

tolerance = 1e-10;
realParts = real(eigenvalues);
imagParts = imag(eigenvalues);

if all(realParts < -tolerance)
    if any(abs(imagParts) > tolerance)
        classification = "Asymptotically stable spiral";
    else
        classification = "Asymptotically stable node";
    end
elseif all(realParts > tolerance)
    if any(abs(imagParts) > tolerance)
        classification = "Unstable spiral";
    else
        classification = "Unstable node";
    end
elseif any(realParts < -tolerance) && any(realParts > tolerance)
    classification = "Saddle-type behavior";
elseif all(abs(realParts) <= tolerance) && any(abs(imagParts) > tolerance)
    classification = "Center / neutrally stable oscillation";
else
    classification = "Marginal or repeated-root case - inspect eigenstructure";
end

% Matrix exponential and a numerical check of Phi'(t) = A Phi(t).
testTime = 1;
Phi = expm(A*testTime);

delta = 1e-6;
PhiDerivativeApprox = ...
    (expm(A*(testTime+delta)) - expm(A*(testTime-delta)))/(2*delta);

matrixResidual = norm(PhiDerivativeApprox - A*Phi,'fro');

disp("Coefficient matrix A:")
disp(A)
disp("Eigenvalues:")
disp(eigenvalues)
disp("Eigenvectors (columns):")
disp(eigenvectors)
disp("expm(A) at t = 1:")
disp(Phi)
disp("Finite-difference residual for Phi' = A Phi:")
disp(matrixResidual)
disp("Qualitative classification: " + classification)

% Direction field.
xValues = linspace(-3,3,25);
yValues = linspace(-3,3,25);
[X,Y] = meshgrid(xValues,yValues);

U = A(1,1)*X + A(1,2)*Y;
V = A(2,1)*X + A(2,2)*Y;

speed = sqrt(U.^2 + V.^2);
speed(speed == 0) = 1;

U = U./speed;
V = V./speed;

figure
quiver(X,Y,U,V,0.45)
axis equal
grid on
xlabel('x_1')
ylabel('x_2')
title("Phase Direction Field: " + classification)
