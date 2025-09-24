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
graficar_vectores_con_posicion(CM.r_thigh_cg, SL.muslo_i.i, SL.muslo_i.j, SL.muslo_i.k);
graficar_vectores_con_posicion(CM.r_thigh_cg, SL.muslo_d.i, SL.muslo_d.j, SL.muslo_d.k);

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
graficar_angulos(AA.cadera_d, AA.cadera_i, Ciclo, 'Angulo Cadera');

graficar_angulos(AA.rodilla_d, AA.rodilla_i, Ciclo, 'Angulo Rodilla');

graficar_angulos(AA.tobillo_d, AA.tobillo_i, Ciclo, 'Angulo Tobillo');


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
graficar_velocidades_angulares(W.muslo_d, W.muslo_i, Ciclo, 'Angulo Muslo');

graficar_velocidades_angulares(W.pierna_d, W.pierna_i, Ciclo, 'Angulo Pierna');

graficar_velocidades_angulares(W.pie_d, W.pie_i, Ciclo, 'Angulo Pie');

%VectoresConFor(Datos); % Esta función sirve para calcular un vector entre dos puntos, 
% los asis izquierdo y derecho en el espacio 3D y lo grafica. También grafica solapado con ese mismo vector 
% en otro color  el vector convertido a versor unitario (1 metro de longitud)  
% asimismo  usando el producto cruz calcula un vector perpendicular a tres
% puntos sacro, asis izquierdo y derecho y de igual forma lo grafica en 3D
% como vector y como versor unitario en otro color se grafica en una
% segunda figura IMPORTANTE: Todo este código es usando bucles CON "for"
% para la graficación no se utiliza una función aparte lo que podría
% resultar conveniente
% IMPORTANTE2: tener en cuenta que esta escrita con los marcadores
% organizados en una estructura "Datos.Pasada.Marcadores.Crudos" esto puede
% haber definido usted que sea otra forma de estructura, debe adaptarla

%VectoresSinFor(Datos);% Esta función sirve para calcular un vector entre dos puntos, 
% los asis izquierdo y derecho en el espacio 3D y lo grafica. También grafica solapado con ese mismo vector 
% en otro color el vector convertido a versor unitario (1 metro de longitud)  
% asimismo, usando el producto cruz calcula un vector perpendicular a tres
% puntos sacro, asis izquierdo y derecho y de igual forma lo grafica en 3D
% como vector y como versor unitario en otro color se grafica en la misma
% figura. Finalmente calcula un tercer versor perpendicular a los dos
% anteriores lo que daría un sistema de tres versores ortonormles entre sí.
% Este tercer versor se grafica también todo en una misma figura.
% IMPORTANTE: Todo este código es usando "SIN" usar bucles con "for"
% esto requiere dos funciones adicionales para la graficación no se utiliza una función 
% aparte lo que podría resultar conveniente      
% IMPORTANTE2: tener en cuenta que esta escrita con los marcadores
% organizados en una estructura "Datos.Pasada.Marcadores.Crudos" esto puede
% haber definido usted que sea otra forma de estructura, debe adaptarla
