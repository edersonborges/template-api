/*
  Warnings:

  - You are about to drop the `codigo_cadastro` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "codigo_cadastro";

-- CreateTable
CREATE TABLE "codigo" (
    "_id" TEXT NOT NULL,
    "codigo" TEXT NOT NULL,
    "alunoId" TEXT,
    "telefone" TEXT,
    "utilizado" BOOLEAN NOT NULL DEFAULT false,
    "tipo" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "codigo_pkey" PRIMARY KEY ("_id")
);

-- AddForeignKey
ALTER TABLE "codigo" ADD CONSTRAINT "codigo_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("_id") ON DELETE SET NULL ON UPDATE CASCADE;
