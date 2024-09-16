/*
  Warnings:

  - You are about to drop the column `clientePjId` on the `beneficiarios` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "beneficiarios" DROP CONSTRAINT "beneficiarios_clientePjId_fkey";

-- AlterTable
ALTER TABLE "beneficiarios" DROP COLUMN "clientePjId",
ADD COLUMN     "estipulanteId" TEXT;

-- AddForeignKey
ALTER TABLE "beneficiarios" ADD CONSTRAINT "beneficiarios_estipulanteId_fkey" FOREIGN KEY ("estipulanteId") REFERENCES "estipulante"("_id") ON DELETE SET NULL ON UPDATE CASCADE;
