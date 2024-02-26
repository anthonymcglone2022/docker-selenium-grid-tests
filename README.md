# What is the docker-selenium-grid-tests repository?

- A test automation suite with Selenium tests, which are run in parallel against the [postcodes](https://github.com/anthonymcglone2022/postcodes) application
- Technology built with Maven, TestNG, Selenium Webdriver/ Grid and Docker

# Steps to run the Grid

- Install [Docker](https://docs.docker.com/)
- Clone the [dockerized_selenium_grid](https://github.com/anthonymcglone2022/dockerized_selenium_grid) repo
- Navigate to the top level directory. Run `docker-compose up -d` to bring up the Selenium Grid
- Copy the name of the grid's network for later use (e.g. `dockerized_selenium_grid_test-network`)


# Steps to run the `postcodes` application

- Clone the [postcodes](https://github.com/anthonymcglone2022/postcodes) project
- Navigate to the project's top level directory. Run `docker build -t java-webserver .`
- Replace `<grid_test-network>` with the Selenium Grid's network (e.g. `dockerized_selenium_grid_test-network`):
- `docker run --name java-server --network <grid_test-network> -d -p 9191:9191 java-webserver`

# Set environment variables so the test cases can find the Selenium Grid

- Clone this repo (`docker-selenium-grid-tests`)
- Run `dockerenvvars.bat` (or the .sh script if you're on Linux/Mac)

# Run the test cases

- If on Windows, build the image `docker build --build-arg APP_IP=%APP_IP% --build-arg GRID_URL=%GRID_URL% -t maven-tester .`
- If on Linux/Mac, build the image `docker build --build-arg APP_IP=$env:APP_IP --build-arg GRID_URL=$env:GRID_URL -t maven-tester .`
- Run the test cases in parallel `docker run --network <grid_test-network> -d maven-tester`
- View the run in real-time with `docker logs -f <maven-tester_container_id>`


