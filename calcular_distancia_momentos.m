function p = calcular_distancia_momentos (CM, CA, FP)

%% Pie
p.pie_d.prox = CA.tobillo_d - CM.pie_d;
p.pie_i.prox = CA.tobillo_i - CM.pie_i;

p_plat_d = [FP.P2.CoPx, FP.P2.CoPy, zeros(size(FP.P2.CoPx,1), 1)];
p_plat_i = [FP.P1.CoPx, FP.P1.CoPy, zeros(size(FP.P1.CoPx,1), 1)];

p.pie_d.dist = p_plat_d - CM.pie_d;
p.pie_i.dist = p_plat_i - CM.pie_i;

%% Pierna
p.pierna_d.prox = CA.rodilla_d - CM.pierna_d;
p.pierna_i.prox = CA.rodilla_i - CM.pierna_i;

p.pierna_d.dist = CA.tobillo_d - CM.pierna_d;
p.pierna_i.dist = CA.tobillo_i - CM.pierna_i;

%% Muslo
p.muslo_d.prox = CA.cadera_d - CM.muslo_d;
p.muslo_i.prox = CA.cadera_i - CM.muslo_i;

p.muslo_d.dist = CA.rodilla_d - CM.muslo_d;
p.muslo_i.dist = CA.rodilla_i - CM.muslo_i;