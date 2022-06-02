import { Field, ID, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class AccountEntity {
  @Field(() => ID)
  id: string;

  @Field(() => String)
  accountName: string;
}
