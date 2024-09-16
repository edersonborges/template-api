-- CreateTable
CREATE TABLE "usuarios" (
    "_id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "rg" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "tipo" INTEGER NOT NULL DEFAULT 0,
    "telefone" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "data_nasc" TIMESTAMP(3) NOT NULL,
    "observacao" TEXT,
    "hr_entrada" TIMESTAMP(3),
    "hr_saida" TIMESTAMP(3),
    "dependentes" TEXT[],
    "principal" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "alunos" (
    "_id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "turma" TEXT NOT NULL,
    "rg" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "tipo" INTEGER NOT NULL DEFAULT 0,
    "telefone" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "data_nasc" TIMESTAMP(3) NOT NULL,
    "observacao" TEXT,
    "responsaveis" TEXT[],
    "hr_entrada" TIMESTAMP(3),
    "hr_saida" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "usuariosId" TEXT,

    CONSTRAINT "alunos_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "codigo_cadastro" (
    "_id" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "codigo" TEXT NOT NULL,
    "cadastrado" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "codigo_cadastro_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "atividade_presenca" (
    "_id" TEXT NOT NULL,
    "alunoId" TEXT,
    "colaboradorId" TEXT,
    "hr_entrada" TIMESTAMP(3),
    "hr_saida" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "atividade_presenca_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "recados" (
    "_id" TEXT NOT NULL,
    "alunoId" TEXT NOT NULL,
    "responsavelId" TEXT NOT NULL,
    "titulo" TEXT,
    "texto" TEXT,

    CONSTRAINT "recados_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "eventos" (
    "_id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "data" TIMESTAMP(3) NOT NULL,
    "titulo" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,

    CONSTRAINT "eventos_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "arquivos" (
    "_id" TEXT NOT NULL,
    "alunoId" TEXT,
    "colaboradorId" TEXT,
    "tipo" TEXT NOT NULL,
    "titulo" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "image_url" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "arquivos_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "bloqueados" (
    "_id" TEXT NOT NULL,
    "alunoId" TEXT,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "data_nasc" TIMESTAMP(3) NOT NULL,
    "telefone" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "bloqueados_pkey" PRIMARY KEY ("_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_rg_key" ON "usuarios"("rg");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_cpf_key" ON "usuarios"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_telefone_key" ON "usuarios"("telefone");

-- CreateIndex
CREATE UNIQUE INDEX "alunos_rg_key" ON "alunos"("rg");

-- CreateIndex
CREATE UNIQUE INDEX "alunos_cpf_key" ON "alunos"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "alunos_telefone_key" ON "alunos"("telefone");

-- CreateIndex
CREATE UNIQUE INDEX "bloqueados_telefone_key" ON "bloqueados"("telefone");

-- AddForeignKey
ALTER TABLE "alunos" ADD CONSTRAINT "alunos_usuariosId_fkey" FOREIGN KEY ("usuariosId") REFERENCES "usuarios"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "codigo_cadastro" ADD CONSTRAINT "codigo_cadastro_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "atividade_presenca" ADD CONSTRAINT "atividade_presenca_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "atividade_presenca" ADD CONSTRAINT "atividade_presenca_colaboradorId_fkey" FOREIGN KEY ("colaboradorId") REFERENCES "usuarios"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "recados" ADD CONSTRAINT "recados_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "recados" ADD CONSTRAINT "recados_responsavelId_fkey" FOREIGN KEY ("responsavelId") REFERENCES "usuarios"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "eventos" ADD CONSTRAINT "eventos_userId_fkey" FOREIGN KEY ("userId") REFERENCES "usuarios"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "arquivos" ADD CONSTRAINT "arquivos_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "arquivos" ADD CONSTRAINT "arquivos_colaboradorId_fkey" FOREIGN KEY ("colaboradorId") REFERENCES "usuarios"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bloqueados" ADD CONSTRAINT "bloqueados_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "alunos"("_id") ON DELETE SET NULL ON UPDATE CASCADE;
