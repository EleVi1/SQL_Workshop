SELECT person_id, justice.cases.id, content, description
FROM justice.testimonies, justice.cases
WHERE case_id = justice.cases.id and content LIKE '%Nexus N3%'
and (description SIMILAR TO '%speeding%'
or description SIMILAR TO '%speed%' or description SIMILAR TO '%fast%'
or description SIMILAR TO '%reckless%');
