## version

- Ruby: 2.6.3
- Rails: 6.1.3

## Development environment

#### Development environment creation procedure (required only for the first time)

- Premise
    - Docker needs to be installed
    - git clone

- Create a development environment
    ```
    $ docker-compose build          # builds docker images
    ```
- Note: You will need to rebuild the image if there are any changes in the Gemfile
    ```
    $ docker-compose run --rm web bundle install
    $ docker-compose build
    ```

- start local server
    ```
    $ docker-compose up              
    $ docker-compose run --rm web rails db:migrate  #open new terminal 
    ```
  now you can access local server with this url
  http://localhost:3000/
