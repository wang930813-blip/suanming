# Docker Deployment

This project is a legacy PHP application. Use PHP 5.6 and MySQL 5.6.

## 1. Prepare the database dump

The root `数据库.sql` file is ignored by Git. Before the first Docker start, copy it into the MySQL init directory:

PowerShell:

```powershell
Copy-Item -LiteralPath '数据库.sql' -Destination 'docker/db-init/01-database.sql'
```

Linux:

```bash
cp 数据库.sql docker/db-init/01-database.sql
```

MySQL only imports files in `docker/db-init` when the database volume is empty.

## 2. Configure environment

Copy the example file:

```bash
cp .env.example .env
```

Edit `.env`:

```dotenv
APP_PORT=8080
APP_URL=http://your-domain-or-ip:8080/
MYSQL_ROOT_PASSWORD=change_root_password
MYSQL_DATABASE=565656sql
MYSQL_USER=suanming
MYSQL_PASSWORD=change_database_password
```

## 3. Start

```bash
docker compose up -d --build
```

Open:

```text
http://your-domain-or-ip:8080/
```

Admin:

```text
http://your-domain-or-ip:8080/acs
```

Default account from the original notes:

```text
admin / 123123
```

Change the password after the first login.

## 4. Re-import the database

If you need to import `docker/db-init/01-database.sql` again, remove the database volume first:

```bash
docker compose down -v
docker compose up -d --build
```

This deletes the container database data and imports the SQL dump again.
