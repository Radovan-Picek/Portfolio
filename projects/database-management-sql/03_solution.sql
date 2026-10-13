ATTACH 'data/database.duckdb' AS mydb;
USE mydb;


-- CREATE THE FUNCTION
CREATE OR REPLACE MACRO net_order_value(
    p_mandt,
    p_ebeln,
    p_d_time
) AS (
    SELECT
        SUM(
            COALESCE(
                (
                    SELECT CAST(p.VALUE_OLD AS DOUBLE)
                    FROM CDHDR h
                    JOIN CDPOS p
                      ON h.OBJECTCLAS = p.OBJECTCLAS
                     AND h.OBJECTID = p.OBJECTID
                     AND h.CHANGENR = p.CHANGENR
                    WHERE p.TABNAME = 'EKPO'
                      AND p.FNAME = 'NETWR'
                      AND p.TABKEY = e.MANDT || e.EBELN || e.EBELP
                      AND CAST(h.UDATE AS DATE) > CAST(p_d_time AS DATE)
                    ORDER BY h.UDATE, h.UTIME, h.CHANGENR
                    LIMIT 1
                ),
                (
                    SELECT CAST(p.VALUE_NEW AS DOUBLE)
                    FROM CDHDR h
                    JOIN CDPOS p
                      ON h.OBJECTCLAS = p.OBJECTCLAS
                     AND h.OBJECTID = p.OBJECTID
                     AND h.CHANGENR = p.CHANGENR
                    WHERE p.TABNAME = 'EKPO'
                      AND p.FNAME = 'NETWR'
                      AND p.TABKEY = e.MANDT || e.EBELN || e.EBELP
                      AND CAST(h.UDATE AS DATE) <= CAST(p_d_time AS DATE)
                    ORDER BY h.UDATE DESC, h.UTIME DESC, h.CHANGENR DESC
                    LIMIT 1
                ),
                e.NETWR
            )
        )
    FROM EKPO e
    WHERE e.MANDT = p_mandt
      AND e.EBELN = p_ebeln
);

-- TRY THE FUNCTION ON SEVERAL EXAMPLES ON DATA

SELECT net_order_value(
    '010',
    '0072109409',
    DATE '2021-01-01'
);

SELECT net_order_value(
    '010',
    '0072109409',
    DATE '2021-01-01'
);

SELECT net_order_value(
    '010',
    '0072099424',
    DATE '2020-02-22'
);






