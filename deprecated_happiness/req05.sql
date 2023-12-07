UPDATE migration.medical_record_entries
SET description = 
    CASE WHEN length(description) > 100
        THEN substring(description from '^.{97}')||'...'
    ELSE
        description
    END;

ALTER TABLE migration.medical_record_entries
ALTER COLUMN description SET DATA TYPE VARCHAR(100);
