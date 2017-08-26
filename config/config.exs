# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :keyserver,
  ecto_repos: [Keyserver.Repo]

# Configures the endpoint
config :keyserver, KeyserverWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cYLf01s9s5QOrmotehXOTkcjhx43rd3viYhxgYdhypd+WbQu76CFFp5CFsrHgies",
  render_errors: [view: KeyserverWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Keyserver.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
