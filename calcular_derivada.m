function der = calcular_derivada (data, fm)

der_ = diff(data) * fm;

% extrapolo el ultimo valor
der_extrap = 2 * der_(end,:) - der_(end-1,:);

der = [der_; der_extrap];
