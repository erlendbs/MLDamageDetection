close all

% Modal Strain Energy comparison

ne = 100;
ns = 9;
damage = [30, 50];
f = [0.1, 0.2];

[uV, uD] = damagedBeam(ne, ns, 0, 0);
[dV, dD] = damagedBeam(ne, ns, damage, f);

U = [zeros(1, length(uV(1,:))); uV; zeros(1, length(uV(1,:)))];
V = [zeros(1, length(dV(1,:))); dV; zeros(1, length(dV(1,:)))];

beta = getMSEdamage(U, V, 2);

figure
hold on
title("Damage index by element number, ns = 9")
plot(beta)


figure
hold on
i = 2;
plot(U(:,i), "DisplayName", "undamaged")
plot(V(:,i), "DisplayName", "damaged")
legend('show')
