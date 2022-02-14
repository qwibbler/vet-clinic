/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select * from animals where date_of_birth between '2016-01-01' and '2019-12-31';
select * from animals where neutered and escape_attempts < 3;
select * from animals where name in ('Agumon', 'Pikachu');
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered;
select * from animals where not name = 'Gabumon';
select * from animals where weight_kg between 10.4 and 17.3;