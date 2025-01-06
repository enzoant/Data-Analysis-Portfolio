# Python Project - Pharmaceutical research analysis

This project will focus on presenting some data processing and statistical analisys using python. The dataset file used is available at the "files" folder of this project.

This description is a quick glimpse on what was analysed on this project. For further coding detais, you can check the [Technical Report - Python Project.ipynb](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Python/Files/Technical%20Report%20-%20Python%20Project.ipynb) on the files folder.

## Company Context & Business Problem

A pharmaceutical company is specialized in anti-cancer medicines. They provided data to test the effectiveness of potential treatments medications for squamous cell carcinoma. In this study, 100 mice identified with tumor growth of squamous cell carcinoma (SCC), a type of skin cancer, have been treated through a variety of drug regimens. Over 45 days, tumor development was observed and measured. The objective is to analyze the data to show how four treatments (Capomulin, Ramicane, Infubinol and Placebo) compare.

We must answer these 3 questions:

• Business Problem nº1 - **Is there any outlier in tumor volume for each treatment?**

• Business Problem nº2 - **Is there an effect on the tumor over time for one of the medications?**

• Business Problem nº3 - **For one of the medications, what is the relationship between the guinea pig's weight and Tumor Size?**

To answer those questions, the steps taken were:
1. Load the dataset
2. Do an exploratory analysis of the dataset
3. Do a data cleaning of the dataset
4. Make a statistic summary
5. Redo the exploratory analysis after changes
6. Answer the proposed business questions

-------------------------
### Business Problem nº1 - Is there any outlier in tumor volume for each treatment?

![Business Problem 1](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Python/Files/output_1.png)

**Answer**: There is no outlier in the drug treatment regarding the final tumor volume.

-------------------------
### Business Problem nº2 - Is there an effect on tumor volume over time with the use of the drugs?

![Business Problem 2](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Python/Files/output_2.png)
    
**Answer**: The average value of tumor size seems to decay across time on the research. Thus, it seems to be an effect on tumor size with the drug administration.
For further investigation, some changes on the research approach will have to happen, such as testing only one drug in each mouse, or using a standardized drug aplication method for us to be able to better compare the results of each drug administration to the Placebo. After that, we should calculate the significance of the results.

-------------------------
### Business Problem nº3 - For each drug, what is the relationship between the weight of the mouse and the size of the tumor?

![Business Problem 3](https://github.com/enzoant/Data-Analysis-Portfolio/blob/Data-Analysis/Python/Files/output_3.png)
    
**Answer**: The proximity of all three correlations is next to 0. Thus, it's a weak/null correlation between tumor volume and mouse weight.

-------------------------
## Final considerations

This dataset shows many research inconsistencies and was only used to pratice skills in data processing and statistical analysis. The data used in this project is fictitious.

