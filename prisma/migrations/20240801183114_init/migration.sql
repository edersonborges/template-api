-- DropForeignKey
ALTER TABLE "recados" DROP CONSTRAINT "recados_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "recados" DROP CONSTRAINT "recados_responsavelId_fkey";

-- AlterTable
ALTER TABLE "recados" ADD COLUMN     "data" TIMESTAMP(3),
ALTER COLUMN "alunoId" DROP NOT NULL,
ALTER COLUMN "responsavelId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "recados" ADD CONSTRAINT "recados_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "recados" ADD CONSTRAINT "recados_responsavelId_fkey" FOREIGN KEY ("responsavelId") REFERENCES "usuarios"("_id") ON DELETE SET NULL ON UPDATE CASCADE;
