CREATE TABLE if not exists rr_times.translated_headlines
(
    id serial UNIQUE,
    title text,
    subtitle text
);

CREATE TABLE if not exists rr_times.issues
(
    id serial UNIQUE,
    issued_at date,
    language varchar(2),
    country varchar(2),
    FOREIGN KEY (
        language, country)
    REFERENCES rr_times.locales (language_code, country_code) ON DELETE SET NULL,
    translated_headline_id serial
    REFERENCES rr_times.translated_headlines (id) ON DELETE RESTRICT,

    UNIQUE (issued_at, language, country)
);
