function graficar_velocidades_angulares(Wd, Wi, Ciclo, title_graph)
%% Graficación de reporte de múltiples ángulos
% Calcular los índices ajustados para tus arrays
% Los arrays empiezan en (PrimerFrame - AntesHS)
offset = Ciclo.PrimerFrame - Ciclo.AntesHS;

% Ajustar los índices de eventos para que coincidan con tus arrays
RHS1_idx = Ciclo.FrameRHS1 - offset;
RHS2_idx = Ciclo.FrameRHS2 - offset;
LHS1_idx = Ciclo.FrameLHS1 - offset;
LHS2_idx = Ciclo.FrameLHS2 - offset;
RTO_idx = Ciclo.FrameRTO - offset;
LTO_idx = Ciclo.FrameLTO - offset;

%% Extraer ángulos de cada ciclo
ciclo_x_d = Wd.x(RHS1_idx:RHS2_idx);
ciclo_x_i = Wi.x(LHS1_idx:LHS2_idx);
ciclo_y_d = Wd.y(RHS1_idx:RHS2_idx);
ciclo_y_i = Wi.y(LHS1_idx:LHS2_idx);
ciclo_z_d = Wd.z(RHS1_idx:RHS2_idx);
ciclo_z_i = Wi.z(LHS1_idx:LHS2_idx);

%% Calculo los valores necesarios en frames

% Calcular duración de ciclos (en frames originales, no en índices)
ciclo_der = Ciclo.FrameRHS2 - Ciclo.FrameRHS1;
ciclo_izq = Ciclo.FrameLHS2 - Ciclo.FrameLHS1;

% Calcular porcentajes de toe off
desp_der = round((Ciclo.FrameRTO - Ciclo.FrameRHS1)/ciclo_der*100);
desp_izq = round((Ciclo.FrameLTO - Ciclo.FrameLHS1)/ciclo_izq*100);

% Definir posiciones de líneas de referencia
x_RTO = desp_der;
x_LTO = desp_izq;

%% Grafico
% Generar gráfico con 1x3 subplots
figure('Position', [0, 0, 1080/2, 1080/2]);

% Subplot 1: Ángulo Alpha (Flexión/Extensión)
subplot(1,3,1);
plot(InterpolaA100Muestras(ciclo_x_d), 'g', 'LineWidth', 2);
hold on;
plot(InterpolaA100Muestras(ciclo_x_i), 'r', 'LineWidth', 2);
line([x_RTO x_RTO], ylim, 'LineStyle', '--', 'Color', 'red', 'LineWidth', 1.5);
line([x_LTO x_LTO], ylim, 'LineStyle', '--', 'Color', 'green', 'LineWidth', 1.5);
hold off;
title(title_graph, 'FontSize', 12, 'FontWeight', 'bold');
xlabel('% CM');
ylabel('[°/s]');
grid on;
xlim([0 100]);

% Subplot 2: Ángulo Beta (Abducción/Aducción)
subplot(1,3,2);
plot(InterpolaA100Muestras(ciclo_y_d), 'g', 'LineWidth', 2);
hold on;
plot(InterpolaA100Muestras(ciclo_y_i), 'r', 'LineWidth', 2);
line([x_RTO x_RTO], ylim, 'LineStyle', '--', 'Color', 'red', 'LineWidth', 1.5);
line([x_LTO x_LTO], ylim, 'LineStyle', '--', 'Color', 'green', 'LineWidth', 1.5);
hold off;
title(title_graph, 'FontSize', 12, 'FontWeight', 'bold');
xlabel('% CM');
ylabel('[°/s]');
grid on;
xlim([0 100]);

% Subplot 3: Ángulo Gamma (Rotación)
subplot(1,3,3);
plot(InterpolaA100Muestras(ciclo_z_d), 'g', 'LineWidth', 2);
hold on;
plot(InterpolaA100Muestras(ciclo_z_i), 'r', 'LineWidth', 2);
line([x_RTO x_RTO], ylim, 'LineStyle', '--', 'Color', 'red', 'LineWidth', 1.5);
line([x_LTO x_LTO], ylim, 'LineStyle', '--', 'Color', 'green', 'LineWidth', 1.5);
hold off;
title(title_graph, 'FontSize', 12, 'FontWeight', 'bold');
xlabel('% CM');
ylabel('[°/s]');
grid on;
xlim([0 100]);

% Agregar leyenda general
sgtitle('Análisis de Velocidades Angulares', 'FontSize', 14, 'FontWeight', 'bold');

end