function getParameters(classifier,cv_setting)
%
% This function retrieves optimal parameter values based on the supplied
% algorithm, the CV scenario used and the dataset on which prediction will
% be performed.
%
% INPUT:
%  classifier:  algorithm to be used
%  cv_setting:          
%
% OUTPUT:
%  params:   optimal parameter values for given inputs


global k alpha  k1 k2  pp lamda mu1 mu2 nu1 nu2  
global num_iter p lambda_l lambda_d lambda_t    

%"hi"
    
    switch classifier

        case 'grdmf'  
            switch cv_setting 
                        case 1
                            mu1=0.1;mu2=0.05,alpha=1;k1=25;k2=5;p=2;
                          case 2
                            mu1=0.06;mu2=1.6;alpha=20;k1=25;k2=20;p=2;
                            %mu1=0.1;mu2=1.3;alpha=25;k1=25;k2=15;p=3;
                        case 3
                            %k=20;alpha=0.01; 
                            mu1=0.09;mu2=0.01,alpha=1;k1=25;k2=5;p=2;
                            %mu1=0.3;mu2=0.1,alpha=4;k1=25;k2=5;p=2;%non negative grdmf
              end
      
      case 'mf'
                    switch cv_setting 
                        case 1
                            k=5;alpha=0.5;    
                          case 2
                            k=20;alpha=0.05; 
                        case 3
                            %k=20;alpha=0.01;
                            k=5;alpha=0.5
                            %k=5;alpha=0.8;%for non negative MF
                      end
       
      case 'dmf'
          switch cv_setting 
                        case 1
                            alpha=2; k1=25;k2=5;    
                          case 2
                            alpha=0.7; k1=30;k2=20;
                          case 3
                            %alpha=0.5; k1=30;k2=15;
                            alpha=1.5; k1=20;k2=5;
                            %alpha=0.5; k1=20;k2=5; for non negative DMF
                      end
            
            
      case 'grmf'
          
            %num_iter = 2;
            %k = 100;
            k=53;
            num_iter=30;
                      switch(cv_setting)
                        
                        case 1
                           %p=7; lambda_l = 0.0313; lambda_d = 0.01;lambda_t = 0.01;  
                           %p=7; lambda_l = 0.0413; lambda_d = 0.02;lambda_t = 0.03; 
                           p=7; lambda_l = 0.05; lambda_d = 0.03;lambda_t = 0.03; 
                          case 2
                          % old data optimal para:dnt chng to keep corona rsult p=3; lambda_l = 0.125; lambda_d = 0.3;lambda_t = 0.1; 
                           p=8; lambda_l = 1.5; lambda_d = 0.1;lambda_t = 0.5; %1 extra drug predicted in grmf
                           case 3
                           %p=7 ;lambda_l =0.25; lambda_d =0.25;lambda_t =0.01; 
                           %p=2 ;lambda_l =0.0625; lambda_d =0.05;lambda_t =0.005; 
                           p=7; lambda_l = 0.0413; lambda_d = 0.02;lambda_t = 0.03; 
                           %p=9; lambda_l = 1; lambda_d =1;lambda_t = 1;
                           
                      end
                                   
                                   
        case 'gr1bmc_ppxa'
           
                    switch cv_setting 
                        
                        case 1
                            pp=2;lamda=0.8;mu1=0.1;mu2=0.1;
                             %pp=2;lamda=0.2;mu1=2.2;mu2=0.01;
                        case 2
                            %pp=2;lamda=0.01;mu1=1;mu2=1;
                             % old data optimal para:dnt chng to keep corona rsult pp=2;lamda=0.05;mu1=1;mu2=0.5;
                             %pp=2;lamda=0.5;mu1=3;mu2=0.05;
                             pp=2;lamda=0.5;mu1=3;mu2=0.02;
                       case 3
                            %pp=2;lamda=2;mu1=0.1;mu2=1;
                            pp=2;lamda=0.8;mu1=0.08;mu2=1;
                    end

            
        case 'grmc_admm'
                    switch cv_setting 
                        case 1
                            %pp=2;lamda=0.01;mu1=0.01;mu2=0.005;
                            pp=7;lamda=0.03;mu1=0.02;mu2=0.005;nu1=0.4;nu2=0.3;
                        case 2
                            %pp=2;lamda=0.01;mu1=0.1;mu2=0.01;
                            % old data optimal para:dnt chng to keep corona rsult pp=2;lamda=0.01;mu1=0.1;mu2=0.001%0.1 for bettr aupr;
                            pp=2;lamda=0.1;mu1=0.01;mu2=1;nu1=0.4;nu2=0.1;
                        case 3
                            pp=2;lamda=0.01;mu1=1;mu2=0.1;nu1=0.4;nu2=0.1;
                             
                    end
        case 'mc'
              
    end
            

end