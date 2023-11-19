clear all
predictionMethod = 'grdmf'%'grdmf'%'gr1bmc_ppxa';%'gr1bmc_ppxa'%'mc 'dmf'%'mf' %'grmc_admm' %'grmf' %'bmc_ppxa_mine' 

% read virus-drug assocaitions
%load('D:/3rd_sem/thesis/DVA-master/data_processed/virus_drug_association.mat')
load('D:/3rd_sem/thesis/DVA-master/data_processed/drug_bacteria_matrix_26042023.mat')
%mat=mat'; %size of data matrix: #drugsx#vir
T22=T41';
%T23=double(table2array(T22));x
    
global Sd Sv
%rng('shuffle')
%rng(892)
%load('D:/3rd_sem/thesis/DVA-master/data_processed/drug_sim_matrix.mat')
%load('D:/3rd_sem/thesis/DVA-master/data_processed/vir_sim_matrix.mat')
load('D:/3rd_sem/thesis/DVA-master/data_processed/bacteria_similarity_matrix_26042023.mat')
load('D:/3rd_sem/thesis/DVA-master/data_processed/drug_similarity_matrix_26042023.mat')
%T231=double(table2array(T11));
%T232=double(table2array(T21));
%global T21,T11
%rng shuffle
%s = rng;
%s1=s.Seed
%rng(517949723)%GRBMC seed number%
Y=T22;
Sd=T61;
Sv1=T51;
%Y=mat;
%Sd=T11;
%Sv1=T21;
sv2 = ones(size(Sv1)); 
Sv=sv2-Sv1;
%Sv=T21;
%Y=T22;
%s = rng; 
%disp(s);
%----add dependencies to path----
addpath(genpath('helper_functions'));

%----define parameters----
n = 10;% 'n' in "n-fold experiment"
global f_roc f_pr

tic
%for cv_setting=[ 1 2 3 ] 

%    print(cv_setting)

%disp("hi")
%disp(n)
cv_setting=2;  
getParameters(predictionMethod,cv_setting);
disp("hello")


%[correct_predict,AUCs,AUPRs]=correctpercent(Y,predictionMethod)
a=rank(Y)
[auc,aupr,XcROC,YcROC,XcPR,YcPR, T ]=get_CV_results(Y,n,cv_setting,predictionMethod  );
%ans2=demo(Y)
%predict_correct=[];
seed_num=[];
%for l =1:100
% rng(l)
% [percentc]=correctpercent(Y,predictionMethod);
 %predict_correct(l)=percentc;
 %seed_num(l)=l
 %end

%predict_correct=reshape(predict_correct,[1000,1]);
%seed_num=reshape(seed_num,[1000,1]);

   
%auc
%aupr

%end
toc