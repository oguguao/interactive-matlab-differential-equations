%% Interactive MATLAB Lab 9.4: Radius and Interval of Convergence
% Series:
% sum_{n=1}^\infty (x-1)^n/(n 3^n)
%
% In a Live Script, turn numberOfTerms into a slider or numeric control.

numberOfTerms = 40;

center = 1;
radius = 3;
leftEndpoint = center-radius;    % -2
rightEndpoint = center+radius;   % 4

n = 1:numberOfTerms;

leftTerms = (-1).^n./n;
rightTerms = 1./n;

leftPartialSums = cumsum(leftTerms);
rightPartialSums = cumsum(rightTerms);

% A finite-n ratio estimate tends to 3.
if numberOfTerms >= 2
    coefficientNminus1 = 1/((numberOfTerms-1)*3^(numberOfTerms-1));
    coefficientN = 1/(numberOfTerms*3^numberOfTerms);
    ratioEstimate = abs(coefficientNminus1/coefficientN);
else
    ratioEstimate = NaN;
end

disp("Center = " + string(center))
disp("Exact radius = " + string(radius))
disp("Finite-n ratio estimate = " + string(ratioEstimate))
disp("Candidate endpoints: " + string(leftEndpoint) + ...
    " and " + string(rightEndpoint))
disp("Left endpoint x = -2: conditionally convergent (alternating harmonic).")
disp("Right endpoint x = 4: divergent (harmonic).")
disp("Interval of convergence: [-2, 4)")

figure
plot(n,leftPartialSums,'LineWidth',1.5)
hold on
plot(n,rightPartialSums,'LineWidth',1.5)
hold off
grid on
xlabel('number of terms')
ylabel('partial sum')
legend('x = -2','x = 4','Location','best')
title('Endpoint Partial Sums')
