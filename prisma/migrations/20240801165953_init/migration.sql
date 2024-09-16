/*
  Warnings:

  - Added the required column `descricao` to the `atividade_presenca` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "bloqueados_telefone_key";

-- AlterTable
ALTER TABLE "atividade_presenca" ADD COLUMN     "descricao" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "bloqueados" ADD COLUMN     "imagem_url" TEXT,
ALTER COLUMN "cpf" DROP NOT NULL,
ALTER COLUMN "data_nasc" DROP NOT NULL,
ALTER COLUMN "telefone" DROP NOT NULL;
