function w = obtener_velocidad_angular (seg)

%% CALCULO LA DERIVADA DEL ANGULO EULER
der.alpha = diff([seg.alpha; seg.alpha(end)]) * 340; 
der.beta = diff([seg.beta; seg.beta(end)]) * 340;
der.gamma = diff([seg.gamma; seg.gamma(end)]) * 340;

%% CALCULO LA VELOCIDAD ANGULAR DEL SEGMENTO

wx = der.alpha .* sind(seg.beta) .* sind(seg.gamma) + der.beta .* cosd(seg.gamma);

wy = der.alpha .* sind(seg.beta) .* cosd(seg.gamma) - der.beta .* sind(seg.gamma);

wz = der.alpha .* cosd(seg.beta) + der.gamma;

w = [wx, wy, wz];