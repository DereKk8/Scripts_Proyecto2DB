SELECT A1.CODIGO, A1.ETAPAS, RECLAMO_EN_DISPUTA.RESULTADO_ETAPA
FROM
(SELECT RECLAMO.CODIGO, COUNT(RECLAMO_EN_DISPUTA.ETAPA) AS ETAPAS
FROM RECLAMO
INNER JOIN RECLAMO_EN_DISPUTA
ON RECLAMO_EN_DISPUTA.RECLAMO_CODIGO=RECLAMO.CODIGO
GROUP BY RECLAMO.CODIGO)A1
INNER JOIN RECLAMO_EN_DISPUTA
ON RECLAMO_EN_DISPUTA.RECLAMO_CODIGO=A1.CODIGO
