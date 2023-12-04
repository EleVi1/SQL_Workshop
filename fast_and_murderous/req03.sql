SELECT person_id, case_id, content
FROM justice.testimonies
WHERE content LIKE '%Nexus N3%' and (content SIMILAR TO '%speeding%' or content
SIMILAR TO '%speed%' or content SIMILAR TO '%fast%' or content SIMILAR TO '%reckless%');
