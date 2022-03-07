defmodule Telegraph.Mixfile do
  use Mix.Project

  @source_url "https://github.com/etroynov/telegraph"
  @version "0.8.1"

  def project do
    [
      app: :telegraph,
      version: @version,
      elixir: "~> 1.8",
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      preferred_cli_env: [docs: :docs]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.3"},
      {:exvcr, "~> 0.13", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:earmark, "~> 1.4", only: :docs},
      {:inch_ex, "~> 2.0.0", only: :docs}
    ]
  end

  defp package do
    [
      description: "Modern Telegram Bot API framework based on Nadia project",
      maintainers: ["etroynov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/etroynov/telegraph"}
    ]
  end

  defp docs do
    [
      extras: [
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      formatters: ["html"]
    ]
  end
end
