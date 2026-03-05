defmodule Demo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: Demo.Finch},
      {Demo.Broadway,
       concurrency: System.schedulers(),
       producer: [
         module:
           {Xinesis.Producer,
            access_key_id: "test",
            secret_access_key: "test",
            stream_arn: Demo.stream_arn(),
            url: "http://localhost:4566",
            worker_name: "xinesis-1",
            lease:
              {Xinesis.Lease.ExAwsDynamo,
               table: Demo.dynamo_table(),
               config_overrides: [scheme: "http://", host: "localhost", port: 4566]}}
       ]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Demo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
