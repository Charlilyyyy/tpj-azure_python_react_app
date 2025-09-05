-- -------------------------------------------------------------
-- TablePlus 6.2.1(579)
--
-- https://tableplus.com/
--
-- Database: mydatabase
-- Generation Time: 2025-08-09 19:21:45.8020
-- -------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS "permissions";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "permissions" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "name" varchar(100) NOT NULL,
    "description" text,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    "deleted_at" timestamptz,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "role_permissions";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "role_permissions" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "role_id" uuid NOT NULL,
    "permission_id" uuid NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "sale_histories";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "sale_histories" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "sale_id" uuid NOT NULL,
    "changed_by" uuid,
    "change_type" varchar(50) NOT NULL,
    "status_id" uuid,
    "old_data" jsonb,
    "new_data" jsonb,
    "changed_at" timestamptz DEFAULT now(),
    "deleted_at" timestamptz,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "sales";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "sales" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "item_id" uuid NOT NULL,
    "seller_id" uuid NOT NULL,
    "sale_price" numeric(10,2) NOT NULL,
    "sale_date" timestamptz NOT NULL DEFAULT now(),
    "sale_time" timestamptz NOT NULL,
    "status_id" uuid,
    "is_active" bool DEFAULT true,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    "deleted_at" timestamptz,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "user_roles";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "user_roles" (
    "user_id" uuid NOT NULL,
    "role_id" uuid NOT NULL,
    "assigned_at" timestamptz DEFAULT now(),
    "deleted_at" timestamptz,
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "users";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "users" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "username" varchar(100) NOT NULL,
    "password" text NOT NULL,
    "country_code" varchar(5),
    "phone" varchar(20),
    "profile_image_url" text,
    "deleted_at" timestamptz,
    "name" text,
    "email" varchar(255) NOT NULL,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    "email_token" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "zz_currency";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_currency" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "code" bpchar(3) NOT NULL,
    "name" varchar(100) NOT NULL,
    "symbol" varchar(10),
    "is_active" bool DEFAULT true,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "zz_discounts";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_discounts" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "name" varchar(100) NOT NULL,
    "code" varchar(50) NOT NULL,
    "description" text,
    "discount_type" varchar(20) NOT NULL,
    "value" numeric(10,2) NOT NULL,
    "max_uses" int4,
    "used_count" int4 DEFAULT 0,
    "started_at" timestamptz,
    "ended_at" timestamptz,
    "is_active" bool DEFAULT true,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    "deleted_at" timestamptz,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "zz_fee_price";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_fee_price" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "name" varchar(100) NOT NULL,
    "description" text,
    "fee_percent" numeric(5,2) NOT NULL,
    "fixed_fee" numeric(10,2) DEFAULT '0'::numeric,
    "currency" varchar(10) DEFAULT 'USD'::character varying,
    "is_active" bool DEFAULT true,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "zz_membership_price";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_membership_price" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "membership_type_id" uuid NOT NULL,
    "price" numeric(10,2) NOT NULL,
    "currency" varchar(10) DEFAULT 'USD'::character varying,
    "is_active" bool DEFAULT true,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "zz_membership_type";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_membership_type" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "name" varchar(100) NOT NULL,
    "description" text,
    "is_active" bool DEFAULT true,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "zz_permissions";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_permissions" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "name" varchar(100) NOT NULL,
    "description" text,
    "is_active" bool DEFAULT true,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "zz_role_permissions";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_role_permissions" (
    "role_id" uuid NOT NULL,
    "permission_id" uuid NOT NULL,
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    PRIMARY KEY ("role_id","permission_id")
);

DROP TABLE IF EXISTS "zz_roles";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_roles" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "name" varchar(100) NOT NULL,
    "description" text,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    "deleted_at" timestamptz,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "zz_status";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_status" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "name" varchar(50) NOT NULL,
    "description" text,
    "is_active" bool DEFAULT true,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
    "type" text,
    PRIMARY KEY ("id")
);

INSERT INTO "user_roles" ("user_id", "role_id", "assigned_at", "deleted_at", "id") VALUES
('238ac1f1-edcb-4e43-ba2b-a07ba1fc62b5', '5cd1294f-03ff-4181-93b3-f5d7ea63b2ed', '2025-06-23 02:20:41.285969+00', NULL, '04d2bf08-70c9-47c2-b9b9-56724adff07a'),
('0eb9defc-d361-451d-ae19-dc2377065fd9', '01824f22-c647-47a9-8fbb-303c4e2a5895', '2025-06-23 02:21:23.348372+00', NULL, '5e738dee-d691-4ecb-8180-e0ab6aa535fb'),
('69a83896-0d4f-4404-9c3f-29dad1f4cade', 'f0ec16a8-78b4-4b53-a4f1-5a870db0203b', '2025-07-18 05:42:01.685909+00', NULL, '7e1f4a59-165e-45c8-93d8-a3e79c44e9c8'),
('8259a119-8255-4140-b3d1-72623e8f32a6', 'f0ec16a8-78b4-4b53-a4f1-5a870db0203b', '2025-06-23 02:21:02.224197+00', NULL, 'b6efe1d7-27f5-4b10-b24b-7891191928af'),
('69a83896-0d4f-4404-9c3f-29dad1f4cade', 'c4a28864-afde-4162-9412-8e6c2be436b3', '2025-06-23 02:21:38.164297+00', NULL, 'caaad9f0-5767-4741-a4db-fffb4a850b34');

INSERT INTO "users" ("id", "username", "password", "country_code", "phone", "profile_image_url", "deleted_at", "name", "email", "created_at", "updated_at", "email_token") VALUES
('0eb9defc-d361-451d-ae19-dc2377065fd9', 'renter', '$2b$10$U4KVq8QYbhB1wtQTh71chOWVy2p7EWgaDbUzGfe/KUGuI9awV6ZFW', '+60', '0123456789', '/pub/ada2.png', NULL, 'Renter', 'renter@gmail.com', '2025-06-23 02:19:24.742207+00', '2025-06-23 02:19:24.742207+00', NULL),
('238ac1f1-edcb-4e43-ba2b-a07ba1fc62b5', 'superadmin', '$2b$10$U4KVq8QYbhB1wtQTh71chOWVy2p7EWgaDbUzGfe/KUGuI9awV6ZFW', '+60', '01161820154', '/pub/ada.png', NULL, 'SuperAdmin', 'superadmin@gmail.com', '2025-06-23 02:08:00.209612+00', '2025-06-23 02:08:00.209612+00', NULL),
('39625674-2000-4f66-962b-8cbd1f66b4ab', 'testingOne', '$2b$10$U4KVq8QYbhB1wtQTh71chOWVy2p7EWgaDbUzGfe/KUGuI9awV6ZFW', '+60', '01111119999', '/pub/ada.png', NULL, 'Testing One', 'testing1@gmail.com', '2025-06-23 10:40:08.511236+00', '2025-06-23 10:40:08.511236+00', NULL),
('69a83896-0d4f-4404-9c3f-29dad1f4cade', 'buyer', '$2b$10$BLrPtvXIpkytZVyeyDS5weHEvEJ2H4kmH.sysPgJhLjyfDq0YOn7S', '+62', '0188987263', '/pub/ada3.png', NULL, 'Buyer', 'cly.taufikm@gmail.com', '2025-06-23 02:20:02.222677+00', '2025-07-21 09:01:29.03465+00', NULL),
('8259a119-8255-4140-b3d1-72623e8f32a6', 'admin', '$2b$10$U4KVq8QYbhB1wtQTh71chOWVy2p7EWgaDbUzGfe/KUGuI9awV6ZFW', '+62', '0122222222', '/pub/ada1.png', NULL, 'Admin', 'admin@gmail.com', '2025-06-23 02:18:30.64986+00', '2025-06-23 02:18:30.64986+00', NULL);

INSERT INTO "zz_currency" ("id", "code", "name", "symbol", "is_active", "created_at", "updated_at") VALUES
('03500fc6-e72b-4cb7-8591-09604e603328', 'IDR', 'Indonesian Rupiah', 'Rp', 't', '2025-06-23 04:06:44.132774+00', '2025-06-23 04:06:44.132774+00'),
('0e198fe0-e2a4-4d54-aca6-31265904d264', 'MYR', 'Malaysian Ringgit', 'RM', 't', '2025-06-23 04:06:44.132774+00', '2025-06-23 04:06:44.132774+00'),
('7da33e61-e042-4801-9e3f-b03ea1ed7b28', 'JPY', 'Japanese Yen', '¥', 't', '2025-06-23 04:06:44.132774+00', '2025-06-23 04:06:44.132774+00'),
('b5c8829e-8c8f-467f-98e5-04b40a38fd1b', 'EUR', 'Euro', '€', 't', '2025-06-23 04:06:44.132774+00', '2025-06-23 04:06:44.132774+00'),
('d83dc713-79cf-4840-9e69-a1d2b53b29de', 'USD', 'United States Dollar', '$', 't', '2025-06-23 04:06:44.132774+00', '2025-06-23 04:06:44.132774+00'),
('fb6ebae9-caf2-4fed-a251-c16362575b0e', 'SGD', 'Singapore Dollar', 'S$', 't', '2025-06-23 04:06:44.132774+00', '2025-06-23 04:06:44.132774+00'),
('fc48e8b0-e5dd-41a4-a209-f6cf9703bf3e', 'GBP', 'British Pound Sterling', '£', 't', '2025-06-23 04:06:44.132774+00', '2025-06-23 04:06:44.132774+00');

INSERT INTO "zz_fee_price" ("id", "name", "description", "fee_percent", "fixed_fee", "currency", "is_active", "created_at", "updated_at") VALUES
('7bfd20f2-20e5-4ea6-9dc7-b2d5005b1b44', 'Normal Fee', 'normal fee for every purchase', 9.00, 0.00, 'MYR', 't', '2025-06-23 04:09:52.8812+00', '2025-06-23 04:09:52.8812+00');

INSERT INTO "zz_membership_price" ("id", "membership_type_id", "price", "currency", "is_active", "created_at", "updated_at") VALUES
('49031a62-28c0-408c-9de8-11f8abdbc280', '24c34ce4-925d-4429-810c-e6db61d8bf42', 9.99, 'MYR', 't', '2025-06-23 04:05:27.948723+00', '2025-06-23 04:05:27.948723+00');

INSERT INTO "zz_membership_type" ("id", "name", "description", "is_active", "created_at", "updated_at") VALUES
('24c34ce4-925d-4429-810c-e6db61d8bf42', 'Premium', 'premium membership', 't', '2025-06-23 04:05:00.770733+00', '2025-06-23 04:05:00.770733+00'),
('aefd4352-9cac-4a2c-99ae-c8c69c6c9653', 'Normal', 'normal membership', 't', '2025-06-23 04:05:00.770733+00', '2025-06-23 04:05:00.770733+00');

INSERT INTO "zz_permissions" ("id", "name", "description", "is_active", "created_at", "updated_at") VALUES
('08f956dd-a14b-40c4-9600-f35fec0442d3', 'can_delete_users', 'have permission to delete users', 't', '2025-06-23 02:13:54.417966+00', '2025-06-23 02:13:54.417966+00'),
('20fe3017-0517-4f6f-8d88-bebc7d6a7271', 'can_ban_users', 'have permission to ban users', 't', '2025-06-23 02:14:17.830204+00', '2025-06-23 02:14:17.830204+00'),
('5a18f4a0-8e89-415e-90be-30577411102f', 'can_edit_rent', 'have permission to edit rent', 't', '2025-06-23 02:14:59.053835+00', '2025-06-23 02:14:59.053835+00'),
('9e05a618-0fa2-463c-91cb-3060510e0e96', 'can_view_users', 'have permission to view users', 't', '2025-06-23 02:13:54.417966+00', '2025-06-23 02:13:54.417966+00'),
('c6cd0794-4eb7-4d61-a72a-107cad846b03', 'can_create_rent', 'have permission to create rent ads', 't', '2025-06-23 02:14:40.711229+00', '2025-06-23 02:14:40.711229+00'),
('f2a74ccb-7d73-4b0d-a8de-58e6dbbb0f57', 'can_create_users', 'have permission to create users', 't', '2025-06-23 02:13:08.824594+00', '2025-06-23 02:13:08.824594+00');

INSERT INTO "zz_role_permissions" ("role_id", "permission_id", "id") VALUES
('5cd1294f-03ff-4181-93b3-f5d7ea63b2ed', '08f956dd-a14b-40c4-9600-f35fec0442d3', 'bde257d4-bff7-4d3f-bbd5-9a59e2842c44'),
('5cd1294f-03ff-4181-93b3-f5d7ea63b2ed', '20fe3017-0517-4f6f-8d88-bebc7d6a7271', '23abaac5-ed0c-4234-9bb6-4797fa907676'),
('5cd1294f-03ff-4181-93b3-f5d7ea63b2ed', '5a18f4a0-8e89-415e-90be-30577411102f', 'a226184f-ba1c-4ec6-b2e1-22b9467b9cb6'),
('5cd1294f-03ff-4181-93b3-f5d7ea63b2ed', '9e05a618-0fa2-463c-91cb-3060510e0e96', 'f191ef24-3371-4a6b-9179-cd4959a5ea93'),
('5cd1294f-03ff-4181-93b3-f5d7ea63b2ed', 'c6cd0794-4eb7-4d61-a72a-107cad846b03', '66698851-7cee-4883-ac73-3013365ddf26'),
('5cd1294f-03ff-4181-93b3-f5d7ea63b2ed', 'f2a74ccb-7d73-4b0d-a8de-58e6dbbb0f57', '134ede64-7b4d-44a5-8dec-2bc3994a79fb');

INSERT INTO "zz_roles" ("id", "name", "description", "created_at", "updated_at", "deleted_at") VALUES
('01824f22-c647-47a9-8fbb-303c4e2a5895', 'renter', 'for seller or renter', '2025-06-23 02:12:14.842836+00', '2025-06-23 02:12:14.842836+00', NULL),
('5cd1294f-03ff-4181-93b3-f5d7ea63b2ed', 'superadmin', 'for superadmin', '2025-06-23 02:12:14.842836+00', '2025-06-23 02:12:14.842836+00', NULL),
('c4a28864-afde-4162-9412-8e6c2be436b3', 'buyer', 'for buyer', '2025-06-23 02:12:14.842836+00', '2025-06-23 02:12:14.842836+00', NULL),
('f0ec16a8-78b4-4b53-a4f1-5a870db0203b', 'admin', 'for admin', '2025-06-23 02:12:14.842836+00', '2025-06-23 02:12:14.842836+00', NULL);

INSERT INTO "zz_status" ("id", "name", "description", "is_active", "created_at", "updated_at", "type") VALUES
('0226a4ba-6a5f-4ac7-9096-ab3a1e85e3fd', 'pending', 'pending transaction', 't', '2025-06-23 04:02:01.306414+00', '2025-06-23 04:02:01.306414+00', 'transaction'),
('023f0cb2-9a29-4c06-bc05-a13626293b85', 'active', 'active transaction', 't', '2025-06-23 04:02:01.306414+00', '2025-06-23 04:02:01.306414+00', 'transaction'),
('622c933a-6c8b-4400-8c60-cda6b7a41a1e', 'active', 'active ads', 't', '2025-06-23 04:03:19.420816+00', '2025-06-23 04:03:19.420816+00', 'ads'),
('64b66854-f0d8-405f-8e30-557fd8d3bdc9', 'success', 'success transaction', 't', '2025-06-23 04:02:01.306414+00', '2025-06-23 04:02:01.306414+00', 'transaction'),
('7d830ba3-190e-4a20-a3e7-34d554c6f1ed', 'inactive', 'inactive ads', 't', '2025-06-23 04:02:01.306414+00', '2025-06-23 04:02:01.306414+00', 'ads'),
('a39f73ed-8ccf-415a-a611-13b69a1242b7', 'paid', 'paid transaction', 't', '2025-06-23 04:02:01.306414+00', '2025-06-23 04:02:01.306414+00', 'transaction'),
('bbfb4d10-fe45-4107-bc52-c6b9ccacd143', 'failed', 'failed transaction', 't', '2025-06-23 04:02:01.306414+00', '2025-06-23 04:02:01.306414+00', 'transaction');



-- Indices
CREATE UNIQUE INDEX "PK_920331560282b8bd21bb02290df" ON permissions USING btree (id);
CREATE UNIQUE INDEX "UQ_48ce552495d14eae9b187bb6716" ON permissions USING btree (name);
ALTER TABLE "role_permissions" ADD FOREIGN KEY ("role_id") REFERENCES "zz_roles"("id");
ALTER TABLE "role_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "permissions"("id");


-- Indices
CREATE UNIQUE INDEX "PK_84059017c90bfcb701b8fa42297" ON role_permissions USING btree (id);
ALTER TABLE "sale_histories" ADD FOREIGN KEY ("status_id") REFERENCES "zz_status"("id");
ALTER TABLE "sale_histories" ADD FOREIGN KEY ("sale_id") REFERENCES "sales"("id") ON DELETE CASCADE;
ALTER TABLE "sale_histories" ADD FOREIGN KEY ("changed_by") REFERENCES "users"("id");
ALTER TABLE "sales" ADD FOREIGN KEY ("seller_id") REFERENCES "users"("id");
ALTER TABLE "sales" ADD FOREIGN KEY ("status_id") REFERENCES "zz_status"("id");
-- ALTER TABLE "sales" ADD FOREIGN KEY ("item_id") REFERENCES "items"("id") ON DELETE CASCADE;
ALTER TABLE "user_roles" ADD FOREIGN KEY ("role_id") REFERENCES "zz_roles"("id");
ALTER TABLE "user_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE;


-- Indices
CREATE UNIQUE INDEX "PK_8acd5cf26ebd158416f477de799" ON user_roles USING btree (id);


-- Indices
CREATE UNIQUE INDEX "UQ_97672ac88f789774dd47f7c8be3" ON users USING btree (email);
ALTER TABLE "zz_role_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "zz_permissions"("id") ON DELETE CASCADE;
ALTER TABLE "zz_role_permissions" ADD FOREIGN KEY ("role_id") REFERENCES "zz_roles"("id") ON DELETE CASCADE;


-- Indices
CREATE UNIQUE INDEX "UQ_569ec53534cd2a7fedc2541c13d" ON zz_roles USING btree (name);