CREATE SCHEMA IF NOT EXISTS rr_times;
CREATE TABLE if not exists rr_times.locales
(
    language_code char(2) NOT NULL,
    country_code char(2) NOT NULL,
    name varchar(50) UNIQUE NOT NULL,

    UNIQUE (language_code, country_code)
);

CREATE TABLE if not exists rr_times.translated_articles
(
    id serial PRIMARY KEY,
    title text NOT NULL,
    body text NOT NULL
);
