import fastify from 'fastify'
import { prisma } from './lib/prisma'
import { appRoutes } from './http/routes'
import { z } from 'zod'

export const app = fastify()

app.register(appRoutes)
