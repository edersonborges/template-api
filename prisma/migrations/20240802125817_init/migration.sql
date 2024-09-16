/*
  Warnings:

  - Added the required column `tipo` to the `recados` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "recados" ADD COLUMN     "tipo" TEXT NOT NULL;
