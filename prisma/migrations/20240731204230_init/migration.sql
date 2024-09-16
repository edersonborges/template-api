/*
  Warnings:

  - You are about to drop the column `alunoId` on the `codigo_cadastro` table. All the data in the column will be lost.
  - Added the required column `telefone` to the `codigo_cadastro` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "codigo_cadastro" DROP CONSTRAINT "codigo_cadastro_alunoId_fkey";

-- AlterTable
ALTER TABLE "alunos" ALTER COLUMN "turma" DROP NOT NULL,
ALTER COLUMN "senha" DROP NOT NULL;

-- AlterTable
ALTER TABLE "codigo_cadastro" DROP COLUMN "alunoId",
ADD COLUMN     "telefone" TEXT NOT NULL;
