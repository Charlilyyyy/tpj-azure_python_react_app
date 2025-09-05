-- -------------------------------------------------------------
-- TablePlus 6.2.1(579)
--
-- https://tableplus.com/
--
-- Database: mydatabase
-- Generation Time: 2025-08-05 11:50:09.2190
-- -------------------------------------------------------------


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

DROP TABLE IF EXISTS "zz_role_permission";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_role_permission" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "role_id" uuid NOT NULL,
    "permission_id" uuid NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "zz_role_permissions";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_role_permissions" (
    "role_id" uuid NOT NULL,
    "permission_id" uuid NOT NULL,
    PRIMARY KEY ("role_id","permission_id")
);

DROP TABLE IF EXISTS "zz_roles";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "zz_roles" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "name" varchar(100) NOT NULL,
    "description" text,
    "is_active" bool DEFAULT true,
    "created_at" timestamptz DEFAULT now(),
    "updated_at" timestamptz DEFAULT now(),
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

ALTER TABLE "sale_histories" ADD FOREIGN KEY ("sale_id") REFERENCES "sales"("id") ON DELETE CASCADE;
ALTER TABLE "sale_histories" ADD FOREIGN KEY ("changed_by") REFERENCES "users"("id");
ALTER TABLE "sale_histories" ADD FOREIGN KEY ("status_id") REFERENCES "zz_status"("id");
ALTER TABLE "sales" ADD FOREIGN KEY ("status_id") REFERENCES "zz_status"("id");
ALTER TABLE "sales" ADD FOREIGN KEY ("seller_id") REFERENCES "users"("id");
ALTER TABLE "user_roles" ADD FOREIGN KEY ("role_id") REFERENCES "zz_roles"("id");
ALTER TABLE "user_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users"("id");


-- Indices
CREATE UNIQUE INDEX "PK_8acd5cf26ebd158416f477de799" ON public.user_roles USING btree (id);


-- Indices
CREATE UNIQUE INDEX "UQ_97672ac88f789774dd47f7c8be3" ON public.users USING btree (email);
ALTER TABLE "zz_role_permission" ADD FOREIGN KEY ("role_id") REFERENCES "zz_roles"("id");
ALTER TABLE "zz_role_permission" ADD FOREIGN KEY ("permission_id") REFERENCES "zz_permissions"("id");


-- Indices
CREATE UNIQUE INDEX "PK_eb1e1824d127dc11daaadb402bb" ON public.zz_role_permission USING btree (id);
ALTER TABLE "zz_role_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "zz_permissions"("id") ON DELETE CASCADE;
ALTER TABLE "zz_role_permissions" ADD FOREIGN KEY ("role_id") REFERENCES "zz_roles"("id") ON DELETE CASCADE;