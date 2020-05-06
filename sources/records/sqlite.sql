BEGIN TRANSACTION;
CREATE TABLE `vendors` (
	`vendor_code`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`name`	TEXT NOT NULL,
	`address`	TEXT
);
CREATE TABLE `units` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`unit`	TEXT NOT NULL UNIQUE
);
CREATE TABLE "sales_invoice" (
	`invoice_no`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`date`	TEXT NOT NULL,
	`vendor_code`	INTEGER NOT NULL,
	`item_code`	INTEGER NOT NULL,
	`quantity`	REAL NOT NULL,
	`rate_per_unit`	REAL NOT NULL,
	`amount_paid`	INTEGER NOT NULL
);
CREATE TABLE "purchase_invoice" (
	`invoice_no`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`date`	TEXT NOT NULL,
	`vendor_code`	INTEGER NOT NULL,
	`item_code`	INTEGER NOT NULL,
	`quantity`	REAL NOT NULL,
	`rate_per_unit`	REAL NOT NULL,
	`amount_paid`	REAL NOT NULL
);
CREATE TABLE "items" (
	`item_code`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`item_description`	TEXT,
	`quantity`	REAL NOT NULL,
	`unit`	INTEGER NOT NULL
);
COMMIT;