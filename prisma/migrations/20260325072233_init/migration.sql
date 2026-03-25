/*
  Warnings:

  - The values [DOCTOR,PATIENT] on the enum `Role` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `appointmentId` on the `reviews` table. All the data in the column will be lost.
  - You are about to drop the column `doctorId` on the `reviews` table. All the data in the column will be lost.
  - You are about to drop the column `patientId` on the `reviews` table. All the data in the column will be lost.
  - You are about to drop the `appointments` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `doctor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `doctor_schedules` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `doctor_specialties` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `medical_reports` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `patient` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `patient_health_data` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `prescriptions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `schedules` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `specialties` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `moderatorId` to the `reviews` table without a default value. This is not possible if the table is not empty.
  - Added the required column `touristId` to the `reviews` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Role_new" AS ENUM ('SUPER_ADMIN', 'ADMIN', 'MODERATOR', 'TOURIST');
ALTER TABLE "public"."user" ALTER COLUMN "role" DROP DEFAULT;
ALTER TABLE "user" ALTER COLUMN "role" TYPE "Role_new" USING ("role"::text::"Role_new");
ALTER TYPE "Role" RENAME TO "Role_old";
ALTER TYPE "Role_new" RENAME TO "Role";
DROP TYPE "public"."Role_old";
ALTER TABLE "user" ALTER COLUMN "role" SET DEFAULT 'TOURIST';
COMMIT;

-- DropForeignKey
ALTER TABLE "appointments" DROP CONSTRAINT "appointments_doctorId_fkey";

-- DropForeignKey
ALTER TABLE "appointments" DROP CONSTRAINT "appointments_patientId_fkey";

-- DropForeignKey
ALTER TABLE "appointments" DROP CONSTRAINT "appointments_scheduleId_fkey";

-- DropForeignKey
ALTER TABLE "doctor" DROP CONSTRAINT "doctor_userId_fkey";

-- DropForeignKey
ALTER TABLE "doctor_schedules" DROP CONSTRAINT "doctor_schedules_doctorId_fkey";

-- DropForeignKey
ALTER TABLE "doctor_schedules" DROP CONSTRAINT "doctor_schedules_scheduleId_fkey";

-- DropForeignKey
ALTER TABLE "doctor_specialties" DROP CONSTRAINT "doctor_specialties_doctorId_fkey";

-- DropForeignKey
ALTER TABLE "doctor_specialties" DROP CONSTRAINT "doctor_specialties_specialtyId_fkey";

-- DropForeignKey
ALTER TABLE "medical_reports" DROP CONSTRAINT "medical_reports_patientId_fkey";

-- DropForeignKey
ALTER TABLE "patient" DROP CONSTRAINT "patient_userId_fkey";

-- DropForeignKey
ALTER TABLE "patient_health_data" DROP CONSTRAINT "patient_health_data_patientId_fkey";

-- DropForeignKey
ALTER TABLE "payments" DROP CONSTRAINT "payments_appointmentId_fkey";

-- DropForeignKey
ALTER TABLE "prescriptions" DROP CONSTRAINT "prescriptions_appointmentId_fkey";

-- DropForeignKey
ALTER TABLE "prescriptions" DROP CONSTRAINT "prescriptions_doctorId_fkey";

-- DropForeignKey
ALTER TABLE "prescriptions" DROP CONSTRAINT "prescriptions_patientId_fkey";

-- DropForeignKey
ALTER TABLE "reviews" DROP CONSTRAINT "reviews_appointmentId_fkey";

-- DropForeignKey
ALTER TABLE "reviews" DROP CONSTRAINT "reviews_doctorId_fkey";

-- DropForeignKey
ALTER TABLE "reviews" DROP CONSTRAINT "reviews_patientId_fkey";

-- DropIndex
DROP INDEX "reviews_appointmentId_idx";

-- DropIndex
DROP INDEX "reviews_appointmentId_key";

-- DropIndex
DROP INDEX "reviews_doctorId_idx";

-- DropIndex
DROP INDEX "reviews_patientId_idx";

-- AlterTable
ALTER TABLE "reviews" DROP COLUMN "appointmentId",
DROP COLUMN "doctorId",
DROP COLUMN "patientId",
ADD COLUMN     "moderatorId" TEXT NOT NULL,
ADD COLUMN     "touristId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "user" ALTER COLUMN "role" SET DEFAULT 'TOURIST';

-- DropTable
DROP TABLE "appointments";

-- DropTable
DROP TABLE "doctor";

-- DropTable
DROP TABLE "doctor_schedules";

-- DropTable
DROP TABLE "doctor_specialties";

-- DropTable
DROP TABLE "medical_reports";

-- DropTable
DROP TABLE "patient";

-- DropTable
DROP TABLE "patient_health_data";

-- DropTable
DROP TABLE "prescriptions";

-- DropTable
DROP TABLE "schedules";

-- DropTable
DROP TABLE "specialties";

-- DropEnum
DROP TYPE "AppointmentStatus";

-- DropEnum
DROP TYPE "BloodGroup";

-- CreateTable
CREATE TABLE "moderator" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "profilePhoto" TEXT,
    "contactNumber" TEXT,
    "address" TEXT,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "deletedAt" TIMESTAMP(3),
    "experience" INTEGER NOT NULL DEFAULT 0,
    "gender" "Gender" NOT NULL,
    "qualification" TEXT,
    "currentWorkingPlace" TEXT,
    "designation" TEXT,
    "averageRating" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "moderator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tourist" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "profilePhoto" TEXT,
    "contactNumber" TEXT,
    "address" TEXT,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "deletedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "tourist_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "moderator_email_key" ON "moderator"("email");

-- CreateIndex
CREATE UNIQUE INDEX "moderator_userId_key" ON "moderator"("userId");

-- CreateIndex
CREATE INDEX "idx_moderator_email" ON "moderator"("email");

-- CreateIndex
CREATE INDEX "idx_moderator_isDeleted" ON "moderator"("isDeleted");

-- CreateIndex
CREATE UNIQUE INDEX "tourist_email_key" ON "tourist"("email");

-- CreateIndex
CREATE UNIQUE INDEX "tourist_userId_key" ON "tourist"("userId");

-- CreateIndex
CREATE INDEX "idx_tourist_email" ON "tourist"("email");

-- CreateIndex
CREATE INDEX "idx_tourist_isDeleted" ON "tourist"("isDeleted");

-- CreateIndex
CREATE INDEX "reviews_touristId_idx" ON "reviews"("touristId");

-- CreateIndex
CREATE INDEX "reviews_moderatorId_idx" ON "reviews"("moderatorId");

-- AddForeignKey
ALTER TABLE "moderator" ADD CONSTRAINT "moderator_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_touristId_fkey" FOREIGN KEY ("touristId") REFERENCES "tourist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reviews" ADD CONSTRAINT "reviews_moderatorId_fkey" FOREIGN KEY ("moderatorId") REFERENCES "moderator"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tourist" ADD CONSTRAINT "tourist_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
