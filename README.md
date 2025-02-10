# compass-mining

To simulate an environment that fosters an easy workflow between DBAs and Engineers managing infrastructures, scripts etc

This repository contains scripts to set up a PostgreSQL database (booksdb) with predefined users, tables, functions, and views. Follow the instructions below to set up and use the database.

## 🛠️ Prerequisites

Before running the setup, ensure you have:
- Docker installed (if using Docker to run PostgreSQL).
- PostgreSQL installed locally (if running without Docker).
- Bash shell (for running scripts).

Running PostGres as a Container for Test Simulations
```sudo docker run --name postgres-test \
    -e POSTGRES_PASSWORD=mysecretpassword \
    -p 5432:5432 -d postgres
```

