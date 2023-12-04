SELECT *
FROM (
VALUES
('a', 2),
('a', 4),
('b', 1),
('b', 2),
('b', 3),
('c', 1)
) AS answers(question, choice);
