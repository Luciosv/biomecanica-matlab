clearvars
close all
clc

[Datos,Archivo]=CargarRegistro();% El llamado a esta función permite cargar el archivo c3d. AHORA tiene la ventaja que los archivos pueden estar en cualquier carpeta del rígido 
                                                                  % y no hace falta cambiar de directorio. Este cambio permite conservar la ruta y el nombre del archivo y mantener el directorio actual sin mover.
                                                                  % esta función no requiere ningun parámetro de ida y regresa con parámtros:
                                                                  % "Datos" donde está toda la estructura del registro y 
                                                                  %"Archivo" que es solamente el nombre del archivo que permite ver en el workspace el archivo sobre el que estoy trabajando

 
Ciclo = Ciclo2Pasos(Datos);
% La función "Ciclo2Pasos" Recibe como parámetro la estuctura de "Datos"
% completa no la modifica, pero si devuelve los parametros convertidos en
% frame (cuadros) en los que se producen los eventos de apoyo del taón y
%  despegue de la punta del pie que permiten recortar los datos de cada
%  ciclo ixquierdo y derecho. Además se indica en "DerechaPlataforma1" con
%  una variable booleana si pisa primero con el pie derecho


Ciclo.AntesHS=10; % es es parametro de cuantos datos antes de el primer contacto del pie 
%que pisa primero se inicia el recorte de los datos para pasar
% como parámetro a la función "RecortaDatos"
Ciclo.DespuesHS=10;
% es es parametro de cuantos datos despues del segundo contacto del pie 
% que pisa en  segundo término se inicia el recorte de los datos para pasar
% como parámetro a la función "RecortaDatos"
Datos=RecortaDatos(Datos, Ciclo.PrimerFrame - Ciclo.AntesHS, Ciclo.UltimoFrame + Ciclo.DespuesHS);
% esta función recorta los datos a un paso de ambos pies + la cantidad de
% datos definidas por "AntesHS" y "DespuesHS" 
% IMPORTANTE: tener en cuenta que esta escrita con los marcadores
% organizados en una estructura "Datos.Pasada.Marcadores.Crudos" esto puede
% haber definido usted que sea otra forma de estructura, debe adaptarla


%% -------------------- FILTRAR MARCADORES --------------------
fm = Datos.Pasada.Marcadores.Crudos.Frecuencia;
frec_corte = 10;
orden = 4;

Datos=Filtrar_Marcadores(Datos,fm,frec_corte,orden);
% Habia 2 filas de NaN en l_thigh, lo arreglé tomando 2 valores menos en el
% recorte anterior.


%% -------------------- CALCULO DE LOS CENTROS ARTICULARES --------------------

[CA, VP] = calcular_centros_articulares(Datos.Pasada.Marcadores.Filtrados.Valores, Datos.antropometria);


%% -------------------- CALCULO DE LOS SISTEMAS LOCALES --------------------

SL = obtener_sistemas_locales(VP, CA, Datos.Pasada.Marcadores.Filtrados.Valores);


%% -------------------- CALCULO DE LOS CENTROS DE MASA --------------------

p_r_heel = Datos.Pasada.Marcadores.Filtrados.Valores.r_heel;
p_l_heel = Datos.Pasada.Marcadores.Filtrados.Valores.l_heel;
CM = calcular_centros_masa(CA, p_r_heel, p_l_heel);

% grafica i,j,k
graficar_vectores_con_posicion(CM.muslo_d, SL.muslo_i.i, SL.muslo_i.j, SL.muslo_i.k);
graficar_vectores_con_posicion(CM.muslo_d, SL.muslo_d.i, SL.muslo_d.j, SL.muslo_d.k);

p = Datos.Pasada.Marcadores.Filtrados.Valores.sacrum;
%graficar_vectores_con_posicion(p, SL.pelvis.i, SL.pelvis.j, SL.pelvis.k);

%graficar_vectores_con_posicion(CM.l_foot_cg, SL.pie_i.i, SL.pie_i.j, SL.pie_i.k);


%% -------------------- CALCULO DE LOS ANGULOS ARTICULARES --------------------
AA.cadera_d = obtener_angulos_cadera(SL.pelvis, SL.muslo_d, 'd');
AA.cadera_i = obtener_angulos_cadera(SL.pelvis, SL.muslo_i, 'i');

AA.rodilla_d = obtener_angulos_rodilla(SL.muslo_d, SL.pierna_d, 'd');
AA.rodilla_i = obtener_angulos_rodilla(SL.muslo_i, SL.pierna_i, 'i');

AA.tobillo_d = obtener_angulos_tobillo(SL.pierna_d, SL.pie_d, 'd');
AA.tobillo_i = obtener_angulos_tobillo(SL.pierna_i, SL.pie_i, 'i');

%% -------------------- GRAFICACION DE LOS ANGULOS ARTICULARES --------------------
%graficar_angulos(AA.cadera_d, AA.cadera_i, Ciclo, 'Angulo Cadera');

%graficar_angulos(AA.rodilla_d, AA.rodilla_i, Ciclo, 'Angulo Rodilla');

%graficar_angulos(AA.tobillo_d, AA.tobillo_i, Ciclo, 'Angulo Tobillo');


%% -------------------- CALCULAR LOS ANGULOS DE EULER --------------------
AE.pelvis = obtener_angulos_euler(SL.pelvis.i, SL.pelvis.j, SL.pelvis.k);

AE.muslo_d = obtener_angulos_euler(SL.muslo_d.i, SL.muslo_d.j, SL.muslo_d.k);
AE.muslo_i = obtener_angulos_euler(SL.muslo_i.i, SL.muslo_i.j, SL.muslo_i.k);

AE.pierna_d = obtener_angulos_euler(SL.pierna_d.i, SL.pierna_d.j, SL.pierna_d.k);
AE.pierna_i = obtener_angulos_euler(SL.pierna_i.i, SL.pierna_i.j, SL.pierna_i.k);

AE.pie_d = obtener_angulos_euler(SL.pie_d.i, SL.pie_d.j, SL.pie_d.k);
AE.pie_i = obtener_angulos_euler(SL.pie_i.i, SL.pie_i.j, SL.pie_i.k);


%% -------------------- CALCULAR LAS VELOCIDADES ANGULARES --------------------
W.pelvis = obtener_velocidad_angular(AE.pelvis);

W.muslo_d = obtener_velocidad_angular(AE.muslo_d);
W.muslo_i = obtener_velocidad_angular(AE.muslo_i);

W.pierna_d = obtener_velocidad_angular(AE.pierna_d);
W.pierna_i = obtener_velocidad_angular(AE.pierna_i);

W.pie_d = obtener_velocidad_angular(AE.pie_d);
W.pie_i = obtener_velocidad_angular(AE.pie_i);

%% -------------------- GRAFICAR LAS VELOCIDADES ANGULARES --------------------

graficar_velocidades_angulares(W, Ciclo);

%% -------------------- CALCULAR MATRICES DE INERCIA --------------------
MI.pie = zeros(3,3);
MI.pierna = zeros(3,3);
MI.muslo = zeros(3,3);

x = [Datos.antropometria.PESO.Valor, Datos.antropometria.ALTURA.Valor];

% Para el eje antero-posterior (VERSOR J)
MI.pie(2,2) = calcular_parametro_ecZS([-100, 0.480, 0.626], x);
MI.pierna(2,2) = calcular_parametro_ecZS([-1105, 4.59, 6.63], x);
MI.muslo(2,2) = calcular_parametro_ecZS([-3557, 31.7, 18.61], x);

% Para el eje medial-lateral (VERSOR K)
MI.pie(3,3) = calcular_parametro_ecZS([-97.09, 0.414, 0.614], x);
MI.pierna(3,3) = calcular_parametro_ecZS([-1152, 4.594, 6.815], x);
MI.muslo(3,3) = calcular_parametro_ecZS([-3690, 32.02, 19.24], x);

% Para el eje longitudinal (VERSOR I)
MI.pie(1,1) = calcular_parametro_ecZS([-15.48, 0.144, 0.088], x);
MI.pierna(1,1) = calcular_parametro_ecZS([-70.5, 1.134, 0.3], x);
MI.muslo(1,1) = calcular_parametro_ecZS([-13.5, 11.3, -2.28], x);

% Divido todo por 100^2 para pasar de Kg * cm^2 a Kg * m^2
MI.pie = MI.pie ./ 100^2;
MI.pierna = MI.pierna ./ 100^2;
MI.muslo = MI.muslo ./ 100^2;

%% -------------------- CALCULAR MASAS DE LOS SEGMENTOS --------------------
MS.pie = calcular_parametro_ecZS([-0.829, 0.0077, 0.0073], x);
MS.pierna = calcular_parametro_ecZS([-1.592, 0.0362, 0.0121], x);
MS.muslo = calcular_parametro_ecZS([-2.649, 0.1463, 0.0137], x);

%% -------------------- CALCULAR LAS ACELERACIONES LINEALES A PARTIR DE LOS CENTROS DE MASA --------------------
aCM.muslo_d = calcular_derivada(calcular_derivada(CM.muslo_d,fm),fm);
aCM.muslo_i = calcular_derivada(calcular_derivada(CM.muslo_i,fm),fm);

aCM.pierna_d = calcular_derivada(calcular_derivada(CM.pierna_d,fm),fm);
aCM.pierna_i = calcular_derivada(calcular_derivada(CM.pierna_i,fm),fm);

aCM.pie_d = calcular_derivada(calcular_derivada(CM.pie_d,fm),fm);
aCM.pie_i = calcular_derivada(calcular_derivada(CM.pie_i,fm),fm);

%% -------------------- CALCULAR FUERZAS ARTICULARES --------------------
FP = recortar_datos_plataforma(Datos,Ciclo);

fuerza_externa_d = [FP.P2.Fx, FP.P2.Fy, FP.P2.Fz];
fuerza_externa_i = [FP.P1.Fx, FP.P1.Fy, FP.P1.Fz];

fuerza_distal = zeros(522,3);

FA.tobillo_d = calcular_fuerza_proximal(MS.pie, aCM.pie_d, fuerza_distal, fuerza_externa_d);
FA.tobillo_i = calcular_fuerza_proximal(MS.pie, aCM.pie_i, fuerza_distal, fuerza_externa_i);

FA.rodilla_d = calcular_fuerza_proximal(MS.pierna, aCM.pierna_d, -FA.tobillo_d, zeros(522,3));
FA.rodilla_i = calcular_fuerza_proximal(MS.pierna, aCM.pierna_i, -FA.tobillo_i, zeros(522,3));

FA.cadera_d = calcular_fuerza_proximal(MS.muslo, aCM.muslo_d, -FA.rodilla_d, zeros(522,3));
FA.cadera_i = calcular_fuerza_proximal(MS.muslo, aCM.muslo_i, -FA.rodilla_i, zeros(522,3));

%% -------------------- GRAFICAR FUERZAS ARTICULARES --------------------
% primero paso a los planos anatomicos con los versores k proximal, i
% distal y Iart (k x i)

FAanat.tobillo_d = pasar_a_plano_anatomico(FA.tobillo_d, SL.pie_d.i, SL.pierna_d.k);
FAanat.tobillo_i = pasar_a_plano_anatomico(FA.tobillo_i, SL.pie_i.i, SL.pierna_i.k);

FAanat.rodilla_d = pasar_a_plano_anatomico(FA.rodilla_d, SL.pierna_d.i, SL.muslo_d.k);
FAanat.rodilla_i = pasar_a_plano_anatomico(FA.rodilla_i, SL.pierna_i.i, SL.muslo_i.k);

FAanat.cadera_d = pasar_a_plano_anatomico(FA.cadera_d, SL.muslo_d.i, SL.pelvis.k);
FAanat.cadera_i = pasar_a_plano_anatomico(FA.cadera_i, SL.muslo_i.i, SL.pelvis.k);

graficar_fuerzas_articulares(FAanat, Ciclo);

