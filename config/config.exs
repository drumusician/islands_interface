# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :islands_interface, IslandsInterface.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jY3fTrq+SlbOMRfMC1c51gk0O8fHDc2jj8PBpWvbY6o+lJ8kb0K5EN3X7aw00h9U",
  render_errors: [view: IslandsInterface.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: IslandsInterface.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
