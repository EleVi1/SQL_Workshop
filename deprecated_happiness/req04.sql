ALTER TABLE migration.patients_records
ADD person_id serial REFERENCES public.people (id);
ALTER TABLE migration.patients_records
ADD CONSTRAINT patient_not_null CHECK(id IS NOT NULL);

UPDATE migration.patients_records
SET person_id = medical_confidential.patients_ids.person_id
FROM medical_confidential.patients_ids
WHERE id = patient_id;
