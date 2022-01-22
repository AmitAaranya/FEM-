function [NN NE NM NP NGPk NGPf NDIM NEN NDOF ND NIBC NL NEUDL NRC CORD ELECON MAT BC IBC PLOAD UDL UVL] = assign06(infile)
NN = fscanf(infile, '%d',1);  % Total number of nodes
NE = fscanf(infile, '%d',1); % Number of elements
NM = fscanf(infile, '%d',1); % Number of different materials
NP = fscanf(infile, '%d',1); % Number of properties of material need to be specified
NGPk = fscanf(infile, '%d',1); % Number of integration points for stiffness matrix
NGPf = fscanf(infile, '%d',1); % Number of integration points for load vector
NDIM = fscanf(infile, '%d',1); % Number of co-ordinates per node
NEN = fscanf(infile, '%d',1); % Number of nodes per element
NDOF = fscanf(infile, '%d',1); % Number of DOF per node
ND = fscanf(infile, '%d',1); % Number of Applied BC specified
NIBC = fscanf(infile,'%d',1); % Number of Inclined Boundary conditions
NL = fscanf(infile, '%d',1); % Number of point load specified
NEUDL = fscanf(infile, '%d',1); % Number of element over which udl is applied
NRC = fscanf(infile, '%d',1); % Number of sectional properties
CORD = fscanf(infile, '%f',[NN, NDIM]); % Co-ordinates of nodes
ELECON = fscanf(infile, '%f',[NE, NEN+NRC+1]); % Connectivity matrix
MAT = fscanf(infile, '%f',[NM, NP]); % Material matrix
BC = fscanf(infile, '%f',[ND, 3]); % Boundary condition matrix
IBC = fscanf(infile,'%f',[NIBC,4]); % Inclined boundary condition matrix
PLOAD = fscanf(infile, '%f',[NL, 3]); % Point Load matrix
UDL = fscanf(infile, '%f',[NEUDL, 2]); % UDL matrix
UVL = fscanf(infile,'%f',[NE,NEN]); % Uniformally varring Load Matrix
end

