************************************************************
************************************************************
**		   
**	Advanced Quant Methods - Research Paper	   
**	
**	TITLE:
**	Conditions for Consumer Acceptance of
**  Mobile Payment Methods in the United States
**	
**	AUTHOR:
**	Michael Sedelmeyer
**	
**	REVISION DATE:
**	2012-05-02
**
**  DRAFT:
**  Final Draft
**
**  DATA SOURCE:
**  Federal Reserve Bank of Boston
**	2009 Survey of Consumer Payment Choice
**  http://www.bos.frb.org/economic/cprc/SCPC/index.htm 
**
************************************************************
************************************************************

*******************************************************************************
** The Rare Event Logit (relogit) Stata package (1.1-Stata Download Package) 
** needed for this analysis is available for download at: 
** http://gking.harvard.edu/relogit
** 
** Required commands included in this package are: relogit, setx, and relogitq
**
** Follow directions in the "Read Me" file included in the ZIP file download for
** installing the individual commands and help files from  the package onto your 
** local drive in order to make the commands accessible to Stata.
**
** Additional documentation regarding relogit can be found in articles posted to
** this site: 
** http://gking.harvard.edu/category/research-interests/methods/rare-events 
*******************************************************************************

//Stata Version Used
version 11

// After installing relogit, setx, and relogitq; open dataset used in this analysis

use "C:\Users\Michael Sedelmeyer\Dropbox\201202 - Courses\01 Adv Quant Meth\04_Research Project\Data Source\SCPC2009.dta", clear

// Look up details regarding weighting variable for dataset and set pw weight for application during calculations.

lookfor weight

svyset [pw=r_weight]

******************************
** MOBILE PAYMENT VARIABLES **
******************************

// Investigate dependent variable of interest - Mobile Payment Use

// Payment by text message
codebook pa051_a
recode pa051_a 2=0
tab pa051_a
svy: tab pa051_a

// Payment by tapping or waiving mobile phone
codebook pa051_b
recode pa051_b 2=0
tab pa051_b
svy: tab pa051_b

sum pa051_a pa051_b

// Combine both mobile payment methods into a single category coded as either used or not used mobile payment over the previous 12 months.

gen MPay=(pa051_a + pa051_b)
codebook MPay
recode MPay 2=1
label define NoYes 0 "No" 1 "Yes"
label values MPay NoYes
label variable MPay "POS Payment made via Mobile Phone"
tab MPay
sum MPay
svy: tab MPay

***********************************
** Contactless Payment Variables **
***********************************

// Investigate and recode independent variable for Contactless Payment Adoption

// Credit Card
codebook pa027_a
recode pa027_a 2=0
tab pa027_a
svy: tab pa027_a

// Debit Card
codebook pa027_b
recode pa027_b 2=0
tab pa027_b
svy: tab pa027_b

// Prepaid Card
codebook pa027_c
recode pa027_c 2=0
tab pa027_c
svy: tab pa027_c

// Electronic Toll Payment
codebook pa027_d
recode pa027_d 2=0
tab pa027_d
svy: tab pa027_d

// Keyfob
codebook pa027_e
recode pa027_e 2=0
tab pa027_e
svy: tab pa027_e

sum pa027_a pa027_b pa027_c pa027_d pa027_e 

// Combine all non-mobile contactless payment methods into a single variable coded as either used or not used.

gen CPay=(pa027_a + pa027_b + pa027_c + pa027_d + pa027_e)
codebook CPay
recode CPay 2/5=1
label values CPay NoYes
label variable CPay "Payment made using contactless payment technology (other than mobile)"
tab CPay
sum CPay
svy: tab CPay

******************************
** Mobile Banking Variable  **
******************************

// Investigate and recode independent variables for Mobile Banking Adoption

// Mobile banking set up on current bank account
codebook pa026
recode pa026 2=0
rename pa026 MBank
tab MBank
svy: tab MBank
sum MBank

******************************
** Age Variables 			**
******************************

// Investigate and recode control variables for respondent Age

// Age variable in years

codebook age
sum age

gen AgeCats=age
recode AgeCats 1/24=1 25/34=2 35/44=3 45/54=4 55/64=5 65/90=6
label define AgeGroups 1 "Less than 25 years" 2 "25-34 years" 3 "35-44 years" 4 "45-54 years" 5 "55-64 years" 6 "More than 65 years"
label values AgeCats AgeGroups
label variable AgeCats "Age of respondents"
tab AgeCats
svy: tab AgeCats
sum AgeCats

******************************
** Education Level Variable **
******************************

// Investigate and recode independent variables for Education Level of respondents

// Less than high school
codebook edu_lhs
recode edu_lhs 2=0
tab edu_lhs
svy: tab edu_lhs

// High School
codebook edu_hs
recode edu_hs 2=0 1=2
tab edu_hs
svy: tab edu_hs

// Some College
codebook edu_sc
recode edu_sc 2=0 1=3
tab edu_sc
svy: tab edu_sc

// College
codebook edu_c
recode edu_c 2=0 1=4
tab edu_c
svy: tab edu_c

// Post-graduate Studies
codebook edu_pgs
recode edu_pgs 2=0 1=5
tab edu_pgs
svy: tab edu_pgs

sum edu_lhs edu_hs edu_sc edu_c edu_pgs

// Combine all Education categories into a single variable coded 1-5 to indicate highest level of education attained by repsondent.

gen EdLevel=(edu_lhs + edu_hs + edu_sc + edu_c + edu_pgs)
codebook EdLevel
label define EdLev 1 "Less than High-School" 2 "High School" 3 "Some College" 4 "College" 5 "Post-graduate Studies"
label values EdLevel EdLev
label variable EdLevel "Highest Level of Education Attained"
tab EdLevel
sum EdLevel
svy: tab EdLevel

************************************
** Income Level Variable **
************************************

// Investigate and recode independent variables for Household Income Level of respondents

// Less thank $25,000 per year
codebook inc_lt25
recode inc_lt25 2=0 1=1
tab inc_lt25
svy: tab inc_lt25

// $25,000-$49,999 per year
codebook inc_2549
recode inc_2549 2=0 1=2
tab inc_2549
svy: tab inc_2549

// $50,000-$74,999 per year
codebook inc_5074
recode inc_5074 2=0 1=3
tab inc_5074
svy: tab inc_5074

// $75,000-$99,999 per year
codebook inc_7599
recode inc_7599 2=0 1=4
tab inc_7599
svy: tab inc_7599

// $100,000-$124,999 per year
codebook inc_100124
recode inc_100124 2=0 1=5
tab inc_100124
svy: tab inc_100124

// $125,000-$199,999 per year
codebook inc_125199
recode inc_125199 2=0 1=6
tab inc_125199
svy: tab inc_125199

// Greater than $200,000 per year
codebook inc_gt200
recode inc_gt200 2=0 1=7
tab inc_gt200
svy: tab inc_gt200

sum inc_lt25 inc_2549 inc_5074 inc_7599 inc_100124 inc_125199 inc_gt200

// Combine all Income categories into a single variable coded 1-7 to indicate household income by repsondent.

gen Income=(inc_lt25 + inc_2549 + inc_5074 + inc_7599 + inc_100124 + inc_125199 + inc_gt200)
codebook Income
label define IncLev 1 "Less than $25,000" 2 "$25,000-$49,999 per year" 3 "$50,000-$74,999 per year" 4 "$75,000-$99,999 per year" 5 "$100,000-$124,999 per year" 6 "$125,000-$199,999 per year" 7 "Greater than $200,000 per year"
label values Income IncLev
label variable Income "Household Income Level"
tab Income
sum Income
svy: tab Income

***********************************
** Race Dummy Variable for White **
***********************************

// Investigate and recode independent dummy variable for respondent's Race (White Yes or No)

// White
codebook white
recode white 2=0
label values white NoYes
label variable white "Is the Respondent White?"
tab white
sum white
svy: tab white

********************************************************************************
** Logit Model for comparison with Rare Event Logit, all Variables - Weighted **
********************************************************************************

logit MPay CPay MBank AgeCats EdLevel Income white [pw=r_weight]

fitstat

*********************************************************************
** Rare Event Logit Model with All Independent Variables - Weighted **
*********************************************************************

relogit MPay CPay MBank AgeCats EdLevel Income white [pw=r_weight]

*************************************************************************
** Rare Event Logit Model with All Independent Variable - Not Weighted **
*************************************************************************

// run unweighted relogit in order to generate predicted probabilities for significant variables. Examine weighted vs unweighted coefficients of significant variables to determine appropriateness of unweighted model for generating predicted probabilities. 

relogit MPay CPay MBank AgeCats EdLevel Income white

// setx sets variables for relogitq, which calculates predicted probabilities and 95% CIs

setx CPay 0 (MBank AgeCats EdLevel Income white) mean
relogitq 

setx CPay 1 (MBank AgeCats EdLevel Income white) mean
relogitq

setx MBank 0 (CPay AgeCats EdLevel Income white) mean
relogitq

setx MBank 1 (CPay AgeCats EdLevel Income white) mean
relogitq

**********************************************************************************************************
** Logit Model for comparison with Relogit, excluding primary Ind Vars - Weighted **
**********************************************************************************************************

logit MPay AgeCats EdLevel Income white [pw=r_weight]

fitstat

*******************************************************************************
** Rare Event Logit Model excluding primary Independent Variables - Weighted **
*******************************************************************************

relogit MPay AgeCats EdLevel Income white [pw=r_weight]

***********************************************************************************
** Rare Event Logit Model excluding primary Independent Variables - Not Weighted **
***********************************************************************************

// Run unweighted relogit in order to generate predicted probabilities for significant variables. Examine weighted vs unweighted coefficients of significant variables to determine appropriateness of unweighted model for generating predicted probabilities.

relogit MPay AgeCats EdLevel Income white

// setx sets variables for relogitq, which calculates predicted probabilities and 95% CIs

setx AgeCats 1 (EdLevel Income white) mean 
relogitq

setx AgeCats 2 (EdLevel Income white) mean 
relogitq

setx AgeCats 3 (EdLevel Income white) mean 
relogitq

setx AgeCats 4 (EdLevel Income white) mean 
relogitq

setx AgeCats 5 (EdLevel Income white) mean 
relogitq

setx AgeCats 6 (EdLevel Income white) mean 
relogitq

setx white 0 (AgeCats EdLevel Income) mean
relogitq

setx white 1 (AgeCats EdLevel Income) mean
relogitq

****************************************************************************
****************************************************************************
** 
** Figures Illustrating the Relationships Between Mobile Payment
** Adoption and Variables Found To Have a Significant Relationship
**
****************************************************************************
**
** Note that the following commands were run on a separate, manually
** constructed dataset that contained the 95% CI and Pr values generated
** from the above noted models. The PRGEN command is not compatible
** with RELOGIT, hence the manually created table.
**
****************************************************************************
****************************************************************************

label variable Agep "Predicted Probability"
twoway rarea Agelb Ageub Agex || line Agep Agex, scheme(s1mono) xtitle("Age Category (years)") ytitle("Predicted Probability, Adopt Mobile Payment") xlabel(1 "< 25" 2 "25 - 34" 3 "35 - 44" 4 "45 - 54" 5 "55 - 64" 6 "> 65")

label variable CPayx "Probability, Mobile Payment Adoption"
two bar CPayp CPayx || rcap CPaylb CPayub CPayx, scheme(s1mono) ytitle("Predicted Probability, Adopt Mobile Payment") xlabel(0 "Does Not Use Other Methods" 1 "Uses Other Contactless Pay Methods") ysc(r(0 .1)) ylabel(0(.02).1)

two bar MBankp MBankx || rcap MBanklb MBankub MBankx, scheme(s1mono) ytitle("Predicted Probability, Adopt Mobile Payment") xlabel(0 "Does Not Use Mobile Banking" 1 "Uses Mobile Banking")

two bar Whitep Whitex || rcap Whitelb Whiteub Whitex, scheme(s1mono) ytitle("Predicted Probability, Adopt Mobile Payment") xlabel(0 "Not White" 1 "White") ysc(r(0 .1)) ylabel(0(.02).1)
