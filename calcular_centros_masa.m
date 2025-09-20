function CM = calcular_centros_masa (CA, p_r_heel, p_l_heel)

CM.r_thigh_cg = CA.cadera_d + 0.39 * (CA.rodilla_d - CA.cadera_d);
CM.l_thigh_cg = CA.cadera_i + 0.39 * (CA.rodilla_i - CA.cadera_i);

CM.r_calf_cg = CA.rodilla_d + 0.42 * (CA.tobillo_d - CA.rodilla_d);
CM.l_calf_cg = CA.rodilla_i + 0.42 * (CA.tobillo_i - CA.rodilla_i);

CM.r_foot_cg = p_r_heel + 0.44 * (CA.tobillo_d - p_r_heel);
CM.l_foot_cg = p_l_heel + 0.44 * (CA.tobillo_i - p_l_heel);