function AA = obtener_angulos_rodilla(muslo, pierna, lado)

normalize_vec = @(v) v ./ vecnorm(v, 2, 2);

%%
I_art = normalize_vec(cross(muslo.k, pierna.i));

%%
signo = dot(I_art, muslo.i, 2);
signo = signo ./ abs(signo);

AA.alpha = - acosd(dot(I_art, muslo.j, 2)) .* signo;

%%
AA.beta = asind(dot(muslo.k, pierna.i, 2));

if (lado == 'i'), AA.beta = -AA.beta; end

%%
signo = dot(I_art, pierna.k, 2);
signo = signo ./ abs(signo);

AA.gamma = - acosd(dot(I_art, pierna.j, 2)) .* signo;

if (lado == 'i'), AA.gamma = -AA.gamma; end