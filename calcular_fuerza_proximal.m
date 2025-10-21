function f_proximal = calcular_fuerza_proximal(masa_seg, a_seg, f_distal, f_externa)

a_gravedad = zeros(522,3);
a_gravedad(:,3) = -9.8;

f_proximal = masa_seg * a_seg - f_distal - f_externa - masa_seg * a_gravedad;