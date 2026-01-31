clc;
clear;
close all;

disp('--- RADIAL LOAD FLOW & FAULT ANALYSIS ---');

%% Base values
V_base = 11e3;      % 11 kV
S_base = 10e6;      % 10 MVA
Z_base = (V_base^2)/S_base;

%% Line data (Ohm)
R12 = 0.1; X12 = 0.2;
R23 = 0.08; X23 = 0.16;

Z12 = (R12 + 1j*X12)/Z_base;
Z23 = (R23 + 1j*X23)/Z_base;

%% Load data (pu)
S2 = 0.5 + 1j*0.3;
S3 = 0.6 + 1j*0.35;

%% Initial voltages
V1 = 1 + 0j;
V2 = 1 + 0j;
V3 = 1 + 0j;

%% Backward-Forward Sweep (1 iteration)
I3 = conj(S3/V3);
I2 = conj(S2/V2) + I3;

V2 = V1 - I2*Z12;
V3 = V2 - I3*Z23;

%% Display voltages
fprintf('\nBus Voltages (pu):\n');
fprintf('Bus 1 Voltage = %.4f pu\n', abs(V1));
fprintf('Bus 2 Voltage = %.4f pu\n', abs(V2));
fprintf('Bus 3 Voltage = %.4f pu\n', abs(V3));

%% Voltage plot
bus = [1 2 3];
Vmag = [abs(V1) abs(V2) abs(V3)];

figure;
plot(bus, Vmag,'-o','LineWidth',2);
xlabel('Bus Number');
ylabel('Voltage (pu)');
title('Voltage Profile of 3-Bus Radial System');
grid on;

%% Fault analysis (3-phase fault at Bus 3)
Z_fault = Z23;
I_fault = abs(V3/Z_fault);

Pickup_current = 1.5 * abs(I3);

fprintf('\nFault Analysis:\n');
fprintf('Fault Current at Bus 3 = %.2f A (pu based)\n', I_fault);
fprintf('Relay Pickup Current = %.2f A (pu based)\n', Pickup_current);

disp('--- END OF SIMULATION ---');
