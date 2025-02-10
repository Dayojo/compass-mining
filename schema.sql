-- Connect to booksdb
\c booksdb;

-- Create users
CREATE USER books_admin WITH ENCRYPTED PASSWORD 'adminpassword';
CREATE USER books_viewer WITH ENCRYPTED PASSWORD 'viewerpassword';

-- Grant books_admin full privileges
GRANT ALL PRIVILEGES ON DATABASE booksdb TO books_admin;

-- Grant books_viewer limited privileges
GRANT CONNECT ON DATABASE booksdb TO books_viewer;
GRANT USAGE ON SCHEMA public TO books_viewer;

-- Create books table (if not exists)
CREATE TABLE IF NOT EXISTS books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255)
);

-- Set ownership of books table to books_admin
ALTER TABLE books OWNER TO books_admin;

-- Set permissions on books table
GRANT ALL PRIVILEGES ON TABLE books TO books_admin;
GRANT SELECT, INSERT ON TABLE books TO books_viewer;

-- Function to insert books
CREATE OR REPLACE FUNCTION insert_book(
    p_title VARCHAR,
    p_subtitle VARCHAR,
    p_author VARCHAR,
    p_publisher VARCHAR
) RETURNS VOID AS $$
BEGIN
    INSERT INTO books (title, subtitle, author, publisher)
    VALUES (p_title, p_subtitle, p_author, p_publisher);
END;
$$ LANGUAGE plpgsql;

-- Allow function to own to books_admin
ALTER FUNCTION insert_book OWNER TO books_admin;

-- Grant execution rights to books_admin
GRANT EXECUTE ON FUNCTION insert_book TO books_admin;

-- Create a view to list books with publishers
CREATE OR REPLACE VIEW books_view AS
SELECT id, title, subtitle, author, publisher
FROM books
WHERE publisher IS NOT NULL;

-- Grant permissions on the view
GRANT SELECT ON books_view TO books_viewer;