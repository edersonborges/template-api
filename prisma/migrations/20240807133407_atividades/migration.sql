/*
  Warnings:

  - You are about to drop the `atividade_presenca` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "atividade_presenca" DROP CONSTRAINT "atividade_presenca_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "atividade_presenca" DROP CONSTRAINT "atividade_presenca_colaboradorId_fkey";

-- DropTable
DROP TABLE "atividade_presenca";

-- CreateTable
CREATE TABLE "atividades_aluno" (
    "_id" TEXT NOT NULL,
    "alunoId" TEXT,
    "tipo" TEXT NOT NULL,
    "observacao" TEXT,
    "hr_entrada" TIMESTAMP(3),
    "hr_saida" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "atividades_aluno_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "atividades_colaborador" (
    "_id" TEXT NOT NULL,
    "colaboradorId" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "observacao" TEXT,
    "hr_entrada" TIMESTAMP(3),
    "hr_saida" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "atividades_colaborador_pkey" PRIMARY KEY ("_id")
);

-- AddForeignKey
ALTER TABLE "atividades_aluno" ADD CONSTRAINT "atividades_aluno_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "atividades_colaborador" ADD CONSTRAINT "atividades_colaborador_colaboradorId_fkey" FOREIGN KEY ("colaboradorId") REFERENCES "usuarios"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;
