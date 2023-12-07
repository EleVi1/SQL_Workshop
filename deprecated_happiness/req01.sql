CREATE SCHEMA IF NOT EXISTS migration;

--companies
CREATE TABLE if not exists migration.companies (LIKE public.companies
INCLUDING CONSTRAINTS);

INSERT INTO migration.companies (id,
    name, company_sector, description, status, building_id, bank_account_id)
SELECT
id,
name,
company_sector,
description,
status,
building_id,
bank_account_id
FROM public.companies;

--jobs
CREATE TABLE if not exists migration.jobs (LIKE public.jobs
INCLUDING CONSTRAINTS);

INSERT INTO migration.jobs (id, title, company_id, salary)
SELECT
id,
title,
company_id,
salary
FROM public.jobs;

--patients_records
CREATE TABLE if not exists migration.patients_records
(LIKE public.patients_records INCLUDING CONSTRAINTS);

INSERT INTO migration.patients_records (id, creation_date)
SELECT
id,
creation_date
FROM public.patients_records;

--medical_records_entries
CREATE TABLE if not exists migration.medical_record_entries
(LIKE public.medical_record_entries INCLUDING CONSTRAINTS);

INSERT INTO migration.medical_record_entries (id, patient_id, doctor_id,
    description, creation_date)
SELECT
id,
patient_id,
doctor_id,
description,
creation_date
FROM public.medical_record_entries;
