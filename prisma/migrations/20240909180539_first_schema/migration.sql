/*
  Warnings:

  - You are about to drop the column `alunoId` on the `arquivos` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `arquivos` table. All the data in the column will be lost.
  - You are about to drop the `alunos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `atividades_aluno` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `atividades_colaborador` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `bloqueados` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `codigo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `eventos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `recados` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `responsaveis` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `responsavel_temporario` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `usuarios` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "arquivos" DROP CONSTRAINT "arquivos_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "arquivos" DROP CONSTRAINT "arquivos_userId_fkey";

-- DropForeignKey
ALTER TABLE "atividades_aluno" DROP CONSTRAINT "atividades_aluno_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "atividades_aluno" DROP CONSTRAINT "atividades_aluno_mediaId_fkey";

-- DropForeignKey
ALTER TABLE "atividades_colaborador" DROP CONSTRAINT "atividades_colaborador_colaboradorId_fkey";

-- DropForeignKey
ALTER TABLE "atividades_colaborador" DROP CONSTRAINT "atividades_colaborador_mediaId_fkey";

-- DropForeignKey
ALTER TABLE "bloqueados" DROP CONSTRAINT "bloqueados_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "codigo" DROP CONSTRAINT "codigo_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "eventos" DROP CONSTRAINT "eventos_userId_fkey";

-- DropForeignKey
ALTER TABLE "recados" DROP CONSTRAINT "recados_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "recados" DROP CONSTRAINT "recados_responsavelId_fkey";

-- DropForeignKey
ALTER TABLE "responsaveis" DROP CONSTRAINT "responsaveis_alunoId_fkey";

-- DropForeignKey
ALTER TABLE "responsaveis" DROP CONSTRAINT "responsaveis_responsavelId_fkey";

-- DropForeignKey
ALTER TABLE "responsavel_temporario" DROP CONSTRAINT "responsavel_temporario_alunoId_fkey";

-- AlterTable
ALTER TABLE "arquivos" DROP COLUMN "alunoId",
DROP COLUMN "userId",
ADD COLUMN     "clientPfId" TEXT,
ADD COLUMN     "clientPjId" TEXT,
ADD COLUMN     "propostaId" TEXT;

-- DropTable
DROP TABLE "alunos";

-- DropTable
DROP TABLE "atividades_aluno";

-- DropTable
DROP TABLE "atividades_colaborador";

-- DropTable
DROP TABLE "bloqueados";

-- DropTable
DROP TABLE "codigo";

-- DropTable
DROP TABLE "eventos";

-- DropTable
DROP TABLE "recados";

-- DropTable
DROP TABLE "responsaveis";

-- DropTable
DROP TABLE "responsavel_temporario";

-- DropTable
DROP TABLE "usuarios";

-- CreateTable
CREATE TABLE "usuario" (
    "_id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "data_nasc" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "usuario_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "tarefas" (
    "_id" TEXT NOT NULL,
    "assunto" TEXT NOT NULL,
    "responsavel" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "data_agendamento" TIMESTAMP(3) NOT NULL,
    "horario" TIMESTAMP(3) NOT NULL,
    "concluida" BOOLEAN NOT NULL DEFAULT false,
    "usuarioId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "tarefas_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "negociacao" (
    "_id" TEXT NOT NULL,
    "nome_cliente" TEXT NOT NULL,
    "nome_negociacao" TEXT NOT NULL,
    "etapa" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "primeiro_pgmt" TIMESTAMP(3),
    "periodo" TEXT,
    "ultimo_contato" TIMESTAMP(3),
    "valor_negociado" DOUBLE PRECISION NOT NULL,
    "concluida" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "negociacao_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "contato_negociacao" (
    "_id" TEXT NOT NULL,
    "negociacaoId" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "data_nasc" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "contato_negociacao_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "proposta_negociacao" (
    "_id" TEXT NOT NULL,
    "nome_arq" TEXT NOT NULL,
    "seguradora" TEXT NOT NULL,
    "premio" DOUBLE PRECISION NOT NULL,
    "comissao_percentual" DOUBLE PRECISION NOT NULL,
    "comissao_valor" DOUBLE PRECISION NOT NULL,
    "negociacaoId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "proposta_negociacao_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "cliente_pf" (
    "_id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "data_nasc" TIMESTAMP(3) NOT NULL,
    "sexo" TEXT NOT NULL,
    "estado_civil" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "profissao" TEXT NOT NULL,
    "renda" DOUBLE PRECISION NOT NULL,
    "fonte_renda" TEXT NOT NULL,
    "estado_saude" TEXT NOT NULL,
    "historico_med" TEXT NOT NULL,
    "habitos" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "cliente_pf_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "cliente_pj" (
    "_id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "nome_resp" TEXT NOT NULL,
    "nome_fantasia" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "data_abert" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "cliente_pj_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "beneficiarios" (
    "_id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "relacao" TEXT NOT NULL,
    "percentual" DOUBLE PRECISION NOT NULL,
    "clientePfId" TEXT,
    "clientePjId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "beneficiarios_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "estipulante" (
    "_id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "data_nasc" TIMESTAMP(3) NOT NULL,
    "clientePjId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "estipulante_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "enderecos" (
    "_id" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "numero" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "complemento" TEXT,
    "estado" TEXT NOT NULL,
    "clientPfId" TEXT,
    "clientPjId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "enderecos_pkey" PRIMARY KEY ("_id")
);

-- CreateTable
CREATE TABLE "seguradoras" (
    "_id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,
    "escritorio" TEXT NOT NULL,
    "nome_gestor" TEXT NOT NULL,
    "telefone_gestor" TEXT NOT NULL,
    "email_gestor" TEXT NOT NULL,
    "comissao" DOUBLE PRECISION NOT NULL,
    "agenciamento" DOUBLE PRECISION NOT NULL,
    "tipo_seguro" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "seguradoras_pkey" PRIMARY KEY ("_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuario_email_key" ON "usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "cliente_pf_cpf_key" ON "cliente_pf"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "cliente_pf_email_key" ON "cliente_pf"("email");

-- CreateIndex
CREATE UNIQUE INDEX "cliente_pj_cnpj_key" ON "cliente_pj"("cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "cliente_pj_email_key" ON "cliente_pj"("email");

-- CreateIndex
CREATE UNIQUE INDEX "estipulante_cpf_key" ON "estipulante"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "seguradoras_cnpj_key" ON "seguradoras"("cnpj");

-- AddForeignKey
ALTER TABLE "tarefas" ADD CONSTRAINT "tarefas_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuario"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contato_negociacao" ADD CONSTRAINT "contato_negociacao_negociacaoId_fkey" FOREIGN KEY ("negociacaoId") REFERENCES "negociacao"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "proposta_negociacao" ADD CONSTRAINT "proposta_negociacao_negociacaoId_fkey" FOREIGN KEY ("negociacaoId") REFERENCES "negociacao"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "beneficiarios" ADD CONSTRAINT "beneficiarios_clientePfId_fkey" FOREIGN KEY ("clientePfId") REFERENCES "cliente_pf"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "beneficiarios" ADD CONSTRAINT "beneficiarios_clientePjId_fkey" FOREIGN KEY ("clientePjId") REFERENCES "cliente_pj"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "estipulante" ADD CONSTRAINT "estipulante_clientePjId_fkey" FOREIGN KEY ("clientePjId") REFERENCES "cliente_pj"("_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "arquivos" ADD CONSTRAINT "arquivos_clientPfId_fkey" FOREIGN KEY ("clientPfId") REFERENCES "cliente_pf"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "arquivos" ADD CONSTRAINT "arquivos_clientPjId_fkey" FOREIGN KEY ("clientPjId") REFERENCES "cliente_pj"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "arquivos" ADD CONSTRAINT "arquivos_propostaId_fkey" FOREIGN KEY ("propostaId") REFERENCES "proposta_negociacao"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enderecos" ADD CONSTRAINT "enderecos_clientPfId_fkey" FOREIGN KEY ("clientPfId") REFERENCES "cliente_pf"("_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enderecos" ADD CONSTRAINT "enderecos_clientPjId_fkey" FOREIGN KEY ("clientPjId") REFERENCES "cliente_pj"("_id") ON DELETE SET NULL ON UPDATE CASCADE;
