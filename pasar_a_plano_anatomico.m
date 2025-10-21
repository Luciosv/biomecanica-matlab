function vector = pasar_a_plano_anatomico (v, i_dist, k_prox)

normalize_vec = @(v) v ./ vecnorm(v, 2, 2);

%%

vector.prx_dis = dot(v,i_dist,2);
vector.med_lat = dot(v,k_prox,2);

I_art = normalize_vec(cross(k_prox,i_dist));

vector.ant_pos = dot(v,I_art,2);