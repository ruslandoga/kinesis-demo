defmodule Demo.MixProject do
  use Mix.Project

  def project do
    [
      app: :demo,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Demo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:xinesis, github: "knocklabs/xinesis"},
      {:kcl_ex, github: "knocklabs/kcl_ex"},
      {:ex_aws_dynamo, "~> 4.2.2", override: true},
      # {:ex_aws_dynamo,
      #  github: "ex-aws/ex_aws_dynamo",
      #  ref: "a5cb6b4f93b084f15d01c2e2f2bc1a456547a277",
      #  override: true},
      {:finch, "~> 0.21.0"}
    ]
  end
end
