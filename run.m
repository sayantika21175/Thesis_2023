clear all
predictionMethod = 'grdmf'%'grdmf'%'gr1bmc_ppxa';%'gr1bmc_ppxa'%'mc 'dmf'%'mf' %'grmc_admm' %'grmf' %'bmc_ppxa_mine' 

% read virus-drug assocaitions
load('data_processed/drug_bacteria_matrix_26042023.mat')
T22=T41';
global Sd Sv
load('data_processed/bacteria_similarity_matrix_26042023.mat')
load('data_processed/drug_similarity_matrix_26042023.mat')
Y=T22;
Sd=T61;
Sv1=T51;
sv2 = ones(size(Sv1)); 
Sv=sv2-Sv1;
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
cv_setting=2;%1 %3  
getParameters(predictionMethod,cv_setting);
disp("hello")

a=rank(Y)
[auc,aupr,XcROC,YcROC,XcPR,YcPR, T ]=get_CV_results(Y,n,cv_setting,predictionMethod  );

toc
