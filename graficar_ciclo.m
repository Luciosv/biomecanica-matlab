function graficar_ciclo(graficas, Ciclo)

%% ==========================
%  Cálculo de frames y offsets
%  ===========================

offset = Ciclo.PrimerFrame - Ciclo.AntesHS;

% Ajustar índices de eventos
RHS1_idx = Ciclo.FrameRHS1 - offset;
RHS2_idx = Ciclo.FrameRHS2 - offset;
LHS1_idx = Ciclo.FrameLHS1 - offset;
LHS2_idx = Ciclo.FrameLHS2 - offset;
RTO_idx  = Ciclo.FrameRTO  - offset;
LTO_idx  = Ciclo.FrameLTO  - offset;

% Duraciones de ciclo
ciclo_der = Ciclo.FrameRHS2 - Ciclo.FrameRHS1;
ciclo_izq = Ciclo.FrameLHS2 - Ciclo.FrameLHS1;

% Toe-off en porcentaje
desp_der = round((Ciclo.FrameRTO - Ciclo.FrameRHS1)/ciclo_der*100);
desp_izq = round((Ciclo.FrameLTO - Ciclo.FrameLHS1)/ciclo_izq*100);

x_RTO = desp_der;
x_LTO = desp_izq;

%% ==========================
%  Gráficas múltiples
%  ===========================

[nRows, nCols] = size(graficas);
figure('Position', [100, 100, 1080, 720]);
t = tiledlayout(nRows, nCols, 'TileSpacing','compact', 'Padding','compact');

for r = 1:nRows
    for c = 1:nCols
        nexttile;
        
        % Datos derecho e izquierdo
        ciclo_x_d = graficas(r,c).d(RHS1_idx:RHS2_idx);
        ciclo_x_i = graficas(r,c).i(LHS1_idx:LHS2_idx);

        % Interpolación (usa tu función)
        y_d = InterpolaA100Muestras(ciclo_x_d);
        y_i = InterpolaA100Muestras(ciclo_x_i);

        % Graficar curvas
        plot(y_d, 'g', 'LineWidth', 1.8); hold on;
        plot(y_i, 'r', 'LineWidth', 1.8);

        % Líneas de eventos
        line([x_RTO x_RTO], ylim, 'LineStyle', '--', 'Color', 'r', 'LineWidth', 1);
        line([x_LTO x_LTO], ylim, 'LineStyle', '--', 'Color', 'g', 'LineWidth', 1);

        % Etiquetas
        title(graficas(r,c).titulo, 'FontSize', 11, 'FontWeight', 'bold');
        xlabel(graficas(r,c).labelx, 'FontSize', 9);
        ylabel(graficas(r,c).labely, 'FontSize', 9);

        grid on;
        xlim([0 100]);
        hold off;
    end
end
