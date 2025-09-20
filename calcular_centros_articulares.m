
% CALCULO DE LOS CENTROS ARTICULARES DEL MIEMBRO INFERIOR
% recibe los valores de los marcadores y la estructura de antropometria
% devuelve los centros articulares de cada parte

function [CA, VP] = calcular_centros_articulares(marcadores,antropometria)

normalize_vec = @(v) v ./ vecnorm(v, 2, 2);

%% CADERA

% CALCULO DE LOS VECTORES U, V, W 
v_pelvis = normalize_vec(marcadores.l_asis - marcadores.r_asis);


w_pelvis = normalize_vec(cross(marcadores.r_asis - marcadores.sacrum, ...
                               marcadores.l_asis - marcadores.sacrum));

u_pelvis = normalize_vec(cross(v_pelvis, w_pelvis));

VP.v_pelvis = v_pelvis;
VP.u_pelvis = u_pelvis;
VP.w_pelvis = w_pelvis;

% CALCULO DE LOS CENTROS ARTICULARES
A2 = antropometria.LONGITUD_ASIS.Valor / 100;

direccion = 0.598 * u_pelvis - 0.344 * v_pelvis - 0.29 * w_pelvis;
CA.cadera_d = marcadores.sacrum + A2 * direccion;

direccion = 0.598 * u_pelvis + 0.344 * v_pelvis - 0.29 * w_pelvis;
CA.cadera_i = marcadores.sacrum + A2 * direccion;


%% GRAFICA CADERA   
% pelvis
origenes = marcadores.sacrum;
vectores.u = u_pelvis;
vectores.v = v_pelvis;
vectores.w = w_pelvis;

% Configuración personalizada
config = struct( ...
    'ColorU', [1 0 0], ...
    'ColorV', [0 0.6 0], ...
    'ColorW', [0 0 1], ...
    'EtiquetaU', 'u\_pelvis', ...
    'EtiquetaV', 'v\_pelvis', ...
    'EtiquetaW', 'w\_pelvis', ...
    'Titulo', 'Vectores de la pelvis', ...
    'Frecuencia', 20, ...
    'MostrarOrigen', true);

% Llamada a la función
%graficar_vectores(origenes, vectores, config);

%% RODILLA

% CALCULO DE LOS VECTORES U, V, W
% DERECHA
v_rodilla_d = normalize_vec(marcadores.r_mall - marcadores.r_knee_1);


u_rodilla_d = normalize_vec(cross((marcadores.r_bar_2 - marcadores.r_knee_1), ...
                                  (marcadores.r_mall - marcadores.r_knee_1)));
                           
w_rodilla_d = normalize_vec(cross(u_rodilla_d, v_rodilla_d));


% IZQUIERDA
v_rodilla_i = normalize_vec(marcadores.l_mall - marcadores.l_knee_1);


u_rodilla_i = normalize_vec(cross((marcadores.l_mall - marcadores.l_knee_1), ... 
                 (marcadores.l_bar_2 - marcadores.l_knee_1)));

w_rodilla_i = normalize_vec(cross(u_rodilla_i, v_rodilla_i));


% CALCULO DE LOS CENTROS ARTICULARES

A11 = antropometria.DIAMETRO_RODILLA_DERECHA.Valor / 100;
CA.rodilla_d = marcadores.r_knee_1 + 0.5 * A11 * w_rodilla_d;

A12 = antropometria.DIAMETRO_RODILLA_IZQUIERDA.Valor / 100;
CA.rodilla_i = marcadores.l_knee_1 - 0.5 * A12 * w_rodilla_i;

%% GRAFICA RODILLAS   
% rodilla derecha
origenes = marcadores.r_knee_1;
vectores.u = u_rodilla_d;
vectores.v = v_rodilla_d;
vectores.w = w_rodilla_d;

% Configuración personalizada
config = struct( ...
    'ColorU', [1 0 0], ...
    'ColorV', [0 0.6 0], ...
    'ColorW', [0 0 1], ...
    'EtiquetaU', 'u\_rodilla D', ...
    'EtiquetaV', 'v\_rodilla D', ...
    'EtiquetaW', 'w\_rodilla D', ...
    'Titulo', 'Vectores de la rodilla D', ...
    'Frecuencia', 20, ...
    'MostrarOrigen', true);

% Llamada a la función
%graficar_vectores(origenes, vectores, config);

% rodilla izquierda
origenes = marcadores.l_knee_1;
vectores.u = u_rodilla_i;
vectores.v = v_rodilla_i;
vectores.w = w_rodilla_i;

% Configuración personalizada
config = struct( ...
    'ColorU', [1 0 0], ...
    'ColorV', [0 0.6 0], ...
    'ColorW', [0 0 1], ...
    'EtiquetaU', 'u\_rodilla I', ...
    'EtiquetaV', 'v\_rodilla I', ...
    'EtiquetaW', 'w\_rodilla I', ...
    'Titulo', 'Vectores de la rodilla I', ...
    'Frecuencia', 20, ...
    'MostrarOrigen', true);

% Llamada a la función
%graficar_vectores(origenes, vectores, config);

%% TOBILLO

% CALCULO DE LOS VECTORES U, V, W

% DERECHO
u_tobillo_d = normalize_vec(marcadores.r_met - marcadores.r_heel);


w_tobillo_d = normalize_vec(cross((marcadores.r_met - marcadores.r_mall), ... 
                                  (marcadores.r_heel - marcadores.r_mall)));
             
v_tobillo_d = normalize_vec(cross(w_tobillo_d,u_tobillo_d));

% IZQUIERDO
u_tobillo_i = normalize_vec(marcadores.l_met - marcadores.l_heel);


w_tobillo_i = normalize_vec(cross((marcadores.l_met - marcadores.l_mall), ... 
                                  (marcadores.l_heel - marcadores.l_mall)));

v_tobillo_i = normalize_vec(cross(w_tobillo_i,u_tobillo_i));


% CALCULO DE LOS CENTROS ARTICULARES
A13 = antropometria.LONGITUD_PIE_DERECHO.Valor / 100;
A15 = antropometria.ALTURA_MALEOLOS_DERECHO.Valor / 100;
A17 = antropometria.ANCHO_MALEOLOS_DERECHO.Valor / 100;
A19 = antropometria.ANCHO_PIE_DERECHO.Valor / 100;

CA.tobillo_d = marcadores.r_mall + 0.016 * A13 * u_tobillo_d + 0.392 * A15 * v_tobillo_d + 0.478 * A17 * w_tobillo_d;
CA.pie_d = marcadores.r_mall + 0.742 * A13 * u_tobillo_d + 1.074 * A15 * v_tobillo_d - 0.187 * A19 * w_tobillo_d;

A14 = antropometria.LONGITUD_PIE_IZQUIERDO.Valor / 100;
A16 = antropometria.ALTURA_MALEOLOS_IZQUIERDO.Valor / 100;
A18 = antropometria.ANCHO_MALEOLOS_IZQUIERDO.Valor / 100;
A20 = antropometria.ANCHO_PIE_IZQUIERDO.Valor / 100;

CA.tobillo_i = marcadores.l_mall + 0.016 * A14 * u_tobillo_i + 0.392 * A16 * v_tobillo_i - 0.478 * A18 * w_tobillo_i;
CA.pie_i = marcadores.l_mall + 0.742 * A14 * u_tobillo_i + 1.074 * A16 * v_tobillo_i + 0.187 * A20 * w_tobillo_i;

%% GRAFICA TOBILLOS
% tobillo derecha
origenes = marcadores.r_mall;
vectores.u = u_tobillo_d;
vectores.v = v_tobillo_d;
vectores.w = w_tobillo_d;

% Configuración personalizada
config = struct( ...
    'ColorU', [1 0 0], ...
    'ColorV', [0 0.6 0], ...
    'ColorW', [0 0 1], ...
    'EtiquetaU', 'u\_tobillo D', ...
    'EtiquetaV', 'v\_tobillo D', ...
    'EtiquetaW', 'w\_tobillo D', ...
    'Titulo', 'Vectores del tobillo D', ...
    'Frecuencia', 10, ...
    'MostrarOrigen', true);

% Llamada a la función
%graficar_vectores(origenes, vectores, config);

% tobillo izquierdo
origenes = marcadores.l_mall;
vectores.u = u_tobillo_i;
vectores.v = v_tobillo_i;
vectores.w = w_tobillo_i;

% Configuración personalizada
config = struct( ...
    'ColorU', [1 0 0], ...
    'ColorV', [0 0.6 0], ...
    'ColorW', [0 0 1], ...
    'EtiquetaU', 'u\_tobillo I', ...
    'EtiquetaV', 'v\_tobillo I', ...
    'EtiquetaW', 'w\_tobillo I', ...
    'Titulo', 'Vectores del tobillo I', ...
    'Frecuencia', 10, ...
    'MostrarOrigen', true);

% Llamada a la función
%graficar_vectores(origenes, vectores, config);