# Compass Mining

To simulate an environment that fosters an easy workflow between DBAs and Engineers managing infrastructures, scripts etc
Two files have been created;
1. Schema (schema.sql) defines the database structure, including tables, functions, views, and user roles.
2. Shell script (setup_db.sh) automates database setup by executing schema.sql and managing PostgreSQL connections.

This repository contains scripts to set up a PostgreSQL database (booksdb) with predefined users, tables, functions, and views. Follow the instructions below to set up and use the database.

## 🛠️ Prerequisites

Before running the setup, ensure you have:
- Docker installed (if using Docker to run PostgreSQL).
- PostgreSQL installed locally (if running without Docker).
- Bash shell (for running scripts).

##Run Postgres as a container for testing
```
sudo docker run --name postgres-test \
    -e POSTGRES_PASSWORD=mysecretpassword \
    -p 5432:5432 -d postgres
```

## Run the script
```
chmod +x setup_db.sh
./setup_db.sh
```

This script:
- Connects to PostgreSQL.
- Creates the booksdb database (if it doesn’t exist).
- Creates users (books_admin, books_viewer) and assigns privileges.
- Sets up the books table and assigns ownership to books_admin.
- Creates a function (insert_book) to add books.
- Creates a view (books_view) for user (books_viewer).
- Grants necessary permissions to users.
- Insert a sample book.
