function [HeatFlux_Node] = HeatFlux_AtNode(HeatFlux_GP)

a = 0.5*sqrt(3);
Q = [1+a -0.5 ; -0.5 1+a];

HeatFlux_Node = Q*HeatFlux_GP;
 
    
end
