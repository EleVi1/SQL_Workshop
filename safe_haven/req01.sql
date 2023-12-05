CREATE TABLE banking_transactions_poc
(
    -- FIXME: add checks when needed
    id serial PRIMARY KEY,
    sender varchar(22) NOT NULL,
    receiver varchar(22) NOT NULL,
    amount numeric(16, 2) NOT NULL,

    CHECK (amount > 0),
    CHECK (sender SIMILAR TO ('RR([0-9]{2,})([A-Z]{4,})([0-9]{14,})')),
    CHECK (receiver SIMILAR TO ('RR([0-9]{2,})([A-Z]{4,})([0-9]{14,})')),
    CHECK (sender != receiver)
);
