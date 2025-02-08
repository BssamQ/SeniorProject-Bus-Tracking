BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "user" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "role" text NOT NULL,
    "location" text,
    "latitude" double precision,
    "longitude" double precision
);


--
-- MIGRATION VERSION FOR bus_tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('bus_tracking', '20250208083524329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250208083524329', "timestamp" = now();

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
