# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :account_service,
  ecto_repos: [AccountService.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :account_service, AccountServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cfgJw2jPjCV1u7uBSMNM8eiVfjnb50SSkNAvKxyI6jG8GEf82cNIgjCnNGRcU2/M",
  render_errors: [view: AccountServiceWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AccountService.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
