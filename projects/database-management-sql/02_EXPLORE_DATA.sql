
select *
from ekpo;

select *
from ekko;

select *
from cdhdr;

select *
from cdpos;

DESCRIBE ekko;

DESCRIBE ekpo;

DESCRIBE cdhdr;

DESCRIBE cdpos;


SELECT
    FNAME,
    VALUE_OLD,
    VALUE_NEW
FROM cdpos
WHERE CHANGENR = '0052035783'
  AND TABNAME = 'EKPO';


SELECT *
FROM ekpo
WHERE EBELN = '0076052494';




SELECT
    h.UDATE,
    h.UTIME,
    h.CHANGENR,
    p.TABKEY,
    p.VALUE_OLD,
    p.VALUE_NEW
FROM CDHDR h
JOIN CDPOS p
  ON h.OBJECTCLAS = p.OBJECTCLAS
 AND h.OBJECTID = p.OBJECTID
 AND h.CHANGENR = p.CHANGENR
WHERE p.TABNAME = 'EKPO'
  AND p.FNAME = 'NETWR'
  AND p.TABKEY LIKE '0100072099424%'
ORDER BY h.UDATE, h.UTIME, h.CHANGENR;
SELECT
    e.EBELN,
    e.EBELP,
    e.NETWR AS current_netwr,

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
              AND CAST(h.UDATE AS DATE) > DATE '2020-02-22'
            ORDER BY h.UDATE, h.UTIME, h.CHANGENR
            LIMIT 1
        ),
        e.NETWR
    ) AS historical_netwr

FROM EKPO e
WHERE e.MANDT = '010'
  AND e.EBELN = '0072099424'
ORDER BY e.EBELP;

