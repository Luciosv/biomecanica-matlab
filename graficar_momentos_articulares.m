function graficar_momentos_articulares(M, Ciclo)

%% CADERA
graficas(1,1).d = M.cadera_d.med_lat;
graficas(1,1).i = M.cadera_i.med_lat;
graficas(1,1).titulo = 'Momento muscular Cadera';
graficas(1,1).labelx = '% CM';
graficas(1,1).labely = 'Flex(-) / Ext(+) [Nm/Kg]';

graficas(1,2).d = M.cadera_d.ant_pos;
graficas(1,2).i = M.cadera_i.ant_pos;
graficas(1,2).titulo = 'Momento muscular Cadera';
graficas(1,2).labelx = '% CM';
graficas(1,2).labely = 'Post(-) / Ant(+) [N]';

graficas(1,3).d = M.cadera_d.prx_dis;
graficas(1,3).i = M.cadera_i.prx_dis;
graficas(1,3).titulo = 'Momento muscular Cadera';
graficas(1,3).labelx = '% CM';
graficas(1,3).labely = 'Dist(-) / Prox(+) [N]';

%% RODILLA
graficas(2,1).d = M.rodilla_d.med_lat;
graficas(2,1).i = M.rodilla_i.med_lat;
graficas(2,1).titulo = 'Momento muscular Rodilla';
graficas(2,1).labelx = '% CM';
graficas(2,1).labely = 'Lateral(-) / Medial(+) [N]';

graficas(2,2).d = M.rodilla_d.ant_pos;
graficas(2,2).i = M.rodilla_i.ant_pos;
graficas(2,2).titulo = 'Momento muscular Rodilla';
graficas(2,2).labelx = '% CM';
graficas(2,2).labely = 'Post(-) / Ant(+) [N]';

graficas(2,3).d = M.rodilla_d.prx_dis;
graficas(2,3).i = M.rodilla_i.prx_dis;
graficas(2,3).titulo = 'Momento muscular Rodilla';
graficas(2,3).labelx = '% CM';
graficas(2,3).labely = 'Dist(-) / Prox(+) [N]';

%% TOBILLO
graficas(3,1).d = M.tobillo_d.med_lat;
graficas(3,1).i = M.tobillo_i.med_lat;
graficas(3,1).titulo = 'Momento muscular Tobillo';
graficas(3,1).labelx = '% CM';
graficas(3,1).labely = 'Lateral(-) / Medial(+) [N]';

graficas(3,2).d = M.tobillo_d.ant_pos;
graficas(3,2).i = M.tobillo_i.ant_pos;
graficas(3,2).titulo = 'Momento muscular Tobillo';
graficas(3,2).labelx = '% CM';
graficas(3,2).labely = 'Post(-) / Ant(+) [N]';

graficas(3,3).d = M.tobillo_d.prx_dis;
graficas(3,3).i = M.tobillo_i.prx_dis;
graficas(3,3).titulo = 'Momento muscular Tobillo';
graficas(3,3).labelx = '% CM';
graficas(3,3).labely = 'Dist(-) / Prox(+) [N]';

%% GRAFICO
graficar_ciclo(graficas, Ciclo);