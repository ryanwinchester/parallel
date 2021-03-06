defmodule Parallex.Mixfile do
  use Mix.Project

  def project do
    [app: :parallex,
     version: "0.1.2",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package(),
     source_url: "https://github.com/ryanwinchester/parallex",
     name: "Parallex"]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    Some concurrent versions of common Enum functions.

    Might be useful if the applied functions are calculation heavy.
    """
  end

  defp package do
    [name: :parallex,
     maintainers: ["Ryan Winchester"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/ryanwinchester/parallex"}]
  end
end
