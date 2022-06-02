-- CreateTable
CREATE TABLE `File` (
    `id` VARCHAR(191) NOT NULL,
    `fileName` VARCHAR(191) NOT NULL,
    `mimeType` VARCHAR(191) NOT NULL,
    `size` DOUBLE NULL,
    `fileCategory` ENUM('MAIN_PHOTO', 'SUB_PHOTO_1', 'SUB_PHOTO_2', 'SUB_PHOTO_3', 'SUB_PHOTO_4', 'CERTIFICATE_PHOTO', 'IDENTIFICATION_PHOTO', 'CLINIC_JOB_OFFER_THUMBNAIL') NOT NULL,
    `accountId` VARCHAR(191) NULL,
    `clinicJobOfferId` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Account` (
    `id` VARCHAR(191) NOT NULL,
    `accountName` VARCHAR(191) NULL,
    `lastName` VARCHAR(191) NULL,
    `firstName` VARCHAR(191) NULL,
    `lastNameKana` VARCHAR(191) NULL,
    `firstNameKana` VARCHAR(191) NULL,
    `birthday` DATETIME(3) NULL,
    `postCode` VARCHAR(191) NULL,
    `city` VARCHAR(191) NULL,
    `cityKana` VARCHAR(191) NULL,
    `prefecture` VARCHAR(191) NULL,
    `address1` VARCHAR(191) NULL,
    `address1Kana` VARCHAR(191) NULL,
    `address2` VARCHAR(191) NULL,
    `address2Kana` VARCHAR(191) NULL,
    `phoneNumber` VARCHAR(191) NULL,
    `cognitoId` VARCHAR(191) NULL,
    `role` ENUM('DOCTOR', 'CLINIC', 'STUDENT', 'SYSTEM_ADMIN') NULL,
    `lastLogin` DATETIME(3) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Certificate` (
    `id` VARCHAR(191) NOT NULL,
    `content` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,
    `doctorId` VARCHAR(191) NULL,
    `clinicId` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AccountEmployeeTypes` (
    `id` VARCHAR(191) NOT NULL,
    `value` ENUM('FULL_TIME', 'PARTIAL_TIME', 'CONTRACT', 'SPOT') NULL,
    `doctorId` VARCHAR(191) NULL,
    `clinicId` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MySelect` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `selectName` VARCHAR(191) NOT NULL,
    `categoryId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AccountMySelect` (
    `id` VARCHAR(191) NOT NULL,
    `mySelectId` INTEGER NOT NULL,
    `description` VARCHAR(191) NULL,
    `isBestMySelect` BOOLEAN NOT NULL DEFAULT false,
    `doctorId` VARCHAR(191) NULL,
    `clinicId` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `categoryName` VARCHAR(191) NOT NULL,
    `color` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BookMark` (
    `id` VARCHAR(191) NOT NULL,
    `doctorId` VARCHAR(191) NULL,
    `clinicId` VARCHAR(191) NULL,
    `bookmarker` ENUM('DOCTOR', 'CLINIC') NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DesiredSpotJob` (
    `id` VARCHAR(191) NOT NULL,
    `startTime` DATETIME(3) NULL,
    `endTime` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,
    `doctorId` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Student` (
    `id` VARCHAR(191) NOT NULL,
    `gender` ENUM('MALE', 'FEMALE', 'OTHER') NULL,
    `accountId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Student_accountId_key`(`accountId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SystemAdmin` (
    `id` VARCHAR(191) NOT NULL,
    `adminRoleId` VARCHAR(191) NULL,
    `accountId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `SystemAdmin_accountId_key`(`accountId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AdminRole` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Doctor` (
    `id` VARCHAR(191) NOT NULL,
    `numberOfLikes` INTEGER NOT NULL DEFAULT 0,
    `job` ENUM('DOCTOR', 'ASSISTANT') NULL,
    `gender` ENUM('MALE', 'FEMALE', 'OTHER') NULL,
    `isMarried` BOOLEAN NULL,
    `obligationToSupport` BOOLEAN NULL,
    `latestUniversityName` VARCHAR(191) NULL,
    `universityFrom` DATETIME(3) NULL,
    `universityTo` DATETIME(3) NULL,
    `university` ENUM('COMPLETE', 'GRADUATION', 'STUDENT', 'ABSENT') NULL,
    `graduateExpectTime` DATETIME(3) NULL,
    `highSchoolName` VARCHAR(191) NULL,
    `highSchoolFrom` DATETIME(3) NULL,
    `highSchoolTo` DATETIME(3) NULL,
    `highSchool` ENUM('COMPLETE', 'GRADUATION', 'STUDENT', 'ABSENT') NULL,
    `juniorHighSchoolName` VARCHAR(191) NULL,
    `juniorHighSchoolFrom` DATETIME(3) NULL,
    `juniorHighSchoolTo` DATETIME(3) NULL,
    `juniorHighSchool` ENUM('COMPLETE', 'GRADUATION', 'STUDENT', 'ABSENT') NULL,
    `previousJob` ENUM('WORKING', 'NOT_WORKING', 'NEVER_GOT_A_JOB') NULL,
    `latestCompanyName` VARCHAR(191) NULL,
    `latestCompanyFrom` DATETIME(3) NULL,
    `latestCompanyTo` DATETIME(3) NULL,
    `resignReason` ENUM('PERSONAL_CONVENIENCE', 'COMPANY_CONVENIENCE') NULL,
    `driverLicenseType` ENUM('MT', 'AT') NULL,
    `currentSatisfaction` ENUM('ONE', 'TWO', 'THREE', 'FOUR', 'FIVE') NULL,
    `currentAnnualIncome` INTEGER NULL,
    `desiredChangeJobFrom` DATETIME(3) NULL,
    `desiredChangeJobTo` DATETIME(3) NULL,
    `desiredWorkPlace1` VARCHAR(191) NULL,
    `desiredWorkPlace2` VARCHAR(191) NULL,
    `desiredCommuteTime` INTEGER NULL,
    `freeText` VARCHAR(191) NULL,
    `selfPr` VARCHAR(191) NULL,
    `responseTime` VARCHAR(191) NULL,
    `closestStation` VARCHAR(191) NULL,
    `accountId` VARCHAR(191) NOT NULL,
    `fixedJobDesireSalary` INTEGER NULL,

    UNIQUE INDEX `Doctor_accountId_key`(`accountId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Clinic` (
    `id` VARCHAR(191) NOT NULL,
    `numberOfLikes` INTEGER NOT NULL DEFAULT 0,
    `job` ENUM('DOCTOR', 'ASSISTANT') NULL,
    `latestUniversityName` VARCHAR(191) NULL,
    `universityFrom` DATETIME(3) NULL,
    `universityTo` DATETIME(3) NULL,
    `university` ENUM('COMPLETE', 'GRADUATION', 'STUDENT', 'ABSENT') NULL,
    `highSchoolName` VARCHAR(191) NULL,
    `highSchoolFrom` DATETIME(3) NULL,
    `highSchoolTo` DATETIME(3) NULL,
    `highSchool` ENUM('COMPLETE', 'GRADUATION', 'STUDENT', 'ABSENT') NULL,
    `juniorHighSchoolName` VARCHAR(191) NULL,
    `juniorHighSchoolFrom` DATETIME(3) NULL,
    `juniorHighSchoolTo` DATETIME(3) NULL,
    `juniorHighSchool` ENUM('COMPLETE', 'GRADUATION', 'STUDENT', 'ABSENT') NULL,
    `latestCompanyName` VARCHAR(191) NULL,
    `latestCompanyFrom` DATETIME(3) NULL,
    `latestCompanyTo` DATETIME(3) NULL,
    `resignReason` ENUM('PERSONAL_CONVENIENCE', 'COMPANY_CONVENIENCE') NULL,
    `freeText` VARCHAR(191) NULL,
    `clinicName` VARCHAR(191) NULL,
    `nozaId` VARCHAR(191) NULL,
    `longtitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `responseTime` VARCHAR(191) NULL,
    `appealPoint` VARCHAR(191) NULL,
    `closestStation` VARCHAR(191) NULL,
    `timeWalkingToClosetStation` INTEGER NULL,
    `url` VARCHAR(191) NULL,
    `directorFirstName` VARCHAR(191) NULL,
    `directorLastName` VARCHAR(191) NULL,
    `directorFirstNameKana` VARCHAR(191) NULL,
    `contactEmail` VARCHAR(191) NULL,
    `directorLastNameKana` VARCHAR(191) NULL,
    `directorBirthDay` DATETIME(3) NULL,
    `recruitPersonType` VARCHAR(191) NULL,
    `approveStatus` ENUM('NOT_APPROVED_YET', 'APPROVED') NULL,
    `directorGender` ENUM('MALE', 'FEMALE', 'OTHER') NULL,
    `accountId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Clinic_accountId_key`(`accountId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ClinicJobOffer` (
    `id` VARCHAR(191) NOT NULL,
    `jobType` ENUM('DOCTOR', 'ASSISTANT') NULL,
    `jobTitle` VARCHAR(191) NULL,
    `jobDescription` VARCHAR(191) NULL,
    `employeeType` ENUM('FULL_TIME', 'PARTIAL_TIME', 'CONTRACT', 'SPOT') NULL,
    `employeePeriod` VARCHAR(191) NULL,
    `salary` DOUBLE NULL,
    `salaryExtraInfo` VARCHAR(191) NULL,
    `allowance` VARCHAR(191) NULL,
    `probationPeriod` VARCHAR(191) NULL,
    `holidayInfo` VARCHAR(191) NULL,
    `annualHolidays` VARCHAR(191) NULL,
    `dutyHours` VARCHAR(191) NULL,
    `overTimeWork` VARCHAR(191) NULL,
    `appealPoints` VARCHAR(191) NULL,
    `benefits` VARCHAR(191) NULL,
    `socialInsurance` VARCHAR(191) NULL,
    `trainingSystem` VARCHAR(191) NULL,
    `employeesInfo` VARCHAR(191) NULL,
    `extraInfo` VARCHAR(191) NULL,
    `startTime` DATETIME(3) NULL,
    `endTime` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,
    `offerType` ENUM('FIXED_DATE', 'BY_DATE') NULL,
    `clinicId` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Contact` (
    `id` VARCHAR(191) NOT NULL,
    `content` ENUM('FORGET_PASSWORD') NOT NULL,
    `accountName` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Area` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(191) NOT NULL,
    `region` VARCHAR(191) NOT NULL,
    `prefecture` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `address1` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Line` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lineCd` VARCHAR(191) NOT NULL,
    `lineName` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Station` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `stationName` VARCHAR(191) NOT NULL,
    `lineCd` VARCHAR(191) NOT NULL,
    `postCode` VARCHAR(191) NOT NULL,
    `lineId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Matching` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `doctorId` VARCHAR(191) NOT NULL,
    `clinicId` VARCHAR(191) NOT NULL,
    `likedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `matchedAt` DATETIME(3) NULL,
    `firstLikeType` ENUM('DOCTOR', 'CLINIC') NOT NULL,
    `isMatching` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Block` (
    `id` VARCHAR(191) NOT NULL,
    `doctorId` VARCHAR(191) NULL,
    `clinicId` VARCHAR(191) NULL,
    `isDoctorBlock` BOOLEAN NOT NULL DEFAULT false,
    `isClinicBlock` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `File` ADD CONSTRAINT `File_accountId_fkey` FOREIGN KEY (`accountId`) REFERENCES `Account`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `File` ADD CONSTRAINT `File_clinicJobOfferId_fkey` FOREIGN KEY (`clinicJobOfferId`) REFERENCES `ClinicJobOffer`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Certificate` ADD CONSTRAINT `Certificate_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `Doctor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Certificate` ADD CONSTRAINT `Certificate_clinicId_fkey` FOREIGN KEY (`clinicId`) REFERENCES `Clinic`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AccountEmployeeTypes` ADD CONSTRAINT `AccountEmployeeTypes_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `Doctor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AccountEmployeeTypes` ADD CONSTRAINT `AccountEmployeeTypes_clinicId_fkey` FOREIGN KEY (`clinicId`) REFERENCES `Clinic`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MySelect` ADD CONSTRAINT `MySelect_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AccountMySelect` ADD CONSTRAINT `AccountMySelect_mySelectId_fkey` FOREIGN KEY (`mySelectId`) REFERENCES `MySelect`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AccountMySelect` ADD CONSTRAINT `AccountMySelect_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `Doctor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AccountMySelect` ADD CONSTRAINT `AccountMySelect_clinicId_fkey` FOREIGN KEY (`clinicId`) REFERENCES `Clinic`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BookMark` ADD CONSTRAINT `BookMark_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `Doctor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BookMark` ADD CONSTRAINT `BookMark_clinicId_fkey` FOREIGN KEY (`clinicId`) REFERENCES `Clinic`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DesiredSpotJob` ADD CONSTRAINT `DesiredSpotJob_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `Doctor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_accountId_fkey` FOREIGN KEY (`accountId`) REFERENCES `Account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SystemAdmin` ADD CONSTRAINT `SystemAdmin_accountId_fkey` FOREIGN KEY (`accountId`) REFERENCES `Account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SystemAdmin` ADD CONSTRAINT `SystemAdmin_adminRoleId_fkey` FOREIGN KEY (`adminRoleId`) REFERENCES `AdminRole`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Doctor` ADD CONSTRAINT `Doctor_accountId_fkey` FOREIGN KEY (`accountId`) REFERENCES `Account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Clinic` ADD CONSTRAINT `Clinic_accountId_fkey` FOREIGN KEY (`accountId`) REFERENCES `Account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ClinicJobOffer` ADD CONSTRAINT `ClinicJobOffer_clinicId_fkey` FOREIGN KEY (`clinicId`) REFERENCES `Clinic`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Station` ADD CONSTRAINT `Station_lineId_fkey` FOREIGN KEY (`lineId`) REFERENCES `Line`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Matching` ADD CONSTRAINT `Matching_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `Doctor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Matching` ADD CONSTRAINT `Matching_clinicId_fkey` FOREIGN KEY (`clinicId`) REFERENCES `Clinic`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Block` ADD CONSTRAINT `Block_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `Doctor`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Block` ADD CONSTRAINT `Block_clinicId_fkey` FOREIGN KEY (`clinicId`) REFERENCES `Clinic`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
