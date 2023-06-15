import { FastifyRequest, FastifyReply } from 'fastify'
import { prisma } from '@/lib/prisma'
import { z } from 'zod'

export async function register(request: FastifyRequest, reply: FastifyReply) {
  const registerBodySchema = z.object({
    name: z.string(),
    email: z.string().email(),
    password: z.string().min(6),
  })

  const { name, password, email } = registerBodySchema.parse(request.body)

  await prisma.user.create({
    data: {
      name,
      password_hash: password,
      email,
    },
  })

  return reply.status(201).send()
}
