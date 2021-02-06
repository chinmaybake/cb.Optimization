

function ChinmayBake_HW2
f = [-45; -70; -50];

A = [40 80 90; 100 160 140; 190 240 160; 200 310 220];

b =[25;45;65;80]; 

lb = [0;0;0]; 

[FractionInvested TotalNPV] =linprog(f,A,b,[],[],lb,[])

end