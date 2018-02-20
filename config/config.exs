# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :new_blog,
  ecto_repos: [NewBlog.Repo]

# Configures the endpoint
config :new_blog, NewBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/JL2K6UDKKhcwlkjCHhlmqfpmBhFaMIWHGL2UTdy/nRV4PEMkLdBsmfiuJ/G5EJh",
  render_errors: [view: NewBlogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: NewBlog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
