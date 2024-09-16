-- AlterTable
ALTER TABLE "atividades_aluno" ADD COLUMN     "mediaId" TEXT;

-- AlterTable
ALTER TABLE "atividades_colaborador" ADD COLUMN     "mediaId" TEXT;

-- AddForeignKey
ALTER TABLE "atividades_aluno" ADD CONSTRAINT "atividades_aluno_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "arquivos"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "atividades_colaborador" ADD CONSTRAINT "atividades_colaborador_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "arquivos"("_id") ON DELETE SET NULL ON UPDATE CASCADE;
