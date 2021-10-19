defmodule Storeql.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Storeql.Repo,
      # Start the Telemetry supervisor
      StoreqlWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Storeql.PubSub},
      # Start the Endpoint (http/https)
      StoreqlWeb.Endpoint
      # Start a worker by calling: Storeql.Worker.start_link(arg)
      # {Storeql.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Storeql.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    StoreqlWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
