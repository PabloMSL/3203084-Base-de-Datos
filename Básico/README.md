## **Uso de Docker**

En este archivo documentare el paso a paso de los requisitos pedidos en la actividad. 

### **Paso a Paso**

Primero hay que instalar docker desktop buscandolo en su buscador designado

#### 1. Comandos iniciales

Primero hay que instalar las 3 bases de datos que necesitamos, las cuales son MariaDB, mySQL y Postgres

~~~

- docker pull mariadb
- docker pull mysql
- docker pull postgres

~~~

Y pasamos a crear y correr los contenedores los cuales se crean con estos siguientes comandos

~~~

- docker run -d -p3306:3306 -e --name Mariadb-container MARIADB_ROOT_PASSWORD:1234 mariadb
- docker run -d -p3307:3306 -e --name Mysql-container MYSQL_ROOT_PASSWORD:1234 mysql
- docker run -d -p5432:5432 -e --name Postgres-container POSTGRES_PASSWORD:1234 postgres

~~~

### 2. Clientes 


Para este paso instalaremos 3 clientes distintos, DBeaver, HeidiSQL y Beekeeper, en el cual accederemos a ellos y crearemos las bases de datos correspondientes a cada uno de los clientes

En este paso, conectaremos los 3 containers que teniamos, para que queden asi: (mirar las imagenes con nombre (beekeeper, heidisql y dbeaver)

Y al final crearemos bases de datos dentro de cada container asi:(ver imágenes db-dbeaver, db-heidisql y db-beekeeper)
