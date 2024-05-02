function update_disney_fake
    docker-compose up -d
    docker-compose exec --env DISNEY_SECRET=vu~IbgfNtdoTfGSwIo-Y7oNuOlyt6Dup disney-stub-api poetry run python -m disney_api_fake.client
    docker-compose down
end
