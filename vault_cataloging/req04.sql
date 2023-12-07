SELECT
ROUND(CAST(avg(rsa) as numeric),2) as avg_rsa_time,
ROUND(CAST(avg(pulse) as numeric),2) as avg_hyper_pulse_time,
ROUND(CAST(avg(quant) as numeric),2) as avg_quantum_x_time,
ROUND(CAST(avg(aes) as numeric),2) as avg_aes_time,
ROUND(CAST(avg(crypt) as numeric),2) as avg_d_crypt_time
FROM (SELECT
COALESCE(NULLIF(rsa_time, 0), (SELECT max(rsa_time)
        FROM dtf.madelines_files_results)) as rsa,
COALESCE(NULLIF(hyper_pulse_time, 0), (SELECT max(hyper_pulse_time)
        FROM dtf.madelines_files_results)) as pulse,
COALESCE(NULLIF(quantum_x_time, 0), (SELECT max(quantum_x_time)
        FROM dtf.madelines_files_results)) as quant,
COALESCE(NULLIF(aes_time, 0), (SELECT max(aes_time)
        FROM dtf.madelines_files_results)) as aes,
COALESCE(NULLIF(d_crypt_time, 0), (SELECT max(d_crypt_time)
        FROM dtf.madelines_files_results)) as crypt
FROM dtf.madelines_files_results) as tab;
