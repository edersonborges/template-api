/*
  Warnings:

  - You are about to drop the column `cadastrado` on the `codigo_cadastro` table. All the data in the column will be lost.
  - Added the required column `tipo` to the `codigo_cadastro` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "codigo_cadastro" DROP COLUMN "cadastrado",
ADD COLUMN     "tipo" TEXT NOT NULL,
ADD COLUMN     "utilizado" BOOLEAN NOT NULL DEFAULT false;
