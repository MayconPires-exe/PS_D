import { randomUUID } from "node:crypto"

interface AnswerProps {
  content: string, 
  authorId: string, 
  questionId: string
}

export class Answer {
  public id: string
  public content: string
  public authorId: string
  public questionId: string

  constructor(prop: AnswerProps, id?: string) {
    this.content = prop.content
    this.authorId = prop.authorId
    this.questionId = prop.questionId
    this.id = id ?? randomUUID()
  }
}