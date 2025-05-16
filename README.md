# Setup and Management

This project provides local containerized databases with helper shell scripts to streamline setup, connection, and data import tasks.

---

## 🚀 Getting Started

### Create and start all database containers

```bash
docker compose up -d
```

This will start the MySQL container in detached mode.

---

### Connect to the Database

```bash
bash scripts/mysql/connect.sh mysql9.3
```

This opens a terminal connection to the MySQL instance named `mysql9.3`.

---

### Import Data into the Database

```bash
bash scripts/mysql/import.sh mysql9.3
```

This script imports some test data from the `test_country.sql` and `test_country.tsv` file into the database.

---

## 🧪 Health Check

To verify if the MySQL service is running properly:

```bash
bash scripts/mysql/health-check.sh
```

---

## 🔄 Reset the Database

To drop and recreate the database:

```bash
bash scripts/mysql/reset.sh
```

---

## 🛠 Environment Setup

Ensure your `.env` file is configured correctly. If needed, load variables using:

```bash
source environment.sh
```
