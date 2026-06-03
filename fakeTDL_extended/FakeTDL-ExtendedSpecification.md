# Especificación del formato de Datos FakeTDL-Extended


## Introducción
FakeTDL-Extended es un formato de datos ficticio para reflejar el funcionamiento del formato de datos y filtrado de un TDL (Tactical Data Link)



## Mensajes FakeTDL-Extended
- Track - un punto observado/estimado de un objeto en movimiento
- Identity - información sobre la entidad: amigo/enemigo, aire, tierra, mar, arma, etc.
- Ack - confirma la recepción de uno o más mensajes que requieren reconocimiento, es decir, se confirma que se han recibido uno o varios mensajes que requerían confirmación
- PPLI Aéreo (PPLI) - transmite la posición, movimiento y estado de una plataforma aérea amiga.
- PPLI de Superficie (PPLI_SURFACE) - transmite la posición y estado de unidades de superficie amigas.
- Surface Track (SURFACE_TRACK) - representa contactos de superficie detectados por sensores.
- Orden táctica (ORDER) - envía instrucciones básicas a una unidad
- Mensaje de texto (TEXT) - comunicación libre y flexible entre unidades.
- Estado del Enlace (LINK_STATUS) - indica el estado y calidad del enlace de una unidad. 


Todos los mensajes comienzan con:
messageType — 1 carácter (T, D o A para Track, IDentity, Ack)
source unit number — 5 caracteres
message send time — hora de envío
El resto depende del tipo de mensaje.

## Campos del Track Message
- source: unidad que envía el mensaje
- sendTime: hora de envío
- mustAck: si requiere ACK
- messageID: ID para ACK


- sourceLat: Posición del observador (float 32-bit)
- sourceLon: Posición del observador (float 32-bit)
- sourceElev: Elevación del observador (2 bytes signed)
- trackNum: Identificador del objeto observado (5 chars)
- time: Hora de la observación (3 bytes BCD)
- lat/lon: Latitud y longitud del objeto observado (float)
- elev: Elevación del objeto observado (int)
- pointType: Tipo de punto (S/E/W, 1 char)
- quality: Calidad de la observación (E/A, 1 char)
- course: Rumbo 0–359 (2 bytes unsigned)
- speed: Velocidad 0–2000 (2 bytes unsigned)

## Campos del Identity Message
- source: unidad que envía el mensaje
- sendTime: hora de envío
- mustAck: si requiere ACK
- messageID: ID para ACK


- trackNum: a qué entidad describe
- time: hora de observación
- iff: friend/enemy/unknown
- cat: categoría (aire, tierra, etc.)
- type: tipo numérico
- desc: descripción textual


## Campos del ACK
- source: unidad que envía el mensaje
- sendTime: hora de envío
- mustAck: si requiere ACK
- messageID: ID para ACK


- dest: a quien va dirigidio el ACK
- ackID: Lista de messageID reconocidos
- tem: un messageID reconocido


## Campos del PPLI Aéreo (PPLI)
- unit_id
- type — {FIGHTER, BOMBER, AWACS, C2, TANKER… }
- lat
- lon
- alt
- speed
- heading
- status — {OPERATIONAL, DAMAGED, OUT_OF_ACTION}
- fuel_state — {HIGH, MEDIUM, LOW}
- link_status — {OK, DEGRADED, LOST}


## Campos del PPLI de Superficie (SURFACE_PPLI)
- unit_id
- type — {SHIP, VEHICLE, SAM_SITE, HQ… }
- lat
- lon
- course (similar a heading)
- speed
- status — {OPERATIONAL, DAMAGED, OUT_OF_ACTION}
- fuel_state — {HIGH, MEDIUM, LOW, NONE} (none si es estático)
- link_status — {OK, DEGRADED, LOST}  

      
## Campos del Air Track (AIR_TRACK)
- track_id
- source_id
- lat
- lon
- alt
- speed
- heading
- classification — {FRIEND, HOSTILE, UNKNOWN}
- confidence — 0–100


## Campos del Surface Track (SURFACE_TRACK)
- track_id
- source_id
- lat
- lon
- type_estimate — { SHIP, VEHICLE, SAM_SITE, HQ, UNKNOWN… }
- threat_level — {LOW, MEDIUM, HIGH} (date cuenta que en el de Air Track no hay campo de amenaza y aquí sí, esto suele ser así en los TDL porque en el aire es todo mucho más subjetivo que en tierra)


## Campos de la Orden Táctica (ORDER)
- order_id
- order_type — {PATROL, INTERCEPT, HOLD, INVESTIGATE, REFUEL}
- to_unit
- ref_lat
- ref_lon
- ref_alt
- parameters



## Campos del Mensaje de Texto (TEXT)
- from_unit
- to_unit
- text (aquí tendrías que poner un límite, como un tweet o algo así, 300 caracteres por ejemplo)


## Campos del Estado de Enlace (LINK_STATUS)
- unit_id
- sync — {OK, LOST, RECOVERING}
- rx_quality — 0–100
- tx_quality — 0–100


