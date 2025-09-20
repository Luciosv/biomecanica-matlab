%--------------------------------------------------------------------------
%------------------------------FILTRADO------------------------------------
%--------------------------------------------------------------------------
%Filtro de orden "Orden", frecuencia de corte "frec_corte" Hz ,
% frecuencia de muestreo "fm" Hz, frecuencia maxima frecuencia de muestreo sobre 2
% "PrimerFrame" es el primer dato a filtrar y UltimoFrame es el último dato
% a filtrar por ni no filtro todos los datos en el caso de que tenga NAN
% habitualmente

function Datos=Filtrar_Marcadores(Datos,fm,frec_corte,Orden)

fe=fm/2;
wn=frec_corte/fe;
[B,A]=butter(Orden,wn);
Marcadores=fieldnames(Datos.Pasada.Marcadores.Crudos.Valores);
NumMarcadores=length(Marcadores);

for NumMar=1:NumMarcadores-2
    Mar=char(Marcadores{NumMar});
    Cord=Datos.Pasada.Marcadores.Crudos.Valores.(sprintf('%s',Mar));
    Datos.Pasada.Marcadores.Filtrados.Valores.(sprintf('%s',Mar))=Cord;
    
    for i=1:3
        Cord=Datos.Pasada.Marcadores.Crudos.Valores.(sprintf('%s',Mar))(:,i);
        
        % Verificar si hay valores no finitos
        if any(~isfinite(Cord))
            fprintf('Advertencia: Valores no finitos encontrados en marcador %s, columna %d\n', Mar, i);
            % Opción: saltear este marcador/columna
            continue;
            % O reemplazar valores no finitos con interpolación o cero
            % Cord(~isfinite(Cord)) = 0; % Reemplazar con cero
        end
        
        Cord = filtfilt(B,A,Cord);
        Datos.Pasada.Marcadores.Filtrados.Valores.(sprintf('%s',Mar))(:,i)=Cord;
    end
end