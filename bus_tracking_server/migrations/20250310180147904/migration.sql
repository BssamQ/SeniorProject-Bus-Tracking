BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "bus" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "bus" (
    "id" bigserial PRIMARY KEY,
    "busNumber" text NOT NULL,
    "routeID" bigint NOT NULL,
    "driverName" text NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL,
    "status" text NOT NULL,
    "age" bigint NOT NULL,
    "breakdownCounter" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "bus"
    ADD CONSTRAINT "bus_fk_0"
    FOREIGN KEY("routeID")
    REFERENCES "route"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR bus_tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('bus_tracking', '20250310180147904', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250310180147904', "timestamp" = now();

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
