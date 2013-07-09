defmodule MyEnum do
  def each([], _), do: []
  def each([head|tail], fun) do
    fun.(head)
    each(tail, fun)
    [head|tail]
  end

  defp _all?([], _), do: true
  defp _all?([head|tail], fun) do
    cond do
      fun.(head) -> all?(tail, fun)
      true -> false
  end
end
  def all?(collection, fun // fn (x) -> x end), do: _all?(collection, fun)

  defp _filter([head|tail], result, fun) do
    cond do
      fun.(head) -> _filter(tail, [head|result], fun)
      true -> _filter(tail, result, fun)
  end
  end
  defp _filter([], result, _), do: Enum.reverse(result)
  def filter(collection, fun), do: _filter(collection, [], fun)

  defp _split([head|tail], part, count) do
    cond do
      length(part) < count -> _split(tail, [head|part], count)
      true -> { Enum.reverse(part), [head|tail] }
  end
  end
  defp _split([], part, _), do: { part, [] }
  def split(collection, count), do: _split(collection, [], count)

  def take(collection, count) do
    { part, _ } = split(collection, count)
    part
  end

  defp _span(from, to, result) do
    cond do
      from <= to -> _span(from + 1, to, [from|result])
      true -> Enum.reverse(result)
  end
  end
  def span(from, to), do: _span(from, to, [])

  defp _primes([head|tail], result) do
  if all?(span(2, head - 1), fn (x) -> rem(head, x) != 0 end) do
      _primes(tail, [head|result])
    else
      _primes(tail, result)
    end
  end

  defp _primes([], result), do: Enum.reverse(result)

  def primes(n), do: _primes(span(2, n), [])
  end

IO.inspect MyEnum.primes(99)

IO.inspect MyEnum.span(1, 9)

IO.inspect MyEnum.take([1, 2, 3, 4, 5], 2)
IO.inspect MyEnum.split([1, 2, 3, 4, 5], 2)

IO.inspect MyEnum.filter([1, 2, 3], &1 > 1)
IO.inspect MyEnum.each([1,2,3], fn (x) -> IO.puts x end)

IO.puts MyEnum.all?([1, 2, 3])
IO.puts MyEnum.all?([1, 2, 3], &1 > 3)
IO.puts MyEnum.all?([1, nil, 3])
