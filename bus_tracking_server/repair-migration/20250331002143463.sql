BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE ONLY "bus"
    ADD CONSTRAINT "bus_fk_0"
    FOREIGN KEY("routeID")
    REFERENCES "routes"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "driver_info" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "busId" bigint NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE ONLY "gps_data"
    ADD CONSTRAINT "gps_data_fk_0"
    FOREIGN KEY("busID")
    REFERENCES "bus"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
DROP INDEX "route_pkey";
ALTER TABLE "routes" ALTER COLUMN "id" SET DEFAULT nextval('routes_id_seq'::regclass);
CREATE UNIQUE INDEX "routes_pkey" ON "routes" USING btree ("id");
--
-- ACTION ALTER TABLE
--
ALTER TABLE ONLY "stop"
    ADD CONSTRAINT "stop_fk_0"
    FOREIGN KEY("routeID")
    REFERENCES "routes"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION DROP TABLE
--
DROP TABLE "user" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "role" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "user" USING btree ("userInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "driver_info"
    ADD CONSTRAINT "driver_info_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "driver_info"
    ADD CONSTRAINT "driver_info_fk_1"
    FOREIGN KEY("busId")
    REFERENCES "bus"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user"
    ADD CONSTRAINT "user_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR bus_tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('bus_tracking', '20250330235935830', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250330235935830', "timestamp" = now();

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

--
-- MIGRATION VERSION FOR _repair
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('_repair', '20250331002143463', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250331002143463', "timestamp" = now();


COMMIT;
