
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2025 a las 05:45:35
-- Versión del servidor: 10.4.32-MariaDB

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital_elremedio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `Appointment_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Doctor_ID` int(11) NOT NULL,
  `Appointment_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment_treatments`
--

CREATE TABLE `appointment_treatments` (
  `Appointment_ID` int(11) NOT NULL,
  `Treatment_ID` int(11) NOT NULL,
  `Notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctors`
--

CREATE TABLE `doctors` (
  `Doctor_ID` int(11) NOT NULL,
  `Doctor_Name` varchar(255) NOT NULL,
  `Specialty_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

CREATE TABLE `patients` (
  `Patient_ID` int(11) NOT NULL,
  `Patient_Name` varchar(255) NOT NULL,
  `Patient_DOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prescriptions`
--

CREATE TABLE `prescriptions` (
  `Appointment_ID` int(11) NOT NULL,
  `Medication_Name` varchar(100) NOT NULL,
  `Dosage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialties`
--

CREATE TABLE `specialties` (
  `Specialty_ID` int(11) NOT NULL,
  `Specialty_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `treatments`
--

CREATE TABLE `treatments` (
  `Treatment_ID` int(11) NOT NULL,
  `Treatment_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`Appointment_ID`),
  ADD KEY `Doctor_ID` (`Doctor_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Indices de la tabla `appointment_treatments`
--
ALTER TABLE `appointment_treatments`
  ADD PRIMARY KEY (`Appointment_ID`,`Treatment_ID`),
  ADD KEY `Treatment_ID` (`Treatment_ID`);

--
-- Indices de la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`Doctor_ID`),
  ADD KEY `Specialty_ID` (`Specialty_ID`);

--
-- Indices de la tabla `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`Patient_ID`);

--
-- Indices de la tabla `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`Medication_Name`,`Appointment_ID`),
  ADD KEY `Appointment_ID` (`Appointment_ID`);

--
-- Indices de la tabla `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`Specialty_ID`),
  ADD UNIQUE KEY `Specialty_Name` (`Specialty_Name`);

--
-- Indices de la tabla `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`Treatment_ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctors` (`Doctor_ID`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patients` (`Patient_ID`);

--
-- Filtros para la tabla `appointment_treatments`
--
ALTER TABLE `appointment_treatments`
  ADD CONSTRAINT `appointment_treatments_ibfk_1` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointments` (`Appointment_ID`),
  ADD CONSTRAINT `appointment_treatments_ibfk_2` FOREIGN KEY (`Treatment_ID`) REFERENCES `treatments` (`Treatment_ID`);

--
-- Filtros para la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`Specialty_ID`) REFERENCES `specialties` (`Specialty_ID`);

--
-- Filtros para la tabla `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointments` (`Appointment_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
