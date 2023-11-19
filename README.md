# Thesis_2023
"A Computational Approach to assist healthcare professionals in selecting Antibacterial Drugs to treat Bacterial Infections"
Sayantika Chatterjee (IIIT Delhi), Angshul Majumdar (IIIT Delhi), Emilie Chouzenoux(OPIS, Inria Saclay)

### Overview of the work:
  ### 1. DBA (Drug Bacteria Association Database)
   - The DBA database provides a comprehensive collection of associations between drugs and Bacteria.

  ### 2. Drug Similarity Matrix Formation
    - DrugBank Id from DrugBank Vocabulary
    - Linking file to link Drugbank Id to KEGG Id
    - Simcomp Score from KEGG API at GenomeNet(http://rest.genome.jp/simcomp/<query>/<database>[/<params>])
    - Drug similarity matrix size is of 53*53

  ### 3. Bacteria Similarity Matrix Formation
    - Findout the genome sequenece in FASTA format for each bacteria
    - Find out the bacteria similarity using Genome Genome Distance calculator using https://ggdc.dsmz.de/ggdc.php#
    - Bacteria Similarity matrix of size 61*61

  ### 4. Benchmark state-of-the-art algorithms

_

![Project Logo](Thesis_2023/helper_functions
/Picture1.png
)____________________________________________________________________________________________________________________________________________________________________________________
### Algorithms used (Matrix Completion Techniques)
    This section features a set of computational techniques based on matrix completion. These methods are designed to predict potential anti-Bacteria drug candidates.
     1.**Basic Framework **
      - Matrix factorization
      - Matrix Completion
      - Binary Matrix Completion

     2. **Deep Frameworks:**
      - Deep Matrix factorization

     3. **Graph regularized Frameworks:**
      - Graph regularized matrix factorization(GRMF)
      - Graph regularized matrix completion(GRMC)
      - Graph regularized deep matrix factorization(GRDMF)
      - Graph regularized binary matrix completion(GRBMC)

  The computational algorithms used here to predict drug-Bacteria association are available in: helper_functions/alg_template

  _______________________________________________________________________________________________________________________________________________________________________________________

  ### The results can be reproduced by the following MATLAB scripts:

      run.m
    ./Experiments/my_experiment.m
  











# Sources:
### 1. DrugBank: https://www.drugbank.ca/categories/DBCAT000066
Drug - Bacteria association information is found from the pdf :
- Antibiotic guidelines for adults 2018- CMC vellore.pdf
- Antibiotic Policy AIIMS JDH 2018.pdf


  




  

