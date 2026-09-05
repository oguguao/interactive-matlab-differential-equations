%% Interactive MATLAB Lab 1.3: Order and Degree Explorer
% In a Live Script, turn "choice" into a drop-down control.

choice = 1;   % Choose an integer from 1 through 6.

equations = [
    "y' + 4y = 7"
    "y'' - 3y' + 5y = 0"
    "(y'')^3 + y = x"
    "(y''')^2 + (y')^5 = x"
    "y'''' - 2y'' + y = x"
    "sin(y'') + y = 0"
];

orders = [1 2 2 3 4 2];

degrees = [
    "1"
    "1"
    "3"
    "2"
    "1"
    "Not defined"
];

explanations = [
    "The highest derivative is y', and it occurs to the first power."
    "The highest derivative is y'', and it occurs to the first power."
    "The highest derivative is y'', and it is raised to the third power."
    "The third derivative is highest; its exponent is 2."
    "The fourth derivative is highest and occurs to the first power."
    "The second derivative occurs inside sine, so the equation is not polynomial in its derivatives."
];

disp("Differential Equation")
disp(equations(choice))
disp("Order: " + string(orders(choice)))
disp("Degree: " + degrees(choice))
disp("Explanation:")
disp(explanations(choice))

if degrees(choice) == "Not defined"
    disp("The degree is NOT defined.")
else
    disp("The degree is defined for this equation.")
end
