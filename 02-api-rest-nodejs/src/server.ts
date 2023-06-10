import fastify from 'fastify'
import { knex } from './database'

const app = fastify()

app.get('/hello', async () => {
  const database = await knex('sqlite_schema').select('*')

  return database
})

app
  .listen({
    port: 3333,
  })
  .then(() => {
    console.log('Server is running')
  })
