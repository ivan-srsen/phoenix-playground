# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello, Hello.Repo,
  database: "hello_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

# Configures the endpoint
config :hello, HelloWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZBHKvIH/ul5Zf1J8Y3YrA0grXew7nNbJzaNHYCOrkPPI/KKZ630pCTzPYBwupZg/",
  render_errors: [view: HelloWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hello.PubSub,
  live_view: [signing_salt: "aS4i21zX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :hello, :phoenix_swagger,
  swagger_files: %{
    "priv/static/swagger.json" => [
      router: HelloWeb.Router,
      endpoint: HelloWeb.Endpoint
    ]
  }

config :phoenix_swagger, json_library: Jason

config :hello, ecto_repos: [Hello.Repo]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
