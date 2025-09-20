function SL = obtener_sistemas_locales(VP, CA, marcadores)

normalize_vec = @(v) v ./ vecnorm(v, 2, 2);

%% Sistema Local Pelvis

SL.pelvis.i = VP.w_pelvis;
SL.pelvis.j = VP.u_pelvis;
SL.pelvis.k = VP.v_pelvis;


%% Sistema Local Muslo

% DERECHO
SL.muslo_d.i = normalize_vec(CA.cadera_d - CA.rodilla_d);


SL.muslo_d.j = normalize_vec(cross((marcadores.r_bar_1 - CA.cadera_d), ...
                                   (CA.rodilla_d - CA.cadera_d)));

SL.muslo_d.k = cross(SL.muslo_d.i, SL.muslo_d.j);


% IZQUIERDO
SL.muslo_i.i = normalize_vec(CA.cadera_i - CA.rodilla_i);


SL.muslo_i.j = normalize_vec(cross((CA.rodilla_i - CA.cadera_i), ...
                                   (marcadores.l_bar_1 - CA.cadera_i)));

SL.muslo_i.k = cross(SL.muslo_i.i, SL.muslo_i.j);

%% Sistema Local Pierna

% DERECHA
SL.pierna_d.i = normalize_vec(CA.rodilla_d - CA.tobillo_d);


SL.pierna_d.j = normalize_vec(cross((marcadores.r_knee_1 - CA.rodilla_d), ...
                                    (CA.tobillo_d - CA.rodilla_d), 2));

SL.pierna_d.k = cross(SL.pierna_d.i, SL.pierna_d.j, 2);


% IZQUIERDA
SL.pierna_i.i = normalize_vec(CA.rodilla_i - CA.tobillo_i);


SL.pierna_i.j = normalize_vec(cross((CA.tobillo_i - CA.rodilla_i), ...
                                    (marcadores.l_knee_1 - CA.rodilla_i), 2));

SL.pierna_i.k = cross(SL.pierna_i.i, SL.pierna_i.j, 2);

%% Sistema Local Pie

% DERECHO
SL.pie_d.i = normalize_vec(marcadores.r_heel - CA.pie_d);


SL.pie_d.k = normalize_vec(cross((CA.tobillo_d - marcadores.r_heel), ...
                                 (CA.pie_d - marcadores.r_heel), 2));

SL.pie_d.j = cross(SL.pie_d.k, SL.pie_d.i, 2);

% IZQUIERDO
SL.pie_i.i = normalize_vec(marcadores.l_heel - CA.pie_i);


SL.pie_i.k = normalize_vec(cross((CA.tobillo_i - marcadores.l_heel), ...
                                 (CA.pie_i - marcadores.l_heel), 2));

SL.pie_i.j = cross(SL.pie_i.k, SL.pie_i.i, 2);


end