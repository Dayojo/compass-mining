#!/bin/bash
set -e

DB_NAME="booksdb"

# PostgreSQL command
run_psql() {
    local sql_command="$1"
    psql -h localhost -U postgres -d "$DB_NAME" -c "$sql_command"
}

# Create DB
create_database() {
    echo "Creating database ${DB_NAME}..."
    psql -h localhost -U postgres -c "CREATE DATABASE ${DB_NAME};" || echo "Database already exists."
}

# Set up the database schema
setup_schema() {
    echo "Setting up database structure..."
    psql -h localhost -U postgres -d "$DB_NAME" -f schema.sql
}

# Test inserting a book
test_insert_book() {
    echo "Inserting a sample book..."
    run_psql "SELECT insert_book('The Half of a Yellow Sun', 'A Historical Fiction', 'Chimamanda Ngozi Adichie', '4th Estate');"
}

create_database
setup_schema
test_insert_book

echo "Database setup complete!"
