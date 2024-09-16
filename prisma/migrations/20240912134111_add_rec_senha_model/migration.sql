/*
  Warnings:

  - Made the column `negociacaoId` on table `tarefas` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "tarefas" DROP CONSTRAINT "tarefas_negociacaoId_fkey";

-- AlterTable
ALTER TABLE "tarefas" ALTER COLUMN "negociacaoId" SET NOT NULL;

-- CreateTable
CREATE TABLE "rec_senha" (
    "_id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "codigo" INTEGER NOT NULL,
    "usado" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "rec_senha_pkey" PRIMARY KEY ("_id")
);

-- CreateIndex
CREATE INDEX "rec_senha_userId_idx" ON "rec_senha"("userId");

-- AddForeignKey
ALTER TABLE "rec_senha" ADD CONSTRAINT "rec_senha_userId_fkey" FOREIGN KEY ("userId") REFERENCES "usuario"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tarefas" ADD CONSTRAINT "tarefas_negociacaoId_fkey" FOREIGN KEY ("negociacaoId") REFERENCES "negociacao"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;
