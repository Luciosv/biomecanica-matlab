function AE = obtener_angulos_euler(i, j, k)

normalize_vec = @(v) v ./ vecnorm(v, 2, 2);

%% genero los I, J, K
frames = size(i, 1);

I = zeros(frames, 3);
I(:, 1) = 1;

J = zeros(frames, 3);
J(:, 2) = 1;

K = zeros(frames, 3);
K(:, 3) = 1;

%% Obtengo la linea de nodos (LN)

LN = normalize_vec(cross(K, k));

%% Calculo alpha

signo = dot(J, LN, 2);
signo = signo ./ abs(signo);

AE.alpha = acos(dot(I, LN, 2)) .* signo;

%% Calculo beta

AE.beta = acos(dot(K, k, 2));

%% Calculo gamma

signo = dot(j, LN, 2);
signo = signo ./ abs(signo);

AE.gamma = - acos(dot(i, LN, 2)) .* signo;

%% ARREGLO LAS DISCONTINUIDADES

AE.alpha = rad2deg(unwrap(AE.alpha));
AE.beta = rad2deg(unwrap(AE.beta));
AE.gamma = rad2deg(unwrap(AE.gamma));