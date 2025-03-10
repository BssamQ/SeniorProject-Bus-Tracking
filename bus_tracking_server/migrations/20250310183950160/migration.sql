BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "bus" ALTER COLUMN "routeID" DROP NOT NULL;
ALTER TABLE "bus" ALTER COLUMN "latitude" DROP NOT NULL;
ALTER TABLE "bus" ALTER COLUMN "longitude" DROP NOT NULL;

--
-- MIGRATION VERSION FOR bus_tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('bus_tracking', '20250310183950160', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250310183950160', "timestamp" = now();

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
