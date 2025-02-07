defmodule PolymorphicEmbed.MixProject do
  use Mix.Project

  @version "3.0.0"

  def project do
    [
      app: :polymorphic_embed,
      elixir: "~> 1.9",
      deps: deps(),
      aliases: aliases(),
      elixirc_paths: elixirc_paths(Mix.env()),

      # Hex
      version: @version,
      package: package(),
      description: "Polymorphic embeds in Ecto",

      # ExDoc
      name: "Polymorphic Embed",
      source_url: "https://github.com/mathieuprog/polymorphic_embed",
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ecto, "~> 3.8"},
      {:jason, "~> 1.3"},
      {:phoenix_html, "~> 2.14 or ~> 3.2", optional: true},
      {:ex_doc, "~> 0.28", only: :dev},
      {:ecto_sql, "~> 3.8", only: :test},
      {:postgrex, "~> 0.16", only: :test},
      {:query_builder, "~> 1.0", only: :test},
      {:phoenix_ecto, "~> 4.4", only: :test},
      {:phoenix_live_view, "~> 0.17", only: :test},
      {:floki, "~> 0.33", only: :test}
    ]
  end

  defp aliases do
    [
      test: [
        "ecto.create --quiet",
        "ecto.rollback --all",
        "ecto.migrate",
        "test"
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["Apache 2.0"],
      maintainers: ["Mathieu Decaffmeyer"],
      links: %{
        "GitHub" => "https://github.com/mathieuprog/polymorphic_embed",
        "Sponsor" => "https://github.com/sponsors/mathieuprog"
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "v#{@version}"
    ]
  end
end
