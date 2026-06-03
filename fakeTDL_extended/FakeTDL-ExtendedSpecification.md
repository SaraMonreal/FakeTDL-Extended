# Especificación del formato de Datos FakeTDL-Extended


## Introducción
FakeTDL-Extended es un formato de datos ficticio para reflejar el funcionamiento del formato de datos y filtrado de un TDL (Tactical Data Link)



## Mensajes FakeTDL-Extended
- Track- un punto observado/estimado de un objeto en movimiento
- Identity- información sobre la entidad: amigo/enemigo, aire, tierra, mar, arma, etc.
- Ack- confirma la recepción de uno o más mensajes que requieren reconocimiento, es decir, se confirma que se han recibido uno o varios mensajes que requerían confirmación
- PPLI Aéreo (PPLI)- transmite la posición, movimiento y estado de una plataforma aérea amiga.
- PPLI de Superficie (PPLI_SURFACE)- transmite la posición y estado de unidades de superficie amigas.
- Surface Track (SURFACE_TRACK)- representa contactos de superficie detectados por sensores.
- Orden táctica (ORDER)- ernvía instrucciones básicas a una unidad
- Mensaje de texto (TEXT)- comunicación libre y flexible entre unidades.
- Estado del Enlace (LINK_STATUS)- indica el estado y calidad del enlace de una unidad. 


