-- CreateTable
CREATE TABLE "pessoa" (
    "id" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "cpf" VARCHAR(11) NOT NULL,
    "telefone" VARCHAR(11) NOT NULL,
    "logradouro" VARCHAR(50) NOT NULL,
    "numero" INTEGER,
    "complemento" VARCHAR(50),
    "bairro" VARCHAR(50) NOT NULL,
    "cidade" VARCHAR(50) NOT NULL,
    "uf" CHAR(2) NOT NULL,
    "cep" CHAR(8) NOT NULL,
    "data_nascimento" DATE NOT NULL,
    "data_cadastro" TIMESTAMP NOT NULL,

    CONSTRAINT "pessoa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "aluno" (
    "id" TEXT NOT NULL,
    "curso" VARCHAR(100) NOT NULL,
    "semestre" INTEGER NOT NULL,
    "departamento" VARCHAR(100) NOT NULL,
    "notificacao_email" BOOLEAN NOT NULL,
    "notificacao_whats" BOOLEAN NOT NULL,
    "pessoaId" TEXT NOT NULL,

    CONSTRAINT "aluno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "palestrante" (
    "id" TEXT NOT NULL,
    "formacao" VARCHAR(100) NOT NULL,
    "titularidade" VARCHAR(50) NOT NULL,
    "instituicao" VARCHAR(100) NOT NULL,
    "profissao" VARCHAR(100) NOT NULL,
    "empresa" VARCHAR(100) NOT NULL,
    "palestranteId" TEXT NOT NULL,

    CONSTRAINT "palestrante_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "evento" (
    "id" TEXT NOT NULL,
    "data_cadastrro" TIMESTAMP NOT NULL,
    "titulo" VARCHAR(100) NOT NULL,
    "subtitulo" VARCHAR(100) NOT NULL,
    "descricao" VARCHAR(500) NOT NULL,
    "data_evento" DATE NOT NULL,
    "hora_evento" TIME NOT NULL,
    "tipo_evevnto" VARCHAR(50) NOT NULL,
    "valor_evento" MONEY NOT NULL,
    "palestranteId" TEXT NOT NULL,

    CONSTRAINT "evento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "inscricao" (
    "id" TEXT NOT NULL,
    "data_castro" TIMESTAMP NOT NULL,
    "cupom_desconto" VARCHAR(50) NOT NULL,
    "valor_desconto" MONEY NOT NULL,
    "valor_pago" MONEY NOT NULL,
    "confirmou_presenca" BOOLEAN NOT NULL,
    "participou_evento" BOOLEAN NOT NULL,
    "eventoId" TEXT NOT NULL,

    CONSTRAINT "inscricao_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "pessoa_email_key" ON "pessoa"("email");

-- CreateIndex
CREATE UNIQUE INDEX "pessoa_cpf_key" ON "pessoa"("cpf");

-- AddForeignKey
ALTER TABLE "aluno" ADD CONSTRAINT "aluno_pessoaId_fkey" FOREIGN KEY ("pessoaId") REFERENCES "pessoa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "palestrante" ADD CONSTRAINT "palestrante_palestranteId_fkey" FOREIGN KEY ("palestranteId") REFERENCES "pessoa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "evento" ADD CONSTRAINT "evento_palestranteId_fkey" FOREIGN KEY ("palestranteId") REFERENCES "palestrante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inscricao" ADD CONSTRAINT "inscricao_eventoId_fkey" FOREIGN KEY ("eventoId") REFERENCES "evento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
