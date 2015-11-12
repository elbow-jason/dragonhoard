use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dragon_hoard, DragonHoard.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :dragon_hoard, DragonHoard.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "dragon_hoard",
  password: "password",
  database: "dragon_hoard_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
