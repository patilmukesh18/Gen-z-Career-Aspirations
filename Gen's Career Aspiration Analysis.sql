use genzdataset;

show tables;
select * from learning_aspirations;
select * from personalized_info;
select * from mission_aspirations;
select * from manager_aspirations;

# what percentage of male and female wants to go the office everyday?
#----------for female('3.1292')--------------------#
select (count(responseid)*100 / (select count(*) from personalized_info))
	from personalized_info as pi natural join learning_aspirations as la
      where responseid in 
      (select responseid from learning_aspirations where PreferredWorkingEnvironment like 'Every Day%' and Gender like 'female%');

#-------------for male('4.9268') --------------#
select (count(responseid)*100 / (select count(*) from personalized_info))
	from personalized_info as pi natural join learning_aspirations as la
      where responseid in 
      (select responseid from learning_aspirations where PreferredWorkingEnvironment like 'Every Day%' and Gender like 'male%');

# Question 2. what percentage of Genz who wants their career in Bussiness operatios are most likely influenced by their parents
#----------------Genz - '3.1292%' --------------------#
select (count(responseid)*100 / (select count(*) from personalized_info))
	from personalized_info as pi natural join learning_aspirations as la
      where responseid in 
      (select responseid from learning_aspirations where ClosestAspirationalCareer like 'Business%' and CareerInfluenceFactor like 'My Parents');
      
# Question 3. What percentage of genz prefer opting for higher studies give gender wise approach ?
# ----------------------Male opting higher student ('11.9840')-----------------------#
select (count(responseid)*100 / (select count(*) from personalized_info))
	from personalized_info as pi natural join learning_aspirations as la
      where responseid in 
      (select responseid from learning_aspirations where HigherEducationAbroad like 'Yes,_I%' and Gender like 'Male%');
# ---------------------Female opting higher student ('7.9228')-------------------------#
select (count(responseid)*100 / (select count(*) from personalized_info))
	from personalized_info as pi natural join learning_aspirations as la
      where responseid in 
      (select responseid from learning_aspirations where HigherEducationAbroad like 'Yes,_I%' and Gender like 'female%');
      
# Question 4. What percentage of genz willing and not willing to go for company whose mission is misaligned with their publicaction or even their products ? (give gender based split)
# ---------------------male will not work (''43.3755') -------------------------#
select (count(responseid)*100 / (select count(*) from personalized_info))
	from personalized_info as pi natural join mission_aspirations as ma
      where responseid in 
      (select responseid from mission_aspirations where MisalignedMissionLikelihood like '%Will NOT work%' and Gender like 'Male%');

# ---------------------male will work (''16.2117') -------------------------#
select (count(responseid)*100 / (select count(*) from personalized_info))
	from personalized_info as pi natural join mission_aspirations as ma
      where responseid in 
      (select responseid from mission_aspirations where MisalignedMissionLikelihood like '%Will work%' and Gender like 'Male%');

# ----------------------female will not work ('32.5566') -------------------#
select (count(responseid)*100 / (select count(*) from personalized_info))
	from personalized_info as pi natural join mission_aspirations as ma
      where responseid in 
      (select responseid from mission_aspirations where MisalignedMissionLikelihood like '%Will NOT work%' and Gender like 'Female%');

# ---------------------female will work ('7.7563') -------------------------#
select (count(responseid)*100 / (select count(*) from personalized_info))
	from personalized_info as pi natural join mission_aspirations as ma
      where responseid in 
      (select responseid from mission_aspirations where MisalignedMissionLikelihood like '%Will work%' and Gender like 'Female%');
      
# Question 5. What is soutable enviornment according to female genz's ?
# Hybrid Inviroment are more Soutable
 select count(responseid)
	from personalized_info as pi natural join learning_aspirations as la
      where responseid in 
      (select responseid from learning_aspirations where PreferredWorkingEnvironment like 'Every Day%' and Gender like 'Female%');

 select count(responseid)
	from personalized_info as pi natural join learning_aspirations as la
      where responseid in 
      (select responseid from learning_aspirations where PreferredWorkingEnvironment like 'Fully Remote%' and Gender like 'Female%');

 select count(responseid)
	from personalized_info as pi natural join learning_aspirations as la
      where responseid in 
      (select responseid from learning_aspirations where PreferredWorkingEnvironment like 'Hybrid%' and Gender like 'Female%');

#Question 6. calculate number of female who aspire to work in their closest Aspirational carrer and have no Social Impact Likelihood of "1 to 5"
 select count(responseid)
	from learning_aspirations as la natural join mission_aspirations as ma
      join personalized_info as pi on pi.responsedid = la.responsedid
      where responseid in 
      (select responseid from mission_aspirations where NoSocialImpactLikelihood between 1 and 5 and  la.Gender like '%Female%');
      
# Question 7 . review the male who are intrested in Higher education abroad and have carrer influenced factor of my parents
select responseid, gender
      from learning_aspirations as la natural join personalized_info as pi 
      where HigherEducationAbroad like 'Yes,%' and CareerInfluenceFactor like 'My Parents%' and gender like 'Male%';
      
#Question 8. Determine the percent of gender who have no social impact likelihood of '8 to 10' among those are intrested in higher education abroad
# -----------------------------for male (14.21 %)
select (count(responseid)*100 / (select count(*) from personalized_info))
      from personalized_info as pi natural join  mission_aspirations as ma
      where NoSocialImpactLikelihood between 8 and 10 and gender like 'Male%';
# ------------------------------for female (7.12 %)
select (count(responseid)*100 / (select count(*) from personalized_info))
      from personalized_info as pi natural join  mission_aspirations as ma
      where NoSocialImpactLikelihood between 8 and 10 and gender like 'Female%';

# Question 9. Give a detailed split of the Genz prefernce to work with Teams Data Should include Male, Female and Overall in counts as well as in percentage
#----------------------------For male 36.12 %
select (count(responseid)*100 / (select count(*) from personalized_info))
      from personalized_info as pi natural join  manager_aspirations as ma
      where responseid in 
      (select responseid from manager_aspirations where PreferredWorkSetup like '%Work with%' and gender like 'Male%');
# --------------------------count 1088
select count(responseid)
      from personalized_info as pi natural join  manager_aspirations as ma
      where responseid in 
      (select responseid from manager_aspirations where PreferredWorkSetup like '%Work with%' and gender like 'Male%');

# -------------------------for female (25.06%)
select (count(responseid)*100 / (select count(*) from personalized_info))
      from personalized_info as pi natural join  manager_aspirations as ma
      where responseid in 
      (select responseid from manager_aspirations where PreferredWorkSetup like '%Work with%' and gender like 'Female%');

# ---------------------------count for female 753
select count(responseid)
      from personalized_info as pi natural join  manager_aspirations as ma
      where responseid in 
      (select responseid from manager_aspirations where PreferredWorkSetup like '%Work with%' and gender like 'Female%');
      
# Question 10. Give detailed breakdown of "Worklikelihood3Year' for each gender
select  WorkLikelihood3Years, count(WorkLikelihood3Years)
from manager_aspirations as ma natural join personalized_info as pi
where Gender like 'Male%'
group by WorkLikelihood3Years;

select  WorkLikelihood3Years, count(WorkLikelihood3Years)
from manager_aspirations as ma natural join personalized_info as pi
where Gender like 'Female%'
group by WorkLikelihood3Years;

# Question 11. Give detailed breakdown of "Worklikelihood3Year' for each state
select  WorkLikelihood3Years, count(WorkLikelihood3Years)
from manager_aspirations as ma natural join personalized_info as pi
where CurrentCountry like 'India'
group by WorkLikelihood3Years;

# Question 12. What is AVG starting salary expectation at 3 year mark for each gender
#----------------- for male (20.21K)
select avg(ExpectedSalary3Years) 
from mission_aspirations as ma natural join personalized_info as pi
where Gender like 'Male%';

#---------------for female (21.04K)
select avg(ExpectedSalary3Years) 
from mission_aspirations as ma natural join personalized_info as pi
where Gender like 'Female%';

# Question 13. What is AVG starting salary expectation at 5 year mark for each gender
#-------------------for male (65.77K)
select avg(ExpectedSalary5Years) 
from mission_aspirations as ma natural join personalized_info as pi
where Gender like 'Male%';

#-------------------for female (66.84K)
select avg(ExpectedSalary5Years) 
from mission_aspirations as ma natural join personalized_info as pi
where Gender like 'Female%';

# Question 14. What is AVG Higher Bar salary expectation at 3 year mark for each gender
select avg(ExpectedSalary3Years) 
from mission_aspirations as ma natural join personalized_info as pi
where ExpectedSalary3Years like '%50%' and Gender like 'Male%';


# QUestion 15. 

# Question 16.