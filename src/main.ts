import { NestFactory } from '@nestjs/core';
import { join } from 'path';
import { AppModule } from './app.module';

async function bootstrap() {
  console.log(join(process.cwd(), 'src/schema.gql'));
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);
}
bootstrap();
