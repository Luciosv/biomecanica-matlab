function M = calcular_momento_residual (m, p_prox, f_prox, p_dist, f_dist)

M = m + cross(p_prox, f_prox) + cross(p_dist, f_dist);