-- CreateTable
CREATE TABLE "anotacao" (
    "_id" TEXT NOT NULL,
    "negociacaoId" TEXT NOT NULL,
    "texto" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "anotacao_pkey" PRIMARY KEY ("_id")
);

-- AddForeignKey
ALTER TABLE "anotacao" ADD CONSTRAINT "anotacao_negociacaoId_fkey" FOREIGN KEY ("negociacaoId") REFERENCES "negociacao"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;
