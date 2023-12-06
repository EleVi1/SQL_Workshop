CREATE TEMPORARY TABLE first_parse
(
    id serial,
    full_name text,
    phone text,
    email text,
    favorite text,
    created_at text
);

INSERT INTO first_parse (id, full_name, phone, email, favorite, created_at)
SELECT id,
lower(regexp_replace(full_name, '[^[a-zA-Z ]', '', 'g')),
regexp_replace(phone, '[^[0-9.-]', '', 'g'),
regexp_replace(email, '[^[:ascii:]]', '', 'g'),
regexp_replace(favorite, '[^[0-1]', '', 'g'),
regexp_replace(created_at, '[^[0-9:-]]', '', 'g')
FROM dtf.madelines_contacts_corrupted;

CREATE TEMPORARY TABLE sec_parse
(
    id serial,
    title prefix,
    first_name text,
    last_name text,
    phone text,
    email text,
    favorite boolean,
    created_at timestamp
);

INSERT INTO sec_parse (id, title, first_name, last_name, phone, email,
    favorite, created_at)
SELECT id,
CAST(upper(substring(full_name from '#"[^ ]%#" [^ ]% [^ ]%' for '#')) as prefix),
substring(full_name from '[^ ]% #"[^ ]%#" [^ ]%' for '#'),
substring(full_name from '[^ ]% [^ ]% #"[^ ]%#"' for '#'),
lpad(substring(phone from '#"[^.-]%#"[.-][^.-]%[.-][^.-]%' for '#'), 3, '0')
||'.'||
lpad(substring(phone from '[^.-]%[.-]#"[^.-]%#"[.-][^.-]%' for '#'), 3, '0')
||'.'||
lpad(substring(phone from '[^.-]%[.-][^.-]%[.-]#"[^.-]%#"' for '#'), 3, '0'),
email,
CAST(favorite as boolean),
CAST(created_at as timestamp)
FROM first_parse;

INSERT INTO dtf.madelines_contacts (id, title, first_name, last_name, phone,
    email, favorite, created_at)
SELECT id,
title,
upper(substring(first_name from '#"_#"%' for '#'))
||substring(first_name from '_#"%#"' for '#'),
upper(substring(last_name from '#"_#"%' for '#'))
||substring(last_name from '_#"%#"' for '#'),
phone,
email,
favorite,
created_at
FROM sec_parse;
