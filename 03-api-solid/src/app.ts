/* eslint-disable camelcase */
import fastify from 'fastify'
import { prisma } from './lib/prisma'
import { appRoutes } from './http/routes'
import { z } from 'zod'

export const app = fastify()

app.register(appRoutes)

app.get('/users', async (request, reply) => {
  const users = await prisma.user.findMany()
  reply.send(users)
})

app.get('/users/:id', async (request, reply) => {
  const { id } = request.params
  const user = await prisma.user.findUnique({
    where: { id: String(id) },
  })

  if (!user) {
    reply.status(404).send('User not found')
  } else {
    reply.send(user)
  }
})

app.put('/users/:id', async (request, reply) => {
  const { id } = request.params

  const updateBodySchema = z.object({
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
  } = updateBodySchema.parse(request.body)

  try {
    const updatedUser = await prisma.user.update({
      where: { id: String(id) },
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

    reply.send(updatedUser)
  } catch (error) {
    console.error(error)
    reply.status(500).send('Internal Server Error')
  }
})

app.delete('/users/:id', async (request, reply) => {
  const { id } = request.params

  try {
    await prisma.user.delete({
      where: { id: String(id) },
    })

    reply.send('User deleted')
  } catch (error) {
    console.error(error)
    reply.status(500).send('Internal Server Error')
  }
})
