import { Injectable } from '@nestjs/common';
import { DatabaseService } from 'src/database/database.service';
import { AccountEntity } from './entities/account.entity';

@Injectable()
export class AccountService {
  constructor(private readonly prismaClient: DatabaseService) {}

  async getAllAccount(): Promise<AccountEntity[]> {
    const doctor = await this.prismaClient.doctor.findMany({
      where: {
        AND: [
          {
            account: {
              deletedAt: null,
            },
          },
          // {

          // }
        ],
      },
      include: {
        account: {
          select: {
            accountName: true,
            clinic: true,
          },
        },
      },
    });
    console.log(doctor);

    return await this.prismaClient.account.findMany();
  }

  async createArea(): Promise<any> {
    const areaInput = {
      code: 1000,
      region: 'doannv',
      prefecture: 'doannv',
      city: 'doannv',
      id: '123',
    }
    // const data = await this.prismaClient.area.create(areaInput)
    return areaInput.id

  }
}
