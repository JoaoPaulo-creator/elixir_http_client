defmodule ElixirHttp.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_http,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :dev,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"},
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.17"},
      {:json, ">= 1.0.0"},
    ]
  end
end
