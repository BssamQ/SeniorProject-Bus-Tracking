BEGIN;

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
    "status" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "gps_data" (
    "id" bigserial PRIMARY KEY,
    "busID" bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "notification" (
    "id" bigserial PRIMARY KEY,
    "userID" bigint NOT NULL,
    "message" text NOT NULL,
    "type" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "readStatus" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "route" (
    "id" bigserial PRIMARY KEY,
    "routeName" text NOT NULL,
    "routeStartTime" text NOT NULL,
    "startPoint" text NOT NULL,
    "routeEndTime" text NOT NULL,
    "endPoint" text NOT NULL,
    "createdAt" timestamp without time zone
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "station" ALTER COLUMN "latitude" SET NOT NULL;
ALTER TABLE "station" ALTER COLUMN "longitude" SET NOT NULL;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "stop" (
    "id" bigserial PRIMARY KEY,
    "stopName" text NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL,
    "stopOrder" bigint NOT NULL,
    "createdAt" timestamp without time zone,
    "routeID" bigint NOT NULL
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "gps_data"
    ADD CONSTRAINT "gps_data_fk_0"
    FOREIGN KEY("busID")
    REFERENCES "bus"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "notification"
    ADD CONSTRAINT "notification_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "stop"
    ADD CONSTRAINT "stop_fk_0"
    FOREIGN KEY("routeID")
    REFERENCES "route"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR bus_tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('bus_tracking', '20250310125931772', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250310125931772', "timestamp" = now();

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
