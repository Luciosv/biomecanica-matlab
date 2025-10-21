function graficar_velocidades_angulares(W, Ciclo)

%% MUSLO
graficas(1,1).d = W.muslo_d.x;
graficas(1,1).i = W.muslo_i.x;
graficas(1,1).titulo = 'Angulo Muslo';
graficas(1,1).labelx = '% CM';
graficas(1,1).labely = '[°/s]';

graficas(1,2).d = W.muslo_d.y;
graficas(1,2).i = W.muslo_i.y;
graficas(1,2).titulo = 'Angulo Muslo';
graficas(1,2).labelx = '% CM';
graficas(1,2).labely = '[°/s]';

graficas(1,3).d = W.muslo_d.z;
graficas(1,3).i = W.muslo_i.z;
graficas(1,3).titulo = 'Angulo Muslo';
graficas(1,3).labelx = '% CM';
graficas(1,3).labely = '[°/s]';

%% PIERNA
graficas(2,1).d = W.pierna_d.x;
graficas(2,1).i = W.pierna_i.x;
graficas(2,1).titulo = 'Angulo Pierna';
graficas(2,1).labelx = '% CM';
graficas(2,1).labely = '[°/s]';

graficas(2,2).d = W.pierna_d.y;
graficas(2,2).i = W.pierna_i.y;
graficas(2,2).titulo = 'Angulo Pierna';
graficas(2,2).labelx = '% CM';
graficas(2,2).labely = '[°/s]';

graficas(2,3).d = W.pierna_d.z;
graficas(2,3).i = W.pierna_i.z;
graficas(2,3).titulo = 'Angulo Pierna';
graficas(2,3).labelx = '% CM';
graficas(2,3).labely = '[°/s]';

%% PIE
graficas(3,1).d = W.muslo_d.x;
graficas(3,1).i = W.muslo_i.x;
graficas(3,1).titulo = 'Angulo Pie';
graficas(3,1).labelx = '% CM';
graficas(3,1).labely = '[°/s]';

graficas(3,2).d = W.muslo_d.y;
graficas(3,2).i = W.muslo_i.y;
graficas(3,2).titulo = 'Angulo Pie';
graficas(3,2).labelx = '% CM';
graficas(3,2).labely = '[°/s]';

graficas(3,3).d = W.muslo_d.z;
graficas(3,3).i = W.muslo_i.z;
graficas(3,3).titulo = 'Angulo Pie';
graficas(3,3).labelx = '% CM';
graficas(3,3).labely = '[°/s]';

%% GRAFICO
graficar_ciclo(graficas, Ciclo)

end