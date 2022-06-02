import { Post } from '@nestjs/common';
import { Args, Int, Mutation, Query, Resolver, Subscription } from '@nestjs/graphql';
import { PubSub } from 'graphql-subscriptions';
import { AccountService } from './account.service';
import { AccountEntity } from './entities/account.entity';

const pubSub = new PubSub();
@Resolver()
export class AccountResolver {
  constructor(private readonly accountService: AccountService) {}

  @Query(() => [AccountEntity])
  async getAllAccount(): Promise<AccountEntity[]> {
    return await this.accountService.getAllAccount();
  }

  @Mutation(() => String)
  async createArea() {
    const id = await this.accountService.createArea();
    console.log(id);
    pubSub.publish('commentAdded', {commentAdded: id});
    return id;
  }
// cmd
  
  @Subscription((returns) => String, {
    
  })
  commentAdded() {
    return pubSub.asyncIterator('commentAdded');
  }
}
