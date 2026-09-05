%% Interactive MATLAB Lab 9.2: Ordinary Points
% Equation:
% (1+x^2)y'' + x y' - y = 0
%
% In a Live Script, turn center into a slider or numeric control.

center = 0;

% Singularities occur where the leading coefficient 1+x^2 vanishes.
singularPoints = roots([1 0 1]);

distances = abs(center-singularPoints);
guaranteedRadius = min(distances);

leadingCoefficientAtCenter = 1 + center^2;
ordinaryAtCenter = abs(leadingCoefficientAtCenter) > 1e-12;

disp("Singular points:")
disp(singularPoints)
disp("Expansion center = " + string(center))
disp("Ordinary at the selected real center:")
disp(ordinaryAtCenter)
disp("Distances from center to singularities:")
disp(distances)
disp("Guaranteed radius = " + string(guaranteedRadius))

figure
plot(real(singularPoints),imag(singularPoints),'x', ...
    'MarkerSize',10,'LineWidth',1.8)
hold on
plot(center,0,'o','MarkerSize',8,'LineWidth',1.5)

theta = linspace(0,2*pi,500);
plot(center + guaranteedRadius*cos(theta), ...
     guaranteedRadius*sin(theta),'--','LineWidth',1.2)

hold off
axis equal
grid on
xlabel('Real part')
ylabel('Imaginary part')
legend('singularities','series center','guaranteed-radius circle', ...
    'Location','best')
title('Nearest Complex Singularities and Guaranteed Radius')
