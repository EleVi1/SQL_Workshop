CREATE SCHEMA nexus;
CREATE SCHEMA nexus_food;
CREATE SCHEMA nexus_it;
CREATE SCHEMA techwave;
CREATE SCHEMA finstar;
CREATE SCHEMA guardforce;

CREATE TYPE nexus.position as ENUM (
    'JUNIOR',
    'SENIOR',
    'MANAGER',
    'DIRECTOR'
);

CREATE TYPE nexus.relationship_type as ENUM (
    'PARENT',
    'SUBSIDIARY',
    'AFFILIATE'
);

CREATE TYPE nexus_food.nutriscore as ENUM (
    'A',
    'B',
    'C',
    'D',
    'E'
);

CREATE TABLE public.employees
(
    id integer,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position,
    salary numeric(10,2)
);

CREATE TABLE nexus.nexus_relations
(
    id integer,
    parent_company varchar(25),
    child_company varchar(25),
    relationship_type nexus.relationship_type
);

CREATE TABLE nexus_it.software_assets
(
    id integer,
    software_name varchar(50),
    license_key uuid,
    expiration_date date
);

CREATE TABLE techwave.project_milestones
(
    id integer,
    milestone_name varchar(50),
    due_date date,
    completion_status boolean
);

CREATE TABLE finstar.investments
(
    id integer,
    investment_name varchar(50),
    investment_type varchar(25),
    amount_invested numeric(15,5),
    date_invested date
);

CREATE TABLE nexus_food.products
(
    id integer,
    product_name varchar(25),
    product_nutriscore nexus_food.nutriscore
);

CREATE TABLE guardforce.incident_reports
(
    id integer,
    incident_description text,
    incident_date timestamp,
    incident_location varchar(50),
    reported_by varchar(50)
);
