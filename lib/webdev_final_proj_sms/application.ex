defmodule WebdevFinalProjSms.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WebdevFinalProjSmsWeb.Telemetry,
      # Start the Ecto repository
      WebdevFinalProjSms.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: WebdevFinalProjSms.PubSub},
      # Start Finch
      {Finch, name: WebdevFinalProjSms.Finch},
      # Start the Endpoint (http/https)
      WebdevFinalProjSmsWeb.Endpoint
      # Start a worker by calling: WebdevFinalProjSms.Worker.start_link(arg)
      # {WebdevFinalProjSms.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebdevFinalProjSms.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WebdevFinalProjSmsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
