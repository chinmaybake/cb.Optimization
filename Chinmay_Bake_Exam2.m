function [PE,PF]=itemselectionproblem

% let f1 be the vector of first objective function coefficients (i.e.,
% weights of the items). Put the correct values for ABCs in the next line.
f1=[10; 12; 15; 25; 11];

% let f2 be the vector of second objective function coefficients (i.e.,
% costs of the items).Put the correct values for ABCs in the next line.
f2=[4; 3; 1; 2; 5];

% the main equality constraint is formulated below. Put the correct values
% for ABCs in the next two lines. 
Aeq=[1 1 1 1 1];
beq=3;

% lower and upper bound vectors and intcon vector are defined below. Put
% the correct values for ABCs in the next three lines. 
lb=[0; 0; 0; 0; 0];
ub=[1; 1; 1; 1; 1];
intcon=[1 2 3 4 5];

% STEP 0: INITIALIZATION
U = 500; % initial bound on the second objective function (100 is sufficient here)
feasible=1; % initially, we assume that the model is feasible
epsilon=1; % here, when everthing is integer, 1 is small enough
PE=[]; % initially, we say that the set of Pareto efficient solutions is empty
PF=[]; % initially, we say that the Pareto Front is empty

% STEP 1: SOLVING FOR PARETO EFFICIENT SOLUTIONS
while feasible==1
    
    % We first solve Model-P1: in the line below, complete the syntax for
    % solving Model-P1 for this problem. Basically, you will put the
    % correct information instead of each ABC in the next line. 
    [x1,f1val,exitflag]=intlinprog(f1, intcon, f2', U, Aeq, beq, lb, ub);
    
    if exitflag<1
        feasible=0; %exitflag gives the stopping condition for intlinprog
        % So, when we could not solve Model-P1, we will get out of the
        % while loop and return the current set of Pareto efficient
        % solutions and current Pareto Front
    else
        % If Model-P1 is feasible, we solve Model-P2. In the line below,
        % complete the syntax for solving Model-P2 for this problem.
        % Basically, you will put the correct information instead of each
        % ABC in the next two lines.
        Aeqextended=[Aeq;f1'];
        beqextended=[beq;f1val];
        
        % Now, we are ready to solve Model-P2. You will put the correct 
        % information instead of each ABC in the next line. 
        [x2,f2val]=intlinprog(f2, intcon, [], [], Aeqextended, beqextended, lb, ub);
        
        % We include x2 in the set of Pareto efficient solutions
        PE=[PE; x2'];
        
        % We include the corresponding non-dominated point in the Pareto Front
        f1valueofthissolution=f1'*x1;
        f2valueofthissolution=f2val;
        thispoint=[f1valueofthissolution, f2valueofthissolution];
        PF=[PF;thispoint];
        
        % We update U: put the correct value instead of ABC in the next
        % line.
        U=f2valueofthissolution-epsilon;
    end
end
% STEP 2: PE AND PF ARE RETURNED AS THE OUTPUT OF THIS CODE
% Below, we plot the Pareto Front
plot(PF(:,1),PF(:,2),'*');

end