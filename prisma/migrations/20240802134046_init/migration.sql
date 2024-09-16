/*
  Warnings:

  - You are about to drop the column `responsaveis` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `usuariosId` on the `alunos` table. All the data in the column will be lost.
  - You are about to drop the column `dependentes` on the `usuarios` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "alunos" DROP CONSTRAINT "alunos_usuariosId_fkey";

-- AlterTable
ALTER TABLE "alunos" DROP COLUMN "responsaveis",
DROP COLUMN "usuariosId";

-- AlterTable
ALTER TABLE "usuarios" DROP COLUMN "dependentes";

-- CreateTable
CREATE TABLE "responsaveis" (
    "_id" TEXT NOT NULL,
    "responsavelId" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "principal" BOOLEAN NOT NULL DEFAULT false,
    "temporario" BOOLEAN NOT NULL DEFAULT false,
    "periodo" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "responsaveis_pkey" PRIMARY KEY ("_id")
);

-- AddForeignKey
ALTER TABLE "responsaveis" ADD CONSTRAINT "responsaveis_responsavelId_fkey" FOREIGN KEY ("responsavelId") REFERENCES "usuarios"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsaveis" ADD CONSTRAINT "responsaveis_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;
