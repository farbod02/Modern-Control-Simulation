% Constant values
A1 = 28; A3 = 28;
A2 = 32; A4 = 32;
a1 = 0.071; a3 = 0.71;
a2 = 0.057; a4 = 0.057;
k = 0.50;
v1 = 3; v2 = 3;
gamma = 0;
g = 981;

% Define the differential equations
f = @(t, h) [
    -(a1 / A1) * sqrt(2 * g * h(1)) + (a3 / A3) * sqrt(2 * g * h(3)) + (gamma * k * v1) / A1;
    -(a2 / A2) * sqrt(2 * g * h(2)) + (a4 / A4) * sqrt(2 * g * h(4)) + (gamma * k * v2) / A2;
    -(a3 / A3) * sqrt(2 * g * h(3)) + ((1 - gamma) * k * v2) / A3;
    -(a4 / A4) * sqrt(2 * g * h(4)) + ((1 - gamma) * k * v1) / A4
];

% Initial conditions
h0 = [12.4; 12.7; 1.8; 1.4];

% Solve the differential equations numerically
[tValues, hValues] = ode45(f, [0 100], h0);

% Extract the individual variables
h1Values = hValues(:, 1);
h2Values = hValues(:, 2);
h3Values = hValues(:, 3);
h4Values = hValues(:, 4);

% Plot the graphs
figure;
plot(tValues, h1Values, 'r', 'LineWidth', 2);
hold on;
plot(tValues, h2Values, 'g', 'LineWidth', 2);
plot(tValues, h3Values, 'b', 'LineWidth', 2);
plot(tValues, h4Values, 'm', 'LineWidth', 2);
legend('h1', 'h2', 'h3', 'h4');
xlabel('Time (seconds)');
ylabel('Value');
title('Graphs of h1, h2, h3, and h4');