-- AlterTable
ALTER TABLE "tarefas" ADD COLUMN     "negociacaoId" TEXT;

-- AddForeignKey
ALTER TABLE "tarefas" ADD CONSTRAINT "tarefas_negociacaoId_fkey" FOREIGN KEY ("negociacaoId") REFERENCES "negociacao"("_id") ON DELETE SET NULL ON UPDATE CASCADE;
