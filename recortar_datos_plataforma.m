function FP = recortar_datos_plataforma(Datos, Ciclo)

nan_to_zero = @(x) fillmissing(x, 'constant', 0);

%% Recortar datos al mismo rango temporal que los marcadores
i_ini = Ciclo.PrimerFrame - Ciclo.AntesHS;
i_fin = Ciclo.UltimoFrame + Ciclo.DespuesHS;
    
%% Plataforma 1
P1 = Datos.Pasada.Fuerzas.Plataforma1.Valores;
FP.P1.Fx = P1.Fx1(i_ini:i_fin);
FP.P1.Fy = P1.Fy1(i_ini:i_fin);
FP.P1.Fz = P1.Fz1(i_ini:i_fin);

% Momentos
FP.P1.Mx = P1.Mx1(i_ini:i_fin);
FP.P1.My = P1.My1(i_ini:i_fin);
FP.P1.Mz = P1.Mz1(i_ini:i_fin);

FP.P1.Mx = nan_to_zero(FP.P1.Mx);
FP.P1.My = nan_to_zero(FP.P1.My);
FP.P1.Mz = nan_to_zero(FP.P1.Mz);

% Centro de Presión Plataforma 1
FP.P1.CoPx = P1.CP1x(i_ini:i_fin);
FP.P1.CoPy = P1.CP1y(i_ini:i_fin);

FP.P1.CoPx = nan_to_zero(FP.P1.CoPx);
FP.P1.CoPy = nan_to_zero(FP.P1.CoPy);

%% Plataforma 2
P2 = Datos.Pasada.Fuerzas.Plataforma2.Valores;
FP.P2.Fx = P2.Fx2(i_ini:i_fin);
FP.P2.Fy = P2.Fy2(i_ini:i_fin);
FP.P2.Fz = P2.Fz2(i_ini:i_fin);

% Momentos
FP.P2.Mx = P2.Mx2(i_ini:i_fin);
FP.P2.My = P2.My2(i_ini:i_fin);
FP.P2.Mz = P2.Mz2(i_ini:i_fin);

FP.P2.Mx = nan_to_zero(FP.P2.Mx);
FP.P2.My = nan_to_zero(FP.P2.My);
FP.P2.Mz = nan_to_zero(FP.P2.Mz);

% Centro de Presión Plataforma 2
FP.P2.CoPx = P2.CP2x(i_ini:i_fin);
FP.P2.CoPy = P2.CP2y(i_ini:i_fin);

FP.P2.CoPx = nan_to_zero(FP.P2.CoPx);
FP.P2.CoPy = nan_to_zero(FP.P2.CoPy);

end