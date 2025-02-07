BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user" DROP COLUMN "name";
ALTER TABLE "user" DROP COLUMN "email";
ALTER TABLE "user" DROP COLUMN "passwordHash";
ALTER TABLE "user" DROP COLUMN "lastLogin";
ALTER TABLE "user" ADD COLUMN "userId" bigint;
ALTER TABLE "user" ADD COLUMN "location" text;
ALTER TABLE "user" ADD COLUMN "latitude" double precision;
ALTER TABLE "user" ADD COLUMN "longitude" double precision;
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR bus_tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('bus_tracking', '20250206191934935', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250206191934935', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
