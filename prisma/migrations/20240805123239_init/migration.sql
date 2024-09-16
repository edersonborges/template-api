/*
  Warnings:

  - You are about to drop the column `colaboradorId` on the `arquivos` table. All the data in the column will be lost.
  - You are about to drop the column `descricao` on the `arquivos` table. All the data in the column will be lost.
  - You are about to drop the column `image_url` on the `arquivos` table. All the data in the column will be lost.
  - You are about to drop the column `titulo` on the `arquivos` table. All the data in the column will be lost.
  - Added the required column `img_key` to the `arquivos` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "arquivos" DROP CONSTRAINT "arquivos_colaboradorId_fkey";

-- AlterTable
ALTER TABLE "arquivos" DROP COLUMN "colaboradorId",
DROP COLUMN "descricao",
DROP COLUMN "image_url",
DROP COLUMN "titulo",
ADD COLUMN     "img_key" TEXT NOT NULL,
ADD COLUMN     "userId" TEXT;

-- AddForeignKey
ALTER TABLE "arquivos" ADD CONSTRAINT "arquivos_userId_fkey" FOREIGN KEY ("userId") REFERENCES "usuarios"("_id") ON DELETE SET NULL ON UPDATE CASCADE;
