CREATE TABLE exams (gender varchar,Race varchar,parental_education_level varchar,lunch varchar,
test_preparation_course	varchar,math_score	int,reading_score int,writing_score int);

COPY exams from 'C:\Program Files\PostgreSQL\17\data\dataset1\exams.csv' delimiter ',' csv header;

select * from exams;

select * from exams
where Race = 'group B' or test_preparation_course = 'completed';

select * from exams
where Race = 'group B' and test_preparation_course = 'completed';

select race,test_preparation_course from exams
where Race = 'group B' and test_preparation_course = 'completed';

select * from exams
where math_score between 90 and 100;

select * from exams
where Race = 'group B' and test_preparation_course = 'completed' and math_score between 90 and 100;

select * from exams
where gender = 'female' or lunch = 'standard' or writing_score < 80 or math_score >= 50;

select * from exams
where race = 'group D'or race = 'group B' or race = 'group C';

select * from exams
where race in ('group B', 'group C', 'group D');

select * from exams
where race not in ('group B', 'group C', 'group D');

/* next class topic
maximum
minimum
sum
average
count
like
as
order by (sort)
limit (filter)
group by
*/

select math_score,reading_score,writing_score from exams
where math_score >= 90 and reading_score >= 90 and writing_score >= 90;

select math_score as Best_Math_Students, reading_score as Best_Reading_Students, writing_score as Best_Writing_Students from exams
where math_score >= 90 and reading_score >= 90 and writing_score >= 90;

select math_score as Best_Math_Students, reading_score as Best_Reading_Students, writing_score as Best_Writing_Students from exams
where math_score >= 90 and reading_score >= 90 and writing_score >= 90 order by 2 desc limit 3;

/* aggregate functions
round(avg(writing_score),2)
count()
max()
min()
avg()
sum()
*/

select max(math_score), max(reading_score), max(writing_score) from exams;

select min(math_score), min(reading_score), min(writing_score) from exams;

select count(math_score), count(reading_score), count(writing_score) from exams;

select avg(math_score), avg(reading_score), avg(writing_score) from exams;

select round(avg(math_score),2), round(avg(reading_score),2), round(avg(writing_score),2) from exams;

select round(sum(math_score),2), round(sum(reading_score),2), round(sum(writing_score),2) from exams;

select gender,math_score,reading_score,writing_score
from exams
where math_score >= 90 and reading_score >= 90 and writing_score >= 90
group by gender,math_score, reading_score, writing_score;

select gender, count(math_score) as math_score, count(reading_score) as reading_score, count(writing_score) as writing_score 
from exams
group by gender;

select math_score, count(math_score) as ninety_and_above_students
from exams
where math_score >= 90 
group by math_score
order by 1 desc;

select reading_score, count(reading_score) as ninety_and_above_students
from exams
where reading_score >= 90 
group by reading_score
order by 1 desc;

select writing_score, count(writing_score) as ninety_and_above_students
from exams
where writing_score >= 90 
group by writing_score
order by 1 desc;

select test_preparation_course, math_score, count(math_score) as ninety_and_above_students
from exams
where math_score >= 90 
group by test_preparation_course,math_score
order by 2 desc;

select parental_education_level, math_score, count(math_score) as ninety_and_above_students
from exams
where math_score >= 90 
group by parental_education_level, math_score
order by 2 desc;

select lunch, math_score, count(math_score) as ninety_and_above_students
from exams
where math_score >= 90 
group by lunch, math_score
order by 2 desc;

select * from exams
where parental_education_level like '%s%';

select * from exams
where parental_education_level like 's%';

select * from exams
where parental_education_level like 's___________';

select gender, lunch, test_preparation_course, writing_score 
from exams
where lunch = 'standard' and test_preparation_course = 'completed'
group by gender, lunch, test_preparation_course, writing_score
order by 1 asc;

select gender, round(avg(writing_score),2)
from exams
group by gender
order by 2 asc;

/* The having statement comes after group by unlike the where statement that comes before group by.
Also the where is limited to conditions within a single column, but having works with aggregate functions 
whereas where does not work with aggregate functions.*/

select race, count(writing_score)
from exams
group by race
having count(writing_score) > 80;




























