UPDATE colegio SET nombre = 'PAS' WHERE id = 7
UPDATE colegio SET nombre = 'MAS' WHERE id = 8

UPDATE mesa SET votos_nulos = 1, votos_vacios = 1 WHERE id = 'B'
UPDATE mesa SET colegio_id = 'C' WHERE id = '1'

UPDATE votante SET nombre = 'Elmer Figeroa' WHERE id = 'MEG46OEA4UN9HF'
UPDATE votante SET tipo_id = 'P', nacionalidad_mexicana = False, mesa_id = 'A' WHERE id = 'ORK59IXO7YC1FK'

UPDATE miembro SET presidente = True, votante_id = 'RHP16GAL6QK5RK' WHERE votante_id = 'MGW55LAF5IG9XU'
UPDATE miembro SET presidente = False, votante_id = 'QNM88OCD0UQ4IS' WHERE votante_id = 'TPZ27NEC2EL4TE'

UPDATE suplente SET sustituye_id = 'RHP16GAL6QK5RK' WHERE votante_id = 'MGW55LAF5IG9XU'
UPDATE suplente SET sustituye_id = 'QNM88OCD0UQ4IS' WHERE votante_id = 'TPZ27NEC2EL4TE'

UPDATE partido SET siglas = 'MOR', nombre = 'Morena' WHERE siglas = 'NA'

UPDATE apoderado set partido_siglas = 'MOR' WHERE ine = 'ADA62WIR5FS5N'
UPDATE apoderado set partido_siglas = 'MOR' WHERE ine = 'MTM96YHT7TB4JR'
UPDATE apoderado set partido_siglas = 'MOR' WHERE ine = 'NMD20UXX4XH4TG'

UPDATE votacion_municipal set votos = 5 WHERE mesa_id = 'A' AND partido_siglas = 'PRI' AND fecha = '2016-06-01'
UPDATE votacion_municipal set votos = 2 WHERE mesa_id = 'A' AND partido_siglas = 'PAN' AND fecha = '2016-06-01'

UPDATE votacion_federal set votos = 1 WHERE mesa_id = 'C' AND partido_siglas = 'PAN' AND fecha = '2019-06-01'
UPDATE votacion_federal set votos = 9 WHERE mesa_id = 'C' AND partido_siglas = 'PRI' AND fecha = '2019-06-01'