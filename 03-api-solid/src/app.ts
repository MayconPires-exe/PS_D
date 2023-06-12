import fastify from 'fastify'
import { PrismaClient } from '@prisma/client'
import { z } from 'zod'

export const app = fastify()

app.post('/users', (request, reply) => {

})
