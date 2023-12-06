CREATE TYPE public.prefix as ENUM (
    'MRS',
    'MS',
    'MR',
    'DR'
);

CREATE TABLE if not exists dtf.madelines_contacts
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
