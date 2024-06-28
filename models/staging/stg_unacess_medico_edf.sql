SELECT
    LOWER(FECHA) AS fecha,
    LOWER(RUT) AS rut,
    CASE
        WHEN `FONASA` IS NOT NULL THEN 'FONASA'
        WHEN `SIN PREVISIÓN` IS NOT NULL THEN 'SIN PREVISIÓN'
        WHEN `ISAPRE` IS NOT NULL THEN 'ISAPRE'
        ELSE NULL
    END AS prevision,
    CASE
        WHEN HOMBRE IS NOT NULL THEN 'HOMBRE'
        WHEN MUJER IS NOT NULL THEN 'MUJER'
        ELSE NULL
    END AS gender,
    CASE
        WHEN `MUJER GESTANTE` IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS es_gestante,
    CASE
        WHEN migrante IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS migrante,
    `País origen` AS pais_origen,
    CASE
        WHEN `pueblo originario` IS NOT NULL THEN TRUE
        ELSE NULL
    END AS pueblo_originario,
    CASE
        WHEN hetero IS NOT NULL THEN 'hetero'
        WHEN homo IS NOT NULL THEN 'homo'
        WHEN bi IS NOT NULL THEN 'bi'
        ELSE NULL
    END AS orientacion,
    CASE
        WHEN INGRESO IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS es_ingreso,
    CASE
        WHEN `nueva sano` IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS es_nueva_sano,
    CASE
        WHEN CONTROL IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS es_control,
    CASE
        WHEN EGRESO IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS egreso,
    CASE
        WHEN `< 10` IS NOT NULL THEN `< 10`
        ELSE NULL
    END AS edad_minus_10,
    CASE
        WHEN `< 10` IS NOT NULL THEN '< 10'
        WHEN `10-14` IS NOT NULL THEN '10-14'
        WHEN `15-19` IS NOT NULL THEN '15-19'
        WHEN `20-24` IS NOT NULL THEN '20-24'
        WHEN `25-29` IS NOT NULL THEN '25-29'
        WHEN `30-34` IS NOT NULL THEN '30-34'
        WHEN `35 O +` IS NOT NULL THEN '35 +'
        ELSE NULL
    END AS edad,
    CASE
        WHEN `35 O +` IS NOT NULL THEN `35 O +`
        ELSE NULL
    END AS edad_35_plus,
    CASE
        WHEN CONDILOM IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS condilom,
    CASE
        WHEN HERPES IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS herpes,
    CASE
        WHEN GONORREA IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS gonorrea,
    CASE
        WHEN SIFILIS IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS sifilis,
    CASE
        WHEN `URETRITIS NO GONOCO` IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS uretritis_no_gonoco,
    CASE
        WHEN CHLAMYDIA IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS chlamydia,
    CASE
        WHEN TRICOMONAS IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS tricomonas,
    CASE
        WHEN CANDIDA IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS candida,
    CASE
        WHEN OTRAS IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS otras,
    CASE
        WHEN `CONTROL RIESGO` IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS control_riesgo,
    CASE
        WHEN `CONSEJERIA PRE` IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS consejeria_pre,
    CASE
        WHEN `CONSEJERIA POST` IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS consejeria_post,
    CASE
        WHEN `CONSEJERIA ITS` IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS consejeria_its,
    LOWER(observaciones) AS observaciones
FROM {{ ref('raw_unacess_medico_edf') }}
WHERE RUT IS NOT NULL