function AA = obtener_angulos_cadera(pelvis, muslo)

normalize_vec = @(v) v ./ vecnorm(v, 2, 2);

%% Calculo el I articular
I_art = normalize_vec(cross(pelvis.k, muslo.i));


%% Calculo de flexion extension
signo = dot(I_art, pelvis.i, 2);
signo = signo ./ abs(signo);

AA.alpha = acosd(dot(I_art, pelvis.j, 2)) .* signo;

%% Calculo de abduccion aduccion
AA.beta = asind(dot(pelvis.k, muslo.i, 2));

%% Calculo de rotaciones
signo = dot(I_art, muslo.k, 2);
signo = signo ./ abs(signo);

AA.gamma = - acosd(dot(I_art, muslo.j, 2)) .* signo;