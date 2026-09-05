%% Interactive MATLAB Lab 8.2: Homogeneous Linear Systems
% Matrix form:
% x' = A x,  A = [a b; -b a]
%
% In a Live Script, turn diagonalEntry, rotationEntry,
% initialX1, and initialX2 into sliders or numeric controls.

diagonalEntry = 1;
rotationEntry = 2;
initialX1 = 1;
initialX2 = 0;

A = [
    diagonalEntry,  rotationEntry
   -rotationEntry,  diagonalEntry
];

initialVector = [initialX1; initialX2];

[eigenvectors,eigenvalueMatrix] = eig(A);
eigenvalues = diag(eigenvalueMatrix);

if diagonalEntry < 0
    classification = "Stable spiral";
elseif diagonalEntry > 0
    classification = "Unstable spiral";
else
    classification = "Center";
end

timeValues = linspace(0,2*pi,500);
solution = zeros(2,numel(timeValues));

for k = 1:numel(timeValues)
    solution(:,k) = expm(A*timeValues(k))*initialVector;
end

initialCheck = norm(solution(:,1)-initialVector);
odeCheck = norm(A*solution(:,250) - ...
    (expm(A*(timeValues(250)+1e-6))*initialVector - ...
     expm(A*(timeValues(250)-1e-6))*initialVector)/(2e-6));

disp("Coefficient matrix A:")
disp(A)
disp("Eigenvalues:")
disp(eigenvalues)
disp("Eigenvectors (columns):")
disp(eigenvectors)
disp("Classification: " + classification)
disp("Initial-condition residual:")
disp(initialCheck)
disp("Representative differential-equation residual:")
disp(odeCheck)

figure
plot(solution(1,:),solution(2,:),'LineWidth',1.6)
axis equal
grid on
xlabel('x_1')
ylabel('x_2')
title("Phase-Plane Trajectory: " + classification)

figure
plot(timeValues,solution(1,:),'LineWidth',1.5)
hold on
plot(timeValues,solution(2,:),'LineWidth',1.5)
hold off
grid on
xlabel('t')
ylabel('component value')
legend('x_1(t)','x_2(t)','Location','best')
title('Homogeneous System Components')
