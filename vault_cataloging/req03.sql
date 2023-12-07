SELECT filename,
LEAST(rsa_time, hyper_pulse_time, quantum_x_time, aes_time, d_crypt_time)
as best_time,
GREATEST(rsa_time, hyper_pulse_time, quantum_x_time, aes_time, d_crypt_time)
as worst_time
FROM dtf.madelines_files_results
ORDER BY filename;
