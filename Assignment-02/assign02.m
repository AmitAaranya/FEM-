function [NN NE NM NP NIP NDIM NEN NDOF ND NL NEUDL NRC CORD ELECON BC PLOAD UDL MAT] = assign02(infile)
NN = fscanf(infile, '%d',1);  % Total number of nodes
NE = fscanf(infile, '%d',1); % Number of elements
NM = fscanf(infile, '%d',1); % Number of different materials
NP = fscanf(infile, '%d',1); % Number of properties of material need to be specified
NIP = fscanf(infile, '%d',1); % Number of integration points
NDIM = fscanf(infile, '%d',1); % Number of co-ordinates per node
NEN = fscanf(infile, '%d',1); % Number of nodes per element
NDOF = fscanf(infile, '%d',1); % Number of DOF per node
ND = fscanf(infile, '%d',1); % Number of Applied BC specified
NL = fscanf(infile, '%d',1); % Number of point load specified
NEUDL = fscanf(infile, '%d',1); % Number of element over which udl is applied
NRC = fscanf(infile, '%d',1); % Number of sectional properties
CORD = fscanf(infile, '%f',[NN, NDIM]); % Co-ordinates of nodes
ELECON = fscanf(infile, '%f',[NE, NEN+NRC+1]); % Connectivity matrix
BC = fscanf(infile, '%f',[ND, 3]); % Boundary condition matrix
PLOAD = fscanf(infile, '%f',[NL, 3]); % Point Load matrix
UDL = fscanf(infile, '%f',[NEUDL, 2]); % UDL matrix
MAT = fscanf(infile, '%f',[NM, NP]); % Material matrix
end


