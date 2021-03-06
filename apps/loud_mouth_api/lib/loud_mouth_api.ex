defmodule LoudMouthAPI do
  @moduledoc """
  An HTTP/JSON API interface for the LoudMouth domain.
  """
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(LoudMouthAPI.Endpoint, []),
      # Start your own worker by calling: LoudMouthAPI.Worker.start_link(arg1, arg2, arg3)
      # worker(LoudMouthAPI.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LoudMouthAPI.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LoudMouthAPI.Endpoint.config_change(changed, removed)
    :ok
  end
end
