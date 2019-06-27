use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :secure_log, SecureLogWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :secure_log, SecureLog.Repo,
  username: "postgres",
  password: "postgres",
  database: "secure_log_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
