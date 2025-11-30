-- AlterTable
ALTER TABLE `pedido` ADD COLUMN `tipo` ENUM('ALACARTE', 'RODIZIO') NOT NULL DEFAULT 'ALACARTE';

-- CreateTable
CREATE TABLE `SessaoRodizio` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mesa` VARCHAR(191) NULL,
    `nomeCliente` VARCHAR(191) NULL,
    `pessoas` INTEGER NULL,
    `status` ENUM('ATIVA', 'ENCERRADA') NOT NULL DEFAULT 'ATIVA',
    `criadoEm` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `encerradoEm` DATETIME(3) NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ItemRodizio` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `qtd` INTEGER NOT NULL DEFAULT 1,
    `observacao` VARCHAR(191) NULL,
    `criadoEm` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `status` ENUM('PENDENTE', 'PREPARANDO', 'ENTREGUE') NOT NULL DEFAULT 'PENDENTE',
    `sessaoId` INTEGER NOT NULL,
    `productId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SessaoRodizio` ADD CONSTRAINT `SessaoRodizio_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ItemRodizio` ADD CONSTRAINT `ItemRodizio_sessaoId_fkey` FOREIGN KEY (`sessaoId`) REFERENCES `SessaoRodizio`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ItemRodizio` ADD CONSTRAINT `ItemRodizio_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
