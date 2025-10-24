function graficar_velocidades_angulares(W, Ciclo)

%% MUSLO
graficas(1,1).d = W.muslo_d(:,1);
graficas(1,1).i = W.muslo_i(:,1);
graficas(1,1).titulo = 'Angulo Muslo';
graficas(1,1).labelx = '% CM';
graficas(1,1).labely = '[°/s]';

graficas(1,2).d = W.muslo_d(:,2);
graficas(1,2).i = W.muslo_i(:,2);
graficas(1,2).titulo = 'Angulo Muslo';
graficas(1,2).labelx = '% CM';
graficas(1,2).labely = '[°/s]';

graficas(1,3).d = W.muslo_d(:,3);
graficas(1,3).i = W.muslo_i(:,3);
graficas(1,3).titulo = 'Angulo Muslo';
graficas(1,3).labelx = '% CM';
graficas(1,3).labely = '[°/s]';

%% PIERNA
graficas(2,1).d = W.pierna_d(:,1);
graficas(2,1).i = W.pierna_i(:,1);
graficas(2,1).titulo = 'Angulo Pierna';
graficas(2,1).labelx = '% CM';
graficas(2,1).labely = '[°/s]';

graficas(2,2).d = W.pierna_d(:,2);
graficas(2,2).i = W.pierna_i(:,2);
graficas(2,2).titulo = 'Angulo Pierna';
graficas(2,2).labelx = '% CM';
graficas(2,2).labely = '[°/s]';

graficas(2,3).d = W.pierna_d(:,3);
graficas(2,3).i = W.pierna_i(:,3);
graficas(2,3).titulo = 'Angulo Pierna';
graficas(2,3).labelx = '% CM';
graficas(2,3).labely = '[°/s]';

%% PIE
graficas(3,1).d = W.muslo_d(:,1);
graficas(3,1).i = W.muslo_i(:,1);
graficas(3,1).titulo = 'Angulo Pie';
graficas(3,1).labelx = '% CM';
graficas(3,1).labely = '[°/s]';

graficas(3,2).d = W.muslo_d(:,2);
graficas(3,2).i = W.muslo_i(:,2);
graficas(3,2).titulo = 'Angulo Pie';
graficas(3,2).labelx = '% CM';
graficas(3,2).labely = '[°/s]';

graficas(3,3).d = W.muslo_d(:,3);
graficas(3,3).i = W.muslo_i(:,3);
graficas(3,3).titulo = 'Angulo Pie';
graficas(3,3).labelx = '% CM';
graficas(3,3).labely = '[°/s]';

%% GRAFICO
graficar_ciclo(graficas, Ciclo)

end