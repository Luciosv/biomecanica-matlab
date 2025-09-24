function graficar_angulos(AA_d, AA_i, Ciclo, title_graph)
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
ciclo_alpha_d = AA_d.alpha(RHS1_idx:RHS2_idx);
ciclo_alpha_i = AA_i.alpha(LHS1_idx:LHS2_idx);
ciclo_beta_d = AA_d.beta(RHS1_idx:RHS2_idx);
ciclo_beta_i = AA_i.beta(LHS1_idx:LHS2_idx);
ciclo_gamma_d = AA_d.gamma(RHS1_idx:RHS2_idx);
ciclo_gamma_i = AA_i.gamma(LHS1_idx:LHS2_idx);

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
plot(InterpolaA100Muestras(ciclo_alpha_d), 'g', 'LineWidth', 2);
hold on;
plot(InterpolaA100Muestras(ciclo_alpha_i), 'r', 'LineWidth', 2);
line([x_RTO x_RTO], ylim, 'LineStyle', '--', 'Color', 'red', 'LineWidth', 1.5);
line([x_LTO x_LTO], ylim, 'LineStyle', '--', 'Color', 'green', 'LineWidth', 1.5);
hold off;
title(title_graph, 'FontSize', 12, 'FontWeight', 'bold');
xlabel('% CM');
ylabel('Flex(+)/Ext(-)');
grid on;
xlim([0 100]);

% Subplot 2: Ángulo Beta (Abducción/Aducción)
subplot(1,3,2);
plot(InterpolaA100Muestras(ciclo_beta_d), 'g', 'LineWidth', 2);
hold on;
plot(InterpolaA100Muestras(ciclo_beta_i), 'r', 'LineWidth', 2);
line([x_RTO x_RTO], ylim, 'LineStyle', '--', 'Color', 'red', 'LineWidth', 1.5);
line([x_LTO x_LTO], ylim, 'LineStyle', '--', 'Color', 'green', 'LineWidth', 1.5);
hold off;
title(title_graph, 'FontSize', 12, 'FontWeight', 'bold');
xlabel('% CM');
ylabel('Abd(+)/Add(-)');
grid on;
xlim([0 100]);

% Subplot 3: Ángulo Gamma (Rotación)
subplot(1,3,3);
plot(InterpolaA100Muestras(ciclo_gamma_d), 'g', 'LineWidth', 2);
hold on;
plot(InterpolaA100Muestras(ciclo_gamma_i), 'r', 'LineWidth', 2);
line([x_RTO x_RTO], ylim, 'LineStyle', '--', 'Color', 'red', 'LineWidth', 1.5);
line([x_LTO x_LTO], ylim, 'LineStyle', '--', 'Color', 'green', 'LineWidth', 1.5);
hold off;
title(title_graph, 'FontSize', 12, 'FontWeight', 'bold');
xlabel('% CM');
ylabel('Rotint(+)/Rotext(-)');
grid on;
xlim([0 100]);

% Agregar leyenda general
sgtitle('Análisis de Ángulos Articulares', 'FontSize', 14, 'FontWeight', 'bold');

end