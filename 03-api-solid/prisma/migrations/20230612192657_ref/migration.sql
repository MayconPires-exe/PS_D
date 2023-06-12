/*
  Warnings:

  - You are about to drop the column `tipo_evevnto` on the `evento` table. All the data in the column will be lost.
  - Added the required column `tipo_evento` to the `evento` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "evento" DROP COLUMN "tipo_evevnto",
ADD COLUMN     "tipo_evento" VARCHAR(50) NOT NULL;
