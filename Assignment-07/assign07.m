function [NN NE NM NP NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON MAT BC PLOAD UDL ] = assign07(finp)
NN = fscanf(finp, '%d',1);  % Total number of nodes
NE = fscanf(finp, '%d',1); % Number of elements
NM = fscanf(finp, '%d',1); % Number of different materials
NP = fscanf(finp, '%d',1); % Number of properties of material need to be specified
NDIM = fscanf(finp, '%d',1); % Number of co-ordinates per node
NEN = fscanf(finp, '%d',1); % Number of nodes per element
NDOF = fscanf(finp, '%d',1); % Number of DOF per node
ND = fscanf(finp, '%d',1); % Number of Applied BC specified
NL = fscanf(finp, '%d',1); % Number of point load specified
NEUDL = fscanf(finp, '%d',1); % Number of element over which udl traction applied
NRC = fscanf(finp, '%d',1); % Number of sectional properties
CORD = fscanf(finp, '%f',[NN, NDIM]); % Co-ordinates of nodes
ELECON = fscanf(finp, '%f',[NE, NEN+NRC+1]); % Connectivity matrix
MAT = fscanf(finp, '%f',[NM, NP]); % Material matrix
BC = fscanf(finp, '%f',[ND, 3]); % Boundary condition matrix
PLOAD = fscanf(finp, '%f',[NL, 3]); % Point Load matrix
UDL = fscanf(finp, '%f',[NEUDL, 4]); % UDL traction matrix
end

