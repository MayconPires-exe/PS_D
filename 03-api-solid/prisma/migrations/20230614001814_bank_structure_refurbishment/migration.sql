/*
  Warnings:

  - You are about to drop the `aluno` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `evento` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `inscricao` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `palestrante` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pessoa` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "aluno" DROP CONSTRAINT "aluno_pessoaId_fkey";

-- DropForeignKey
ALTER TABLE "evento" DROP CONSTRAINT "evento_palestranteId_fkey";

-- DropForeignKey
ALTER TABLE "inscricao" DROP CONSTRAINT "inscricao_eventoId_fkey";

-- DropForeignKey
ALTER TABLE "palestrante" DROP CONSTRAINT "palestrante_palestranteId_fkey";

-- DropTable
DROP TABLE "aluno";

-- DropTable
DROP TABLE "evento";

-- DropTable
DROP TABLE "inscricao";

-- DropTable
DROP TABLE "palestrante";

-- DropTable
DROP TABLE "pessoa";

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "check_ins" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "validated_at" TIMESTAMP(3),

    CONSTRAINT "check_ins_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gyms" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "descripition" TEXT,
    "phone" TEXT,
    "latitude" DECIMAL(65,30) NOT NULL,
    "longitude" DECIMAL(65,30) NOT NULL,

    CONSTRAINT "gyms_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");
