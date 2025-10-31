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

- **1FN** : La 1FN busca que un valor sea unico, es la mas simple de las 3 que voy a hablar, y es muy facil de realizar, solo es verificar que ningun valor se repita.
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

El proceso de normalización se basa en el concepto de dependencia funcional (cuando el valor de un atributo determina el valor de otro). 
Las dependencias funcionales son, en esencia, las relaciones que la normalización busca estructurar o eliminar.

Su papel es definir las anomalías (problemas) de la base de datos:

- Dependencia Parcial: Define el problema a resolver en 2NF.
- Dependencia Transitiva: Define el problema a resolver en 3NF.

Para identificarlas, el artículo sugiere observar qué atributos determinan el valor de otros. Por ejemplo:

- En el caso de 3NF: Si ves que el Código Postal determina la Ciudad, pero el Código Postal no es la clave principal de la tabla, has identificado una dependencia transitiva.
- En el caso de 2NF: Si ves que un atributo (ej. nombre del cliente) depende solo de la clave del cliente, y no de la clave completa compuesta (ej. ID de Cliente + ID de Pedido), has identificado una dependencia parcial.

### 5. Explica, con tus palabras, cuándo sería justificable “desnormalizar” una base de datos según el contexto de negocio.

La desnormalización es el acto de reintroducir cierta redundancia organizada en la base de datos para acelerar las consultas de datos, a costa de una integridad ligeramente menor y más complejidad en las actualizaciones.

Se justifica cuando la velocidad de consulta y la disponibilidad inmediata de los datos son más importantes para el negocio que la organización perfecta de los datos, principalmente en dos contextos:

- Sistemas con Alta Frecuencia de Lectura (Read-Heavy): Cuando el negocio se basa en que los usuarios vean datos constantemente (ej. carga de páginas web, perfiles de usuario) y las escrituras/actualizaciones son poco frecuentes. Se desnormaliza para que los datos necesarios para una vista se agrupen en una sola tabla, evitando los costosos JOINS y cargando la información mucho más rápido.
  
- Sistemas de Reporte y Análisis (OLAP): Para acelerar la generación de informes gerenciales, dashboards y estadísticas. Se justifica almacenar datos pre-calculados (como el total de ventas diarias) directamente en una tabla, de modo que el sistema no tenga que
realizar grandes cálculos y uniones cada vez que un usuario abre un reporte.

## Parte 2: Caso Fred’s Furniture

### Retos y resultados
#### 1. Diagnostico inicial
En este reto, tengo que analizar la tabla, identificar las anomalias y describir porque ocurren.

En la tabla **furniture_sales** se puede analizar que se requieren guardar datos de una tienda, con clientes, prodductos y ventas, aunque esta tabla esta mal formulada, y voy a explicar porque:

- **Insercion**: La insercion de los items se hacen repetitivos, escribir los id en cada ocasion sabiendo que es el 1 en todo es muy redundante

- **Actualizacion**: La actualizacion de los datos se vera interrumpida en el momento de que se cruzen todos los id, si el id del item 1 es igual al id del item 3, daria errores en algunos casos

- **Eliminacion**: Al momento de eliminar datos seria confuso, y dificil, ya que tener varios datos hace dificil su busqueda, y muchas veces puede terminar en eliminar un dato que no es

- **Normalizacion**: Todo lo anterior se presenta porque no tiene Formas normales, repite datos constantemente, esta todo guardado en una sola tabla, es ineficiente, si tuviera al menos una forma normal, seria mas facil de manejar.
  
#### 2. Aplicacion de 1FN

El problema mas evidente esta en la repeticion de item_1, item_2 y item_3 cuando podria ser solo uno y ser atomico. 

Para eso separaremos a orders y items en dos tablas, asi : 

- order_id(Pk), order_date, customer_id, customer_phone, customer_email
- order_id(PK, FK), item_id, item_name, item_price

Asi quedaria una de las tablas

~~~
CREATE TABLE order_items (
  order_id INT NOT NULL,
  item_id INT NOT NULL,
  item_name VARCHAR(100),
  item_price DECIMAL(10,2),
  PRIMARY KEY (order_id, item_id) -- Clave primaria compuesta para asegurar 1FN
);
~~~

#### 3. Aplicacion de 2FN

Una tabla está en 2NF si está en 1NF y no tiene dependencias parciales. 
La dependencia parcial ocurre cuando un atributo no clave depende solo de una parte de una clave compuesta.

##### Identificación de Dependencias Parciales

En la tabla order_items (clave compuesta: order_id, item_id):
item_name y item_price dependen solo de item_id, no de la combinación completa (order_id y item_id). Es decir, el nombre y el precio del sofá son los mismos sin importar el ID del pedido.
En la tabla orders, el customer_phone y customer_email dependen solo de customer_id, no del order_id.

###### Decisión y Estructura 2NF Propuesta

Dividiremos las tablas que contienen dependencias parciales:
- customers: Contiene información que solo depende de customer_id. (customer_id (PK), customer_phone, customer_email.)
- items: Contiene información que solo depende de item_id. (item_id (PK), item_name, item_price.)
- orders: Contiene la cabecera del pedido, ahora con una FK a customers. (order_id (PK), order_date, customer_id (FK).)
- order_details: Tabla de relación que solo vincula orders con items. (order_id (PK, FK), item_id (PK, FK), y la cantidad si fuera necesaria. No necesita item_name o item_price.)

#### 4. Aplicacion de 3FN

Una tabla está en 3NF si está en 2NF y no tiene dependencias transitivas. La dependencia transitiva ocurre cuando un atributo no clave depende de otro atributo no clave.
##### Identificación de Dependencias Transitivas

Con la estructura 2NF propuesta, si la tabla customers solo tuviera customer_id, customer_city y customer_zip_code, y el customer_city dependiera del customer_zip_code (un atributo no clave), habría una dependencia transitiva.

##### Análisis de la estructura 2NF anterior:

- customers: (customer_id, customer_phone, customer_email). No hay dependencia transitiva aquí, ya que phone y email dependen directamente de customer_id.
- items: (item_id, item_name, item_price). No hay dependencia transitiva.
- orders: (order_id, order_date, customer_id). No hay dependencia transitiva.
Conclusión: La estructura resultante de 2NF ya cumple con 3NF.

##### Creación de Tablas Finales (3NF)

Utilizaremos PRIMARY KEY y FOREIGN KEY para crear el esquema final, asumiendo que el pedido solo registra la cantidad y no el precio o nombre, ya que esos datos están en la tabla items.

~~~

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_phone VARCHAR(50) UNIQUE,
  customer_email VARCHAR(255) UNIQUE
);

CREATE TABLE items (
  item_id INT PRIMARY KEY,
  item_name VARCHAR(100) NOT NULL,
  item_price DECIMAL(10,2) NOT NULL
);


CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
  order_id INT,
  item_id INT,
  quantity INT NOT NULL, -- Asumiendo que ahora se registra la cantidad
  PRIMARY KEY (order_id, item_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (item_id) REFERENCES items(item_id)
);
~~~

### Modelo E-R final
(Incluir imagen o enlace)

### Reglas de negocio
Las reglas de negocio definen cómo funciona el sistema de ventas y la relación entre las entidades:

1. Unicidad de Pedido: Cada pedido (order_id) es único y tiene una fecha específica.
2. Relación Cliente-Pedido (1:N): Un Cliente puede realizar muchos Pedidos, pero cada Pedido solo pertenece a un único Cliente.
3. Identificación de Productos: Cada producto/mueble (item_id) en el inventario tiene un nombre y un precio base únicos.
4. Composición del Pedido (N:M): Un Pedido puede contener múltiples Ítems, y un Ítem puede aparecer en múltiples Pedidos.
5. Atributos Únicos del Cliente: Cada cliente tiene un correo y un teléfono únicos para su identificación.
   
### Justificación del diseño

El diseño final de cuatro tablas fue el resultado de aplicar la normalización hasta la 3FN, eliminando las anomalías de inserción, actualización y eliminación.

| Principio de Normalización | Tablas Impactadas | Justificación y Logro |
| :--- | :--- | :--- |
| *1FN* (Atomicidad / No Repetición) | order_details | Se eliminó el *grupo repetido* de columnas (item_1, item_2, item_3) creando la tabla de enlace (order_details) para asegurar una fila por cada ítem vendido. |
| *2FN* (No Dependencia Parcial) | customers, items | Se eliminaron las *dependencias parciales. El nombre y precio del ítem dependen solo de item_id, no de la combinación completa de la clave de la tabla inicial. Esto resolvió la **anomalía de actualización* de precios y datos de clientes. |
| *3FN* (No Dependencia Transitiva) | Diseño general | La estructura resultante de 2FN ya cumplía con 3FN, ya que los atributos no clave dependían directamente de su clave primaria. |

Conclusión: Este diseño garantiza la integridad de los datos y facilita la gestión de inventario y pedidos, ya que la información clave (clientes, ítems) solo existe en un lugar, cumpliendo con los estándares de diseño relacional.

## Parte 3: Proyecto personal

### Título y descripción
#### Hospital_ElRemedio
Este proyecto consiste en el diseño y la implementación de un modelo de base de datos relacional (DBMS) para gestionar las citas, los registros de pacientes, el personal médico y los tratamientos dentro de un entorno hospitalario. El objetivo principal es eliminar la redundancia de datos y garantizar la integridad mediante la normalización hasta la Tercera Forma Normal (3FN).

### Diagrama E-R
(Imagen o enlace)

### Reglas de negocio y justificación
El diseño de la base de datos se basa en las siguientes reglas operacionales del hospital:

1.  *RB1:* Cada Paciente, Doctor, Especialidad y Tratamiento es identificado de manera única.
2.  *RB2:* Un Paciente puede tener múltiples Citas, y cada Cita es atendida por un Doctor.
3.  *RB3:* Un Doctor se especializa en una única Especialidad, pero una Especialidad es cubierta por varios Doctores.
4.  *RB4:* Una Cita puede incluir múltiples Tratamientos, y un Tratamiento puede ser parte de muchas Citas (relación N:M).
5.  *RB5:* A un paciente se le pueden recetar múltiples Medicamentos por Cita.

El modelo inicial fue descompuesto a 3FN para optimizar el almacenamiento y evitar inconsistencias:

| Principio de Normalización | Tablas Impactadas | Logro |
| :--- | :--- | :--- |
| *1FN* (Atomicidad / No Repetición) | appointment_treatments, prescriptions | Se eliminó la repetición horizontal de columnas (Medication_1, Medication_2, etc.) mediante la creación de tablas de enlace con claves compuestas. |
| *2FN* (No Dependencia Parcial) | patients, doctors, treatments | Se separaron los atributos que dependían solo de una parte de la clave compuesta de la cita (ej. El nombre del Doctor solo depende de Doctor_ID, no de la combinación completa de la cita). |
| *3FN* (No Dependencia Transitiva) | specialties | Se aisló la información de la especialidad para asegurar que ningún atributo no clave dependa de otro atributo no clave (ej. que el piso del departamento no dependa del nombre de la Especialidad, sino directamente de su ID). |

Este diseño asegura que los datos del catálogo (ej. treatments, doctors) y los datos transaccionales (appointments) permanezcan limpios y fáciles de mantener.
