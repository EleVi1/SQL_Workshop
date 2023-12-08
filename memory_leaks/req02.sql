CREATE INDEX max_2
ON memorin_test.vitals (heart_rate, respiratory_rate)
WHERE heart_rate >= 117 AND respiratory_rate >= 27;
