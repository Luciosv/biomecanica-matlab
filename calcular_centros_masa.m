function CM = calcular_centros_masa (CA, p_r_heel, p_l_heel)

CM.muslo_d = CA.cadera_d + 0.39 * (CA.rodilla_d - CA.cadera_d);
CM.muslo_i = CA.cadera_i + 0.39 * (CA.rodilla_i - CA.cadera_i);

CM.pierna_d = CA.rodilla_d + 0.42 * (CA.tobillo_d - CA.rodilla_d);
CM.pierna_i = CA.rodilla_i + 0.42 * (CA.tobillo_i - CA.rodilla_i);

CM.pie_d = p_r_heel + 0.44 * (CA.tobillo_d - p_r_heel);
CM.pie_i = p_l_heel + 0.44 * (CA.tobillo_i - p_l_heel);