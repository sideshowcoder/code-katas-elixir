defmodule MyEnum do
  defp _all?([], _), do: true
  defp _all?([head|tail], fun) do
    cond do
      fun.(head) -> all?(tail, fun)
      true -> false
    end
  end
  def all?(collection, fun // fn (x) -> x end), do: _all?(collection, fun)
end

IO.puts MyEnum.all?([1, 2, 3], fn (x) -> x end)
IO.puts MyEnum.all?([1, 2, 3], fn (x) -> x > 3 end)
IO.puts MyEnum.all?([1, nil, 3], fn (x) -> x end)
