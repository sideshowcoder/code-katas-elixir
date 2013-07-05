defmodule MyList do
  defp _mapsum([], _, total), do: total
  defp _mapsum([head|tail], fun, total), do: _mapsum(tail, fun, fun.(head) + total)
  def mapsum(list, fun), do: _mapsum(list, fun, 0)


  defp _max([head|tail], current) do
    cond do
      head > current -> _max(tail, head)
      true -> _max(tail, current)
    end
  end

  defp _max([], current), do: current

  def max(list) do
    case list do
      [head|tail] -> _max(tail, head)
      [] -> nil
    end
  end

  defp map([], _), do: []
  defp map([head|tail], fun), do: [fun.(head)|map(tail, fun)]

  defp cipher(letter, offset) do
    char = letter + offset
    max_char = Enum.first('z')
    min_char = Enum.first('a')
    cond do
      char > max_char -> rem(char, max_char) + min_char - 1
      true -> char
    end
  end

  def caesar(text, offset), do: map(text, cipher(&1, offset))

  defp _flatten([[]|tail], result), do: _flatten(tail, result)
  defp _flatten([head|tail], result) when is_list(head) do
    case head do
      [car|[]] -> _flatten([car|[tail]], result)
      [car|cdr] -> _flatten([car|[cdr|tail]], result)
    end
  end
  defp _flatten([head|tail], result), do: _flatten(tail, [head|result])
  defp _flatten([], result), do: Enum.reverse(result)

  def flatten(list), do: _flatten(list, [])

end

IO.puts "#{inspect MyList.flatten([1 ,[2 , 3, [4]], 5, [[[6]]]])}"


IO.puts MyList.mapsum([], &1 + &1)
IO.puts MyList.mapsum([1,2,3], &1 * &1)
IO.puts MyList.max([1,2,3])
IO.puts MyList.max([3,2,1])
IO.puts MyList.max([1,3,2])
IO.puts MyList.max([1,2,2])
IO.puts MyList.max([])

IO.puts MyList.caesar('', 1)
IO.puts MyList.caesar('a', 1)
IO.puts MyList.caesar('ryvkve', 13)

