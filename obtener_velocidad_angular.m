function w_seg = obtener_velocidad_angular (seg)

%% CALCULO LA DERIVADA DEL ANGULO EULER

der.alpha = diff([seg.alpha; seg.alpha(end)]) * 340;
der.beta = diff([seg.beta; seg.beta(end)]) * 340;
der.gamma = diff([seg.gamma; seg.gamma(end)]) * 340;

%% CALCULO LA VELOCIDAD ANGULAR DEL SEGMENTO

w_seg.x = der.alpha .* sind(seg.beta) .* sind(seg.gamma) + der.beta .* cosd(seg.gamma);

w_seg.y = der.alpha .* sind(seg.beta) .* cosd(seg.gamma) - der.beta .* sind(seg.gamma);

w_seg.z = der.alpha .* cosd(seg.beta) + der.gamma;