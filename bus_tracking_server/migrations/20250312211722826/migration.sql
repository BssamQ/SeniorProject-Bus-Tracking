BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "route" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "route" (
    "id" bigserial PRIMARY KEY,
    "routeName" text NOT NULL,
    "routeStartTime" text,
    "startlatitude" double precision NOT NULL,
    "startlongitude" double precision NOT NULL,
    "routeEndTime" text NOT NULL,
    "endlatitude" double precision NOT NULL,
    "endlongitude" double precision NOT NULL,
    "createdAt" timestamp without time zone
);


--
-- MIGRATION VERSION FOR bus_tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('bus_tracking', '20250312211722826', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250312211722826', "timestamp" = now();

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
