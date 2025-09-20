function graficar_vectores_con_posicion(p, v1, v2, v3)
% graficar_tres_vectores - Grafica tres vectores 3D desde un punto común cada 10 frames
%
% Parámetros:
%   p   - Nx3 matriz con coordenadas del punto de origen en cada frame
%   v1  - Nx3 matriz con componentes del primer vector
%   v2  - Nx3 matriz con componentes del segundo vector
%   v3  - Nx3 matriz con componentes del tercer vector

    % Inicializar figura
    figure;
    hold on;
    grid on;
    axis equal;
    view(3);
    title('Visualización de vectores v1, v2, v3');
    xlabel('X (m)');
    ylabel('Y (m)');
    zlabel('Z (m)');

    nframes = size(p, 1);

    for i = 1:20:nframes
        origen = p(i, :);

        % Punto de origen
        plot3(origen(1), origen(2), origen(3), 'ko', 'MarkerSize', 4);

        % Vector v1 (rojo)
        quiver3(origen(1), origen(2), origen(3), ...
                v1(i,1), v1(i,2), v1(i,3), ...
                'r', 'LineWidth', 2, 'MaxHeadSize', 0.3);

        % Vector v2 (verde)
        quiver3(origen(1), origen(2), origen(3), ...
                v2(i,1), v2(i,2), v2(i,3), ...
                'g', 'LineWidth', 2, 'MaxHeadSize', 0.3);

        % Vector v3 (azul)
        quiver3(origen(1), origen(2), origen(3), ...
                v3(i,1), v3(i,2), v3(i,3), ...
                'b', 'LineWidth', 2, 'MaxHeadSize', 0.3);
    end

    % Leyenda única
    legend({'Origen', 'v1', 'v2', 'v3'}, 'Location', 'best');
end