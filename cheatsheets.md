BRAVO CHEATSHEET

BUILD THE DOCKER IMAGE 
docker buildx bake --load

START EVERYTHING
docker compose -f ./docker-compose.base.yml -f ./docker-compose.override.yml up

STOP EVERYTHING
docker compose -f ./docker-compose.base.yml -f ./docker-compose.override.yml down -v

** IN REMIX 
0. CONNECT
remixd -s Projects/paris/rollups-examples/bravo/

1. DEPLOLY THE CONTRACT EXAMPLE
2. CHECK THE VALUE of the “VALUE” variable
3. Execute the “Execute” function

CHECK THE VOUCHER CREATION
cd frontend-console
yarn start voucher list

EXECUTE THE VOUCHER
cd frontend-console
yarn start voucher execute --id 1

** IN REMIX 
CHECK FOR CHANGES IN THE VALUE VARIABLE
