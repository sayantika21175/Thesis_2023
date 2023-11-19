predictionMethod = 'gr1bmc_ppxa';%grmc_admm %grmf %grdmf
addpath(genpath('../helper_functions'));
load('../data_processed/strains_for_experiment/bacteria_drug_matrix_straingivenbysir.mat');
my_mat=T81';
global Sd Sv
load('../data_processed/strains_for_experiment/bacteria_similarity_matrix_strain_for_experiment.mat');
load('../data_processed/strains_for_experiment/drug_similarity_matrix_26042023.mat');
Y=my_mat;
Sd=T61;
Sv1=T71;
sv2 = ones(size(Sv1)); 
Sv=sv2-Sv1;
St=Sv;
name='Mycobacterium tuberculosis strain_NIRTX011';%Klebsiella pneumoniae strain_U25 and Neisseria gonorrhoeae strain_H041
col_1=find(strcmp(bac_cell,name)); 
%col1=find(strcmp(bac_cell,'Burkholderia pseudomallei')); 
Y(:,col_1)=0;
%col_2=find(strcmp(bac_cell,'Klebsiella pneumoniae strain_U25'));
%Y(:,col_2)=0;
%col_3=find(strcmp(bac_cell,'Neisseria gonorrhoeae strain_H041')); 
%Y(:,col_3)=0;



getParameters(predictionMethod,2)
 %-----------------------------------------
k=10
           bac_ind=find(strcmp(bac_cell,name));
           %bac_ind=find(strcmp(bac_cell,'Klebsiella pneumoniae strain_U25'));
           %bac_ind=find(strcmp(bac_cell,'Neisseria gonorrhoeae strain_H041'));
           

           y2=Y;
           y2( :,bac_ind ) = 0;

           M = ones(size(Y)); 
           M( :,bac_ind)=0;
           test_ind=find(M==0);

           fprintf('*');

           y3=alg_template(y2,predictionMethod,test_ind ,[]);
          
           drugs_pred=y3(:,bac_ind);
           [sortedValues,sortIndex] = sort(drugs_pred,'descend');
           ind = sortIndex(1:k);
       
           top5drugNames=drug_cell(ind)'
           %sortedValues(1:5)';

