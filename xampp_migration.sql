-- SmartQuiz SQLite-to-XAMPP (MySQL/MariaDB) schema migration.
-- Import this file in phpMyAdmin. It creates the database and tables only;
-- users.db currently contains zero rows, so there are no records to copy.

CREATE DATABASE IF NOT EXISTS smartquiz
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE smartquiz;

CREATE TABLE IF NOT EXISTS users (
  email VARCHAR(254) NOT NULL PRIMARY KEY,
  salt VARBINARY(64) NOT NULL,
  password_hash VARBINARY(128) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS sign_in_attempts (
  email VARCHAR(254) NOT NULL PRIMARY KEY,
  failures INT NOT NULL,
  locked_until DOUBLE NOT NULL DEFAULT 0
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS pending_accounts (
  email VARCHAR(254) NOT NULL PRIMARY KEY,
  password_salt VARBINARY(64) NOT NULL,
  password_hash VARBINARY(128) NOT NULL,
  code_salt VARBINARY(64) NOT NULL,
  code_hash VARBINARY(128) NOT NULL,
  expires_at DOUBLE NOT NULL,
  attempts INT NOT NULL DEFAULT 0,
  last_sent_at DOUBLE NOT NULL
) ENGINE=InnoDB;
