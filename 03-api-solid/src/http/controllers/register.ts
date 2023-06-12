import { FastifyRequest, FastifyReply } from 'fastify'
import { prisma } from '@/lib/prisma'
import { z } from 'zod'

export async function register(request: FastifyRequest, reply: FastifyReply) {
  const registerBodySchema = z.object({
    nome: z.string(),
    email: z.string().email(),
    password: z.string().min(6),
    data_nascimento: z.coerce.date(),
    data_cadastro: z.coerce.date(),
    cpf: z.string().min(11),
    telefone: z.string(),
    logradouro: z.string(),
    complemento: z.string(),
    numero: z.number(),
    bairro: z.string(),
    cidade: z.string(),
    uf: z.string().min(2),
    cep: z.string().min(8),
  })

  const {
    password,
    nome,
    email,
    cpf,
    telefone,
    logradouro,
    numero,
    complemento,
    bairro,
    cidade,
    uf,
    cep,
    data_nascimento,
    data_cadastro,
  } = registerBodySchema.parse(request.body)

  await prisma.user.create({
    data: {
      password_hash: password,
      nome,
      email,
      cpf,
      telefone,
      logradouro,
      numero,
      complemento,
      bairro,
      cidade,
      uf,
      cep,
      data_nascimento,
      data_cadastro,
    },
  })

  return reply.status(201).send()
}
