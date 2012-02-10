function [ net ] = CreateNet( )

fileName = 'architecture.xml';
net = GenerateConnectionsMap(fileName, 12);
                
                

fcn = [@purelin  @purelin ... %%INPUTS
       @FahlmanFunc  @FahlmanFunc @FahlmanFunc @FahlmanFunc @FahlmanFunc ... %%lAYERS
       @FahlmanFunc  @FahlmanFunc @FahlmanFunc @FahlmanFunc @FahlmanFunc ...
       @FahlmanFunc  @FahlmanFunc @FahlmanFunc ...
       @FahlmanFunc  ... %%oUTPUTS
	  ];
   
net.functions = fcn;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
