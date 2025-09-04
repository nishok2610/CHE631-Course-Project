% Catalyst Decay in a Batch Reactor
% Using Analytical Solution with Second-Order Deactivation by Sintering

clc;
clear;

% Dimensionless time
theta = linspace(0, 5, 300);

% Decay parameter alpha = kd/k
alpha_values = [0, 0.2, 0.5, 1.0];

% Prepare figure
figure;
hold on;

% Plot for each alpha
for i = 1:length(alpha_values)
    alpha = alpha_values(i);
    if alpha == 0
        X = 1 - exp(-theta);  % No decay
        label = 'No Decay (\alpha = 0)';
    else
        X = 1 - (1 + alpha * theta).^(-1 / alpha);  % With decay
        label = sprintf('\\alpha = %.1f', alpha);
    end
    plot(theta, X, 'LineWidth', 2, 'DisplayName', label);
end

% Graph styling
title('Effect of Catalyst Decay on Conversion in a Batch Reactor');
xlabel('Dimensionless Time (\Theta = k_dt)');
ylabel('Conversion (X)');
legend('Location', 'southeast');
grid on;
xlim([0 5]);
ylim([0 1]);
set(gca, 'FontSize', 12);