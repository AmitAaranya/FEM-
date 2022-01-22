function [NN NE NM NP NGPk NGPf NDIM NEN NDOF ND NL NEUDL NRC NEUVL CORD ELECON MAT BC UDL UVL PLOAD] = assign051(finp)
NN = fscanf(finp, '%d',1);  % Total number of nodes
NE = fscanf(finp, '%d',1); % Number of elements
NM = fscanf(finp, '%d',1); % Number of different materials
NP = fscanf(finp, '%d',1); % Number of properties of material need to be specified
NGPk = fscanf(finp, '%d',1); % Number of integration points for stiffness matrix
NGPf = fscanf(finp, '%d',1); % Number of integration points for load vector
NDIM = fscanf(finp, '%d',1); % Number of co-ordinates per node
NEN = fscanf(finp, '%d',1); % Number of nodes per element
NDOF = fscanf(finp, '%d',1); % Number of DOF per node
ND = fscanf(finp, '%d',1); % Number of Applied BC specified
NL = fscanf(finp, '%d',1); % Number of point load specified
NEUDL = fscanf(finp, '%d',1); % Number of element over which udl is applied
NRC = fscanf(finp, '%d',1); % Number of sectional properties
NEUVL = fscanf(finp, '%d',1); % Number of element over which uVl is applied
CORD = fscanf(finp, '%f',[NN, NDIM]); % Co-ordinates of nodes
ELECON = fscanf(finp, '%f',[NE, NEN+NRC+1]); % Connectivity matrix
MAT = fscanf(finp, '%f',[NM, NP]); % Material matrix
BC = fscanf(finp, '%f',[ND, 3]); % Boundary condition matrix
UDL = fscanf(finp, '%f',[NEUDL, 2]); % UDL matrix
UVL = fscanf(finp,'%f',[NEUVL,3]); % Uniformally varring Load Matrix
PLOAD = fscanf(finp, '%f',[NL, 3]); % Point Load matrix
end

