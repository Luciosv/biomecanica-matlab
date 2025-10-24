function M = calcular_momento_coord_glob(H, a, b, c, Mres)

%primero paso H a coord glob
nFrames = size(H,1);
M = zeros(nFrames,3);
H_glob = zeros(nFrames,3);

for i = 1:nFrames
    % Construyo matriz de rotación del frame i (3x3)
    R = [a(i,:); b(i,:); c(i,:)];
        
    % Transformo H local → global
    H_glob(i,:) = (R * H(i,:)')';
end

M = H_glob - Mres;