BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "route" CASCADE;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "bus" DROP CONSTRAINT "bus_fk_0";
ALTER TABLE ONLY "bus"
    ADD CONSTRAINT "bus_fk_0"
    FOREIGN KEY("routeID")
    REFERENCES "routes"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "routes" (
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
-- ACTION ALTER TABLE
--
ALTER TABLE "stop" DROP CONSTRAINT "stop_fk_0";
ALTER TABLE ONLY "stop"
    ADD CONSTRAINT "stop_fk_0"
    FOREIGN KEY("routeID")
    REFERENCES "routes"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR bus_tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('bus_tracking', '20250317105748900', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250317105748900', "timestamp" = now();

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
