function AA = obtener_angulos_tobillo(pierna, pie)

normalize_vec = @(v) v ./ vecnorm(v, 2, 2);

%%
I_art = normalize_vec(cross(pierna.k, pie.i));

%%
signo = dot(I_art, pierna.j, 2);
signo = signo ./ abs(signo);

AA.alpha = - acosd(dot(I_art, pierna.i, 2)) .* signo;

%%
AA.beta = asind(dot(pierna.k, pie.i, 2));

%%
signo = dot(I_art, pie.k, 2);
signo = signo ./ abs(signo);

AA.gamma = acosd(dot(I_art, pie.j, 2)) .* signo;