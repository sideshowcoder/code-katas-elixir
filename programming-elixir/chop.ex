defmodule Chop do

  def guess n, a..b do
    m = div(a + b, 2)
    IO.puts "Is it #{m}"
    cond do
      m == n -> n
      n < m -> guess n, a..m
      n > m -> guess n, m..b
    end
  end

end
