# Proyecto de Normalización de Bases de Datos
### Juan Pablo Mozuca Chaparro 
### 3203084 - ADSO - SENA CBA
## Parte 1: Análisis conceptual – Devart
### 1. ¿Qué problema principal busca resolver la normalización en una base de datos y por qué es crítica en sistemas empresariales?

La normalizacion busca resolver el desorden y la redundancia, mediante las FN, o formas normales, las cuales priorizan una base de datos estructurada, facil de actualizar, y un sistema rapido, lo cual no se puede con una base de datos no normalizada.

En las empresas esto es critico, para un manejo bien estructurado de la base de datos de la empresa, cosa que tambien permite que si suceden errores estos sean mas rapidos de resolver.

Una base de datos normalizada dentro de una empresa hace la diferencia para una empresa, busca ser rapida y no redundante, y para las empresas esto les viene como anillo al dedo.

### 2. Describe con tus propias palabras las diferencias entre 1NF, 2NF y 3NF según los ejemplos del artículo.

Aunque si bien las FN, se necesitan la una a la otra para una normalizacion bien hecha, y coherente, estas pueden tener diferencias con respecto a las otras, como voy a explicar a continuación:

- **1FN** : La 1FN busca que un valor sea unico, es la mas simple de las 3 que voy a hablar y hoy, y es muy facil de realizar, solo es verificar que ningun valor se repita.
- **2FN** : La 2FN es buscar que no se repitan campos innecesarios en otras tablas, independiente si el valor es unico dentro de una tabla, lo que busca que no haya campos repetidos de manera innecesaria
- **3FN** : La 3FN busca que todos los datos dependan del dato principal, y no de cualquier otra cosa, básicamente independientemente si el valor es unico y no repetido, tiene que tener coherencia con la información de la tabla.

- **Diferencias** :
- La 1FN, siendo la mas basica, y la mas facil de implementar, obviamente no es la mas efectiva, de que sirve que un valor sea unico, si se repite y no tiene coherencia, es como juntar varias cosas, unicas claro, pero no donde van, como una caja de herramientas con un monton de cosas que no tienen nada que ver, es la mas facil, pero si se implementa sola, es muy poco efectiva.

- La 2FN si o si, se necesita aplicar con la 1FN, hace parte de sus reglas, y es dependiente de esta para funcionar, ayuda a que no hayan campos repetidos en tablas diferentes, para evitar asi la sobrecarga de información, y estructurar mejor las tablas, pero si no se le aplican el resto de las FN, es inutil que no repitas campos, si al final, no tienen nada que ver, seria raro.

- La 3FN se aplica si o si con las 2FN hechas, esta ayuda a que haya coherencia, perfecto, seria lo mejor, con las 3FN ya esta bastante bien equilibrado el sistema, es efectiva, es facil de realizar, es perfecta para comenzar a entender las FN, hasta la 3.

### 3. En los ejemplos de Devart, identifica una situación donde la normalización mejora la integridad de datos, pero podría afectar el rendimiento. Explica el motivo.

Una situación clave es la transición de 3NF a la Forma Normal de Boyce-Codd (BCNF), como se ilustra en el ejemplo de la tabla de direcciones de clientes.

- **Mejora de la Integridad de Datos:** Al descomponer la tabla de direcciones (que tiene ID de Cliente, Ciudad y Código Postal) en dos tablas más pequeñas (una para ID de Cliente y Código Postal y otra para la relación Código Postal y Ciudad), se elimina la redundancia. Esto resuelve la anomalía de actualización que ocurre si, por ejemplo, el nombre de una ciudad cambia por una reestructuración administrativa, ya que solo se necesitaría actualizar una única fila en la nueva tabla, en lugar de múltiples filas repetidas en la tabla original.

- **Afectación al Rendimiento:** Este proceso de descomposición de una tabla ancha en dos o más tablas delgadas inevitablemente obliga al sistema a realizar una operación de JOIN (unión) cada vez que se necesite consultar la información completa del cliente (ID, Ciudad y Código Postal juntos). Las operaciones de JOIN son generalmente más costosas en términos de procesamiento y tiempo de consulta que leer la información de una sola tabla, lo que potencialmente ralentiza la aplicación en contextos de lectura intensa.

### 4. ¿Qué papel juegan las dependencias funcionales en el proceso de normalización y cómo las identificarías en una tabla?

### 5. Explica, con tus palabras, cuándo sería justificable “desnormalizar” una base de datos según el contexto de negocio.

## Parte 2: Caso Fred’s Furniture
### Retos y resultados
(Descripción de cada reto, decisiones y código relevante)
### Modelo E-R final
(Incluir imagen o enlace)
### Reglas de negocio
(Enumerar reglas derivadas)
### Justificación del diseño
(Explicar decisiones de normalización)

## Parte 3: Proyecto personal
### Título y descripción
(Breve resumen)
### Diagrama E-R
(Imagen o enlace)
### Reglas de negocio y justificación
(Análisis final)
