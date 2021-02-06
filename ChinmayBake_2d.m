function ChinmayBake_2d

c = [8; 10; 12; 2; 2;];

Aeq = [1 1 1 0 0; -1 0 0 1 0; 0 -1 0 -1 1; 0 0 -1 0 -1];

beq = [150; -50; -40; -60];

ub= [100; 100; 100; 50; 60];

lb= [0; 0; 0; 0; 0]; 

[Monthly_Supply Total_Cost] = linprog(c,[],[],Aeq,beq,lb,ub)


end