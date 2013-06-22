defmodule KarateChop do
  import Enum, only: [ at: 2, split: 2, empty?: 1 ]

  defp chop key, list, offset do
    pivot = div(length(list), 2)
    element = at(list, pivot)
    { lower, upper } = split(list, pivot)
    cond do
      element == key ->
        pivot + offset
      length(list) == 1 ->
        -1
      element > key ->
        chop key, lower, offset
      element < key ->
        chop key, upper, offset + pivot
    end
  end

  def chop(_, []), do: -1

  def chop key, list do
    chop key, list, 0
  end

end
