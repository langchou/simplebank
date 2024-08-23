CREATE TABLE "accounts" (
  "id" bigint PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "create_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "entries" (
  "id" bigint PRIMARY KEY,
  "account_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "create_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "transfers" (
  "id" bigint PRIMARY KEY,
  "from_accounts_id" bigint NOT NULL,
  "to_accounts_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "create_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfers" ("from_accounts_id");

CREATE INDEX ON "transfers" ("to_accounts_id");

CREATE INDEX ON "transfers" ("from_accounts_id", "to_accounts_id");

COMMENT ON COLUMN "entries"."amount" IS '可以是正的或负的';

COMMENT ON COLUMN "transfers"."amount" IS '必须是正的';

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_accounts_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_accounts_id") REFERENCES "accounts" ("id");
