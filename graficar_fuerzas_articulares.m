function graficar_fuerzas_articulares(FA, Ciclo)

%% CADERA
graficas(1,1).d = FA.cadera_d(:,1);
graficas(1,1).i = FA.cadera_i(:,1);
graficas(1,1).titulo = 'Fuerza Cadera';
graficas(1,1).labelx = '% CM';
graficas(1,1).labely = 'Lateral(-) / Medial(+) [N]';

graficas(1,2).d = FA.cadera_d(:,2);
graficas(1,2).i = FA.cadera_i(:,2);
graficas(1,2).titulo = 'Fuerza Cadera';
graficas(1,2).labelx = '% CM';
graficas(1,2).labely = 'Post(-) / Ant(+) [N]';

graficas(1,3).d = FA.cadera_d(:,3);
graficas(1,3).i = FA.cadera_i(:,3);
graficas(1,3).titulo = 'Fuerza Cadera';
graficas(1,3).labelx = '% CM';
graficas(1,3).labely = 'Dist(-) / Prox(+) [N]';

%% RODILLA
graficas(2,1).d = FA.rodilla_d(:,1);
graficas(2,1).i = FA.rodilla_i(:,1);
graficas(2,1).titulo = 'Fuerza Rodilla';
graficas(2,1).labelx = '% CM';
graficas(2,1).labely = 'Lateral(-) / Medial(+) [N]';

graficas(2,2).d = FA.rodilla_d(:,2);
graficas(2,2).i = FA.rodilla_i(:,2);
graficas(2,2).titulo = 'Fuerza Rodilla';
graficas(2,2).labelx = '% CM';
graficas(2,2).labely = 'Post(-) / Ant(+) [N]';

graficas(2,3).d = FA.rodilla_d(:,3);
graficas(2,3).i = FA.rodilla_i(:,3);
graficas(2,3).titulo = 'Fuerza Rodilla';
graficas(2,3).labelx = '% CM';
graficas(2,3).labely = 'Dist(-) / Prox(+) [N]';

%% TOBILLO
graficas(3,1).d = FA.tobillo_d(:,1);
graficas(3,1).i = FA.tobillo_i(:,1);
graficas(3,1).titulo = 'Fuerza Tobillo';
graficas(3,1).labelx = '% CM';
graficas(3,1).labely = 'Lateral(-) / Medial(+) [N]';

graficas(3,2).d = FA.tobillo_d(:,2);
graficas(3,2).i = FA.tobillo_i(:,2);
graficas(3,2).titulo = 'Fuerza Tobillo';
graficas(3,2).labelx = '% CM';
graficas(3,2).labely = 'Post(-) / Ant(+) [N]';

graficas(3,3).d = FA.tobillo_d(:,3);
graficas(3,3).i = FA.tobillo_i(:,3);
graficas(3,3).titulo = 'Fuerza Tobillo';
graficas(3,3).labelx = '% CM';
graficas(3,3).labely = 'Dist(-) / Prox(+) [N]';

%% GRAFICO
graficar_ciclo(graficas, Ciclo);