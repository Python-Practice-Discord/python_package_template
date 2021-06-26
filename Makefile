include local.env
export
env_file_name="local.env"
UID="$(shell id -u)"

check:
	isort tests/ src/
	black tests/ src/
	flake8 tests/ src/
	mypy tests/ src/

### Commands to start docker containers and interact with them
# Starts a shell in the Dockerfile. This is used to run migrations or other commands in the same env as the code
interactive: _base
	docker-compose --env-file $(env_file_name) -f docker-compose.yaml -f docker-compose.interactive.yaml run --rm replaceme

test: _base
	docker-compose --env-file $(env_file_name) -f docker-compose.yaml -f docker-compose.test.yaml run --rm replaceme

# Just starts the postgres DB.
db_only: _base
	docker-compose --env-file $(env_file_name) -f docker-compose.yaml up --abort-on-container-exit --remove-orphans postgres


### Commands to alter postgres data

# Runs the db migrations and inserts test data
initialize_pg: _base _remove_all_pg_data run_migrations
	$(MAKE) _down

run_migrations: _down
	docker-compose --env-file $(env_file_name) -f docker-compose.yaml up -d postgres
	sleep 10
	docker-compose --env-file $(env_file_name) -f docker-compose.yaml run --rm replaceme alembic upgrade head
	$(MAKE) _down


### Commands to work with docker

kill_all_containers:
	docker ps -q | xargs -r docker kill

remove_all_docker_data: kill_all_containers
	docker system prune -a -f --volumes


### Commands starting with _ are not to be used in the CLI, but used in other make commands

_build:
	docker-compose --env-file $(env_file_name) build --build-arg USER_UID=$(UID) -q

_down:
	docker-compose --env-file $(env_file_name) down -v --remove-orphans

_base: _down _build

_remove_all_pg_data:
	mkdir -p data/postgres
	sudo rm -r data/postgres

_insert_pg_data: _down
	docker-compose --env-file $(env_file_name) -f docker-compose.yaml  -f docker-compose.pg.yaml up -d postgres
	sleep 5
	docker-compose exec postgres psql $(PGDATABASE) $(PGUSER) -f /docker-entrypoint-initdb.d/pg_inserts.sql
