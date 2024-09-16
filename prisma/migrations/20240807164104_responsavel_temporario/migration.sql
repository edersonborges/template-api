/*
  Warnings:

  - You are about to drop the column `principal` on the `responsaveis` table. All the data in the column will be lost.
  - You are about to drop the column `temporario` on the `responsaveis` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "responsaveis" DROP COLUMN "principal",
DROP COLUMN "temporario";

-- CreateTable
CREATE TABLE "responsavel_temporario" (
    "_id" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "telefone" TIMESTAMP(3),
    "data_nasc" TIMESTAMP(3),
    "periodo" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "responsavel_temporario_pkey" PRIMARY KEY ("_id")
);

-- AddForeignKey
ALTER TABLE "responsavel_temporario" ADD CONSTRAINT "responsavel_temporario_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;
