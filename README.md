## Setup:

```
cp config/dev.secret.example.exs config/dev.secret.exs
mix ecto.create
mix ecto.migrate

```
## Adding a user

```
  mix add_user <twitter-user-name>
  Example:
  mix add_user twitterdev
```

## Usage in Production:

```
TWITTER_FETCH_INTERVAL=<fetch-interval-in-minutes> CONSUMER_API_KEY=<consumer-api-key> <CONSUMER_API_SECRET=consumer-api-secret> <ACCESS_TOKEN=access-token> ACCESS_TOKEN_SECRET=<access-token-secret> DATABASE_URL=<postgresql-database-url> MIX_ENV=prod iex -S mix
```


