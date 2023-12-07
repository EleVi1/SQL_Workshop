SELECT filename,
    CASE WHEN decrypted = True
        THEN LEAST(rsa_time, hyper_pulse_time, quantum_x_time, aes_time, 
        d_crypt_time)
        ELSE NULL
    END as best_time,
CASE WHEN decrypted = True
        THEN GREATEST(rsa_time, hyper_pulse_time, quantum_x_time, aes_time, 
        d_crypt_time)
        ELSE NULL
    END as worst_time
FROM dtf.madelines_files_results
ORDER BY filename;
