# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :secure_log,
  ecto_repos: [SecureLog.Repo]

# Configures the endpoint
config :secure_log, SecureLogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NaQI9OIaFcjFXgiHU3Nh3NJRBP65JifsZfqZK3t1+i4FyVPDAPXLBRLdvCbWII/b",
  render_errors: [view: SecureLogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SecureLog.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger,
  backends: [{ProxyLogger, :proxy}],
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
