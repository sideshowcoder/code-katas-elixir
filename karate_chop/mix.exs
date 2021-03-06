defmodule KarateChop.Mixfile do
  use Mix.Project

  def project do
    [ app: :karate_chop,
      version: "0.0.1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    []
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      {:amrita, "0.1.3", github: "josephwilk/amrita"}
    ]
  end
end
