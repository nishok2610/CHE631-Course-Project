clc;
clear;

% Parameters
Ci = 2;          % Initial concentration (mol/L)
ki = 0.3;        % Initial rate constant (min^-1)
t = 0:0.1:15;    % Time vector (0 to 15 minutes)

% === No Catalyst Decay ===
% Analytical solution: CA = Ci * exp(-k * t)
CA_no_decay = Ci * exp(-ki * t);
X_no_decay = 1 - CA_no_decay / Ci;

% === With Catalyst Decay ===
% k(t) = ki * exp(-a*t)
% Integrated solution:
% CA = Ci * exp[-(ki/a)(1 - exp(-a*t))]
a = 1;  % decay constant
CA_decay = Ci * exp(-(ki/a) * (1 - exp(-a * t)));
X_decay = 1 - CA_decay / Ci;

% === Plotting ===
figure;
plot(t, X_no_decay, 'b-', 'LineWidth', 2, 'DisplayName', 'No Decay (Analytical)');
hold on;
plot(t, X_decay, 'r--', 'LineWidth', 2, 'DisplayName', 'With Decay (a = 1, Analytical)');

% Styling
title('Analytical Comparison: Catalyst Decay vs No Decay in Batch Reactor');
xlabel('Time (minutes)');
ylabel('Conversion, X');
legend('Location', 'southeast');
grid on;
xlim([0 15]);
ylim([0 1]);
set(gca, 'FontSize', 12);