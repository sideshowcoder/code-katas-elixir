defmodule Sum do
  def sum(0), do: 0
  def sum(n) when n > 0, do: n + sum(n - 1)
end

