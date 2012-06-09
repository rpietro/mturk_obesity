#######################################################################################
#template_secondary_data_analysis.R is licensed under a Creative Commons Attribution - Non commercial 3.0 Unported License. see full license at the end of this file.
#######################################################################################
#this script follows a combination of the guidelines proposed by Hadley Wickham http://goo.gl/c04kq as well as using the formatR package http://goo.gl/ri6ky

#Claudia, please add
#link to manuscript

#####################################################################################
#SETTING ENVIRONMENT
#####################################################################################
#remove all objects and then check
rm(list = ls())
ls()
#dettach all packages
detach()

#command below will install all packages and is only run once. remove the #if this is the first time you are running the code on RStudio, and then you can add the hash tag again
#lapply(c("ggplot2", "psych", "RCurl", "irr", "car","Hmisc", "gmodels", "DAAG", "VIM", "mice"), install.packages, character.only=T)

lapply(c("ggplot2", "psych", "RCurl", "irr", "car","Hmisc", "gmodels","qpcR", "VIM", "mice"), library, character.only=T)

#####################################################################################
#IMPORTING DATA
#####################################################################################

#if you are using a file that is local to your computer, then replace path below by path to the data file. command will throw all the data into the templateData object
obesityData <- read.csv("/Users/rpietro/Google Drive/R/mturk_obesity/mturk_obesity_test1.csv", stringsAsFactors=FALSE)

#could not place the file on google sheet as the number of variables exceeds the maximum number of variables google sheets allows

#below will view data in a spreadsheet format
View(obesityData)
#below will list variable names, classes (integer, factor, etc), alternative responses
str(obesityData)
#list variable names so that they can be used later
#names(eras.data)
attach(obesityData)

summary(obesityData)

#total number of missing data points
countNA(obesityData)

#see interpretation of plots below at http://goo.gl/AfAOb, and then try to change parameters
matrixplot(obesityData)
parcoordMiss(obesityData)
pbox(obesityData)

#A matrix with ncol(x)+1 columns, in which each row corresponds to a missing data pattern (1=observed, 0=missing). Rows and columns are sorted in increasing amounts of missing information. The last column and row contain row and column counts, respectively.
md.pattern(obesityData)


#######################################################################################
#template_secondary_data_analysis.R is licensed under a Creative Commons Attribution - Non commercial 3.0 Unported License. You are free: to Share — to copy, distribute and transmit the work to Remix — to adapt the work, under the following conditions: Attribution — You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work). Noncommercial — You may not use this work for commercial purposes. With the understanding that: Waiver — Any of the above conditions can be waived if you get permission from the copyright holder. Public Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license. Other Rights — In no way are any of the following rights affected by the license: Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations; The author's moral rights; Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights. Notice — For any reuse or distribution, you must make clear to others the license terms of this work. The best way to do this is with a link to this web page. For more details see http://creativecommons.org/licenses/by-nc/3.0/
#######################################################################################
