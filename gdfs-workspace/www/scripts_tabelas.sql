CREATE TABLE `categoria` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`categoria` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`bandeirada` DOUBLE NULL DEFAULT NULL,
	`valor_hora` DOUBLE NULL DEFAULT NULL,
	`valor_km` DOUBLE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=6
;

CREATE TABLE `cidade` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=5
;

CREATE TABLE `cidade_categoria` (
	`cidade_id` INT(10) UNSIGNED NOT NULL,
	`categoria_id` INT(10) UNSIGNED NOT NULL,
	INDEX `fk_cidade_categoria_categoria` (`categoria_id`) USING BTREE,
	INDEX `fk_cidade_categoria_cidade` (`cidade_id`) USING BTREE,
	CONSTRAINT `fk_cidade_categoria_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `gdfs`.`categoria` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `fk_cidade_categoria_cidade` FOREIGN KEY (`cidade_id`) REFERENCES `gdfs`.`cidade` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

CREATE TABLE `historico` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`data_hora` DATETIME NOT NULL,
	`endereco_origem` TINYTEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`endereco_destino` TINYTEXT NOT NULL COLLATE 'latin1_swedish_ci',
	`categoria_id` INT(10) UNSIGNED NOT NULL,
	`cidade_id` INT(10) UNSIGNED NOT NULL,
	`tarifa` DOUBLE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `categoria_id` (`categoria_id`) USING BTREE,
	INDEX `cidade_id` (`cidade_id`) USING BTREE,
	CONSTRAINT `fk_historico_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `gdfs`.`categoria` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `fk_historico_cidade` FOREIGN KEY (`cidade_id`) REFERENCES `gdfs`.`cidade` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


