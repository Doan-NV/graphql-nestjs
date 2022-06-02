import { Module } from '@nestjs/common';
import { GraphQLModule } from '@nestjs/graphql';
import { join } from 'path';
import { AccountModule } from './account/account.module';
import { DatabaseModule } from './database/database.module';
import { ApolloDriver } from '@nestjs/apollo';

@Module({
  imports: [
    GraphQLModule.forRoot({
      driver: ApolloDriver,
      autoSchemaFile: join(process.cwd(), 'src/schema.gql'),
      installSubscriptionHandlers: true,
    }),
    AccountModule,
    DatabaseModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
