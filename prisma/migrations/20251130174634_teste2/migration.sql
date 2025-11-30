-- DropForeignKey
ALTER TABLE `itemrodizio` DROP FOREIGN KEY `ItemRodizio_productId_fkey`;

-- DropIndex
DROP INDEX `ItemRodizio_productId_fkey` ON `itemrodizio`;

-- AddForeignKey
ALTER TABLE `ItemRodizio` ADD CONSTRAINT `ItemRodizio_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
