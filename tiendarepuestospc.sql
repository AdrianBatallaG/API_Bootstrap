-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.4.0-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tiendarepuestospc
CREATE DATABASE IF NOT EXISTS `tiendarepuestospc` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `tiendarepuestospc`;

-- Volcando estructura para tabla tiendarepuestospc.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `ClienteID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`ClienteID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla tiendarepuestospc.clientes: ~5 rows (aproximadamente)
INSERT INTO `clientes` (`ClienteID`, `Nombre`, `Apellido`, `Direccion`, `Ciudad`, `Telefono`, `Email`) VALUES
	(2, 'Ana', 'Schmidt', 'Calle Los Claveles 123', 'Quito', '0987654321', 'anschmidt@email.com'),
	(3, 'Luis', 'Fernandez', 'Avenida Universitaria 456', 'Guayaquil', '0984567890', 'lfernandez@email.com'),
	(5, 'Pedro', 'Gonzalez', 'Barrio Centro, Calle Rocafuerte 789', 'Loja', '0987890123', 'pgonzalez@email.com'),
	(6, 'María', 'Jaramillo', 'Conjunto Habitacional La Floresta Etapa 2 Casa 10', 'Ambato', '0983456789', 'mjramillo@email.com'),
	(16, 'James', 'Bond', 'Calle Secreta 007', 'Londres', '456-789-0123', 'james.bond@agente.com');

-- Volcando estructura para tabla tiendarepuestospc.detalleventas
CREATE TABLE IF NOT EXISTS `detalleventas` (
  `DetalleID` int(11) NOT NULL AUTO_INCREMENT,
  `VentaID` int(11) DEFAULT NULL,
  `ProductoID` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  `PrecioUnitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`DetalleID`),
  KEY `VentaID` (`VentaID`),
  KEY `ProductoID` (`ProductoID`),
  CONSTRAINT `detalleventas_ibfk_1` FOREIGN KEY (`VentaID`) REFERENCES `ventas` (`VentaID`) ON DELETE CASCADE,
  CONSTRAINT `detalleventas_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla tiendarepuestospc.detalleventas: ~4 rows (aproximadamente)
INSERT INTO `detalleventas` (`DetalleID`, `VentaID`, `ProductoID`, `Cantidad`, `PrecioUnitario`) VALUES
	(14, 6, 2, 1, 2999.99),
	(15, 10, 3, 4, 149.99),
	(17, 4, 5, 3, 199.99),
	(18, 7, 6, 2, 129.99);

-- Volcando estructura para tabla tiendarepuestospc.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `EmpleadoID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Cargo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EmpleadoID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla tiendarepuestospc.empleados: ~6 rows (aproximadamente)
INSERT INTO `empleados` (`EmpleadoID`, `Nombre`, `Apellido`, `Telefono`, `Email`, `Cargo`) VALUES
	(1, 'Ana', 'Lopez', '555123456', 'ana.lopez@example.com', 'Vendedor'),
	(7, 'María Rodriguez', 'Sánchez', '(555) 555-1234', 'mrodriguez@email.com', 'Desarrolladora Web'),
	(8, 'Pedro Ramírez', 'Diaz', '(555) 555-5678', 'pramirez@email.com', 'Gerente de Ventas'),
	(9, 'Isabella Johnson', 'Lee', '(555) 555-9012', 'ijohnson@email.com', 'Contadora'),
	(10, 'Ahmed Hassan', 'Ali', '(555) 555-2345', 'ahassan@email.com', 'Representante de Servicio al Cliente'),
	(11, 'Chloe Dubois', 'Dupont', '(555) 555-7890', 'cdubois@email.com', 'Diseñadora Gráfica');

-- Volcando estructura para tabla tiendarepuestospc.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `ProductoID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `ProveedorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductoID`),
  KEY `ProveedorID` (`ProveedorID`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ProveedorID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla tiendarepuestospc.productos: ~21 rows (aproximadamente)
INSERT INTO `productos` (`ProductoID`, `Nombre`, `Descripcion`, `Precio`, `Stock`, `ProveedorID`) VALUES
	(1, 'Tarjeta Gráfica', 'NVIDIA GeForce GTX 1660', 299.99, 10, 1),
	(2, 'Procesador Intel Core i9', 'Procesador Intel Core i9 de décima generación con 8 núcleos y 16 hilos.', 4999.99, 50, 1),
	(3, 'Tarjeta Madre ASUS ROG Strix', 'Tarjeta madre gaming con soporte para procesadores Intel y AMD.', 2999.99, 30, 2),
	(4, 'Memoria RAM Corsair Vengeance 16GB', 'Memoria RAM DDR4 de 16GB a 3200MHz.', 149.99, 100, 3),
	(5, 'Disco Duro SSD Samsung 1TB', 'SSD Samsung 970 EVO Plus de 1TB NVMe M.2.', 199.99, 75, 4),
	(6, 'Tarjeta Gráfica NVIDIA RTX 3080', 'Tarjeta gráfica NVIDIA GeForce RTX 3080 con 10GB GDDR6X.', 5999.99, 20, 5),
	(7, 'Fuente de Poder EVGA 750W', 'Fuente de poder EVGA 750W 80 Plus Gold.', 129.99, 60, 6),
	(8, 'Gabinete NZXT H510', 'Gabinete NZXT H510 ATX Mid Tower.', 99.99, 40, 1),
	(9, 'Refrigeración Líquida Corsair H100i', 'Refrigeración líquida para CPU Corsair Hydro Series H100i RGB Platinum.', 159.99, 25, 2),
	(10, 'Tarjeta de Sonido Creative Sound Blaster', 'Tarjeta de sonido Creative Sound Blaster Audigy FX.', 79.99, 15, 3),
	(11, 'Unidad Óptica LG DVD', 'Unidad óptica LG DVD-RW interna.', 29.99, 100, 4),
	(12, 'Adaptador Wi-Fi TP-Link', 'Adaptador Wi-Fi USB TP-Link Archer T3U Plus.', 49.99, 80, 5),
	(13, 'Mouse Gaming Logitech G502', 'Mouse gaming Logitech G502 HERO con sensor de 16,000 DPI.', 89.99, 120, 6),
	(14, 'Teclado Mecánico Razer BlackWidow', 'Teclado mecánico Razer BlackWidow con switches verdes.', 119.99, 45, 1),
	(15, 'Monitor Dell 27"', 'Monitor Dell 27" 4K UHD con tecnología IPS.', 399.99, 50, 2),
	(16, 'Enfriador CPU Noctua NH-D15', 'Enfriador de CPU Noctua NH-D15 de doble torre.', 99.99, 35, 3),
	(17, 'Cables SATA III 6Gbps', 'Cables SATA III de 6Gbps, paquete de 5 unidades.', 19.99, 150, 4),
	(18, 'Controlador RGB NZXT Hue 2', 'Controlador RGB para PC NZXT Hue 2.', 59.99, 55, 5),
	(19, 'Pastas Térmicas Arctic MX-4', 'Pasta térmica Arctic MX-4 de alto rendimiento.', 9.99, 200, 6),
	(20, 'Adaptador USB-C a HDMI', 'Adaptador USB-C a HDMI compatible con 4K.', 24.99, 90, 1),
	(21, 'Webcam Logitech C920', 'Webcam Logitech C920 HD Pro para videoconferencias.', 89.99, 70, 2);

-- Volcando estructura para tabla tiendarepuestospc.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `ProveedorID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`ProveedorID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla tiendarepuestospc.proveedores: ~6 rows (aproximadamente)
INSERT INTO `proveedores` (`ProveedorID`, `Nombre`, `Direccion`, `Ciudad`, `Telefono`, `Email`) VALUES
	(1, 'Tech Supplies', 'Avenida Siempre Viva 456', 'Ciudad Ficticia', '987654321', 'contacto@techsupplies.com'),
	(2, 'Suministros Tecnológicos Ramirez', 'Calle Principal, No. 123', 'San José', '(555) 555-3456', 'SMR@email.com'),
	(3, 'Papelería El Éxito', 'Avenida Central, No. 789', 'Ciudad de Panamá', '(555) 555-0987', 'PEE@email.com'),
	(4, 'Mobiliario de Oficina Garcia', 'Calle Libertad, No. 456', 'Guadalajara', '(555) 555-2345', 'MdOG@email.com'),
	(5, 'Imprenta Digital Express', 'Avenida Insurgentes, No. 101', 'Monterrey', '(555) 555-6789', 'IDE@email.com'),
	(6, 'Soluciones de Seguridad Lopez', 'Calle Independencia, No. 321', 'Buenos Aires', '(555) 555-5678', 'SdSL@email.com');

-- Volcando estructura para tabla tiendarepuestospc.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `VentaID` int(11) NOT NULL AUTO_INCREMENT,
  `ClienteID` int(11) DEFAULT NULL,
  `EmpleadoID` int(11) DEFAULT NULL,
  `Fecha` date NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`VentaID`),
  KEY `ClienteID` (`ClienteID`),
  KEY `EmpleadoID` (`EmpleadoID`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`) ON DELETE CASCADE,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`EmpleadoID`) REFERENCES `empleados` (`EmpleadoID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla tiendarepuestospc.ventas: ~4 rows (aproximadamente)
INSERT INTO `ventas` (`VentaID`, `ClienteID`, `EmpleadoID`, `Fecha`, `Total`) VALUES
	(4, 6, 9, '2024-05-11', 995.80),
	(6, 3, 11, '2023-12-15', 1572.50),
	(7, 6, 7, '2024-01-16', 2513.40),
	(10, 3, 9, '2024-03-25', 5486.23);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
