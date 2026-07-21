/*
  Warnings:

  - You are about to drop the column `semester` on the `stud_mod_performance` table. All the data in the column will be lost.
  - You are about to alter the column `mark` on the `stud_mod_performance` table. The data in that column could be lost. The data in that column will be cast from `Decimal(5,2)` to `Integer`.
  - You are about to alter the column `stud_name` on the `student` table. The data in that column could be lost. The data in that column will be cast from `VarChar(100)` to `VarChar(30)`.
  - Added the required column `address` to the `student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dob` to the `student` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "stud_mod_performance" DROP COLUMN "semester",
ALTER COLUMN "mark" DROP NOT NULL,
ALTER COLUMN "mark" SET DATA TYPE INTEGER,
ALTER COLUMN "grade" DROP NOT NULL;

-- AlterTable
ALTER TABLE "student" ADD COLUMN     "address" VARCHAR(100) NOT NULL,
ADD COLUMN     "dob" DATE NOT NULL,
ADD COLUMN     "home_phone" CHAR(8),
ADD COLUMN     "mobile_phone" CHAR(8),
ALTER COLUMN "stud_name" SET DATA TYPE VARCHAR(30);

-- RenameForeignKey
ALTER TABLE "course" RENAME CONSTRAINT "fk_course_offered_by" TO "course_offered_by_fk";

-- AddForeignKey
ALTER TABLE "module" ADD CONSTRAINT "mod_mod_coord_fk" FOREIGN KEY ("mod_coord") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;
