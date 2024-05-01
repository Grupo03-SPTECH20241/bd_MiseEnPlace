-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`recheio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`recheio` (
  `id_recheio` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `preco` VARCHAR(45) NULL,
  PRIMARY KEY (`id_recheio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`massa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`massa` (
  `id_massa` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id_massa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cobertura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cobertura` (
  `id_cobertura` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cobertura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`unidade_medida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`unidade_medida` (
  `id_unidade_medida` INT NOT NULL,
  `unidade_medida` VARCHAR(45) NULL,
  PRIMARY KEY (`id_unidade_medida`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_produto` (
  `id_tipo_produto` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produto` (
  `idProduto` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `preco` DECIMAL(5,2) NULL,
  `descricao` VARCHAR(45) NULL,
  `foto` VARCHAR(45) NULL,
  `qtd_disponivel` INT NULL,
  `fk_recheio` INT NOT NULL,
  `fk_massa` INT NOT NULL,
  `fk_cobertura` INT NOT NULL,
  `fk_unidade_medida` INT NOT NULL,
  `fk_tipo_produto` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  INDEX `fk_produto_recheio1_idx` (`fk_recheio` ASC) VISIBLE,
  INDEX `fk_produto_massa1_idx` (`fk_massa` ASC) VISIBLE,
  INDEX `fk_produto_cobertura1_idx` (`fk_cobertura` ASC) VISIBLE,
  INDEX `fk_produto_unidade_medida1_idx` (`fk_unidade_medida` ASC) VISIBLE,
  INDEX `fk_produto_tipo_produto1_idx` (`fk_tipo_produto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_recheio1`
    FOREIGN KEY (`fk_recheio`)
    REFERENCES `mydb`.`recheio` (`id_recheio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_massa1`
    FOREIGN KEY (`fk_massa`)
    REFERENCES `mydb`.`massa` (`id_massa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_cobertura1`
    FOREIGN KEY (`fk_cobertura`)
    REFERENCES `mydb`.`cobertura` (`id_cobertura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_unidade_medida1`
    FOREIGN KEY (`fk_unidade_medida`)
    REFERENCES `mydb`.`unidade_medida` (`id_unidade_medida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_tipo_produto1`
    FOREIGN KEY (`fk_tipo_produto`)
    REFERENCES `mydb`.`tipo_produto` (`id_tipo_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`forma_entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`forma_entrega` (
  `id_forma_entrega` INT NOT NULL,
  `Forma de entrega` VARCHAR(45) NULL,
  PRIMARY KEY (`id_forma_entrega`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `id_cliente` INT NOT NULL,
  `nome` VARCHAR(255) NULL,
  `numero` CHAR(11) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`forma_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`forma_pagamento` (
  `idForma_pagamento` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idForma_pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedido` (
  `idPedido` INT NOT NULL,
  `dt_pedido` DATE NULL,
  `vl_pedido` DOUBLE NULL,
  `status` CHAR(1) NULL,
  `valor_sinal` VARCHAR(45) NULL,
  `fk_forma_entrega` INT NOT NULL,
  `fk_cliente` INT NOT NULL,
  `fk_forma_pagamento` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `fk_forma_pagamento`),
  INDEX `fk_pedido_forma_entrega1_idx` (`fk_forma_entrega` ASC) VISIBLE,
  INDEX `fk_pedido_cliente1_idx` (`fk_cliente` ASC) VISIBLE,
  INDEX `fk_pedido_forma_pagamento1_idx` (`fk_forma_pagamento` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_forma_entrega1`
    FOREIGN KEY (`fk_forma_entrega`)
    REFERENCES `mydb`.`forma_entrega` (`id_forma_entrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`fk_cliente`)
    REFERENCES `mydb`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_forma_pagamento1`
    FOREIGN KEY (`fk_forma_pagamento`)
    REFERENCES `mydb`.`forma_pagamento` (`idForma_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`metas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`metas` (
  `idMeta` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `dt_termino` DATE NULL,
  `quantidade` INT NULL,
  `dt_inicio` VARCHAR(45) NULL,
  PRIMARY KEY (`idMeta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idUsuario` INT UNSIGNED NOT NULL,
  `email` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  `logado` INT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`personalizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`personalizacao` (
  `id_personalizacao` INT NOT NULL,
  `tema` VARCHAR(45) NULL,
  `fk_recheio` INT NOT NULL,
  `fk_massa` INT NOT NULL,
  `fk_cobertura` INT NOT NULL,
  PRIMARY KEY (`id_personalizacao`),
  INDEX `fk_personalizacao_recheio1_idx` (`fk_recheio` ASC) VISIBLE,
  INDEX `fk_personalizacao_massa1_idx` (`fk_massa` ASC) VISIBLE,
  INDEX `fk_personalizacao_cobertura1_idx` (`fk_cobertura` ASC) VISIBLE,
  CONSTRAINT `fk_personalizacao_recheio1`
    FOREIGN KEY (`fk_recheio`)
    REFERENCES `mydb`.`recheio` (`id_recheio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personalizacao_massa1`
    FOREIGN KEY (`fk_massa`)
    REFERENCES `mydb`.`massa` (`id_massa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personalizacao_cobertura1`
    FOREIGN KEY (`fk_cobertura`)
    REFERENCES `mydb`.`cobertura` (`id_cobertura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produto_pedido` (
  `observacoes` VARCHAR(45) NULL,
  `qt_produto` INT NULL,
  `id_produto_pedido` INT NOT NULL,
  `fk_produto` INT NOT NULL,
  `fk_personalizacao` INT NOT NULL,
  `fk_pedido` INT NOT NULL,
  PRIMARY KEY (`id_produto_pedido`, `fk_personalizacao`),
  INDEX `fk_produto_pedido_Produto1_idx` (`fk_produto` ASC) VISIBLE,
  INDEX `fk_produto_pedido_personalizacao1_idx` (`fk_personalizacao` ASC) VISIBLE,
  INDEX `fk_produto_pedido_pedido1_idx` (`fk_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_produto_pedido_Produto1`
    FOREIGN KEY (`fk_produto`)
    REFERENCES `mydb`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_pedido_personalizacao1`
    FOREIGN KEY (`fk_personalizacao`)
    REFERENCES `mydb`.`personalizacao` (`id_personalizacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_pedido_pedido1`
    FOREIGN KEY (`fk_pedido`)
    REFERENCES `mydb`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
  `id_endereco` INT NOT NULL,
  `logradouro` VARCHAR(45) NULL,
  `complemento` VARCHAR(45) NULL,
  `cep` CHAR(9) NULL,
  `numero` VARCHAR(45) NULL,
  PRIMARY KEY (`id_endereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`festa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`festa` (
  `idfesta` INT NOT NULL,
  `fk_endereco` INT NOT NULL,
  `pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`idfesta`),
  INDEX `fk_festa_endereco1_idx` (`fk_endereco` ASC) VISIBLE,
  INDEX `fk_festa_pedido1_idx` (`pedido_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_festa_endereco1`
    FOREIGN KEY (`fk_endereco`)
    REFERENCES `mydb`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_festa_pedido1`
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `mydb`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

