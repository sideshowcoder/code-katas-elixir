Code.require_file "test_helper.exs", __DIR__

defmodule KarateChopFacts do
  use Amrita.Sweet
  import KarateChop, only: [ chop: 2 ]

  fact "don't find anything in an empty list" do
    chop(1, []) |> -1
  end

  fact "don't find if not present" do
    chop(1, [0]) |> -1
  end

  fact "find if first element" do
    chop(1, [1]) |> 0
  end

  fact "find if last element" do
    chop(3, [1,2,3]) |> 2
  end

  facts "sanity" do
    fact "don't find" do
      chop(0, [1,3,4,5]) |> -1
      chop(2, [1,3,4,5]) |> -1
      chop(5, [1,2,3,4]) |> -1
    end

    fact "find" do
      chop(1, [1,2,3,4]) |> 0
      chop(2, [1,2,3,4]) |> 1
      chop(3, [1,2,3,4]) |> 2
      chop(4, [1,2,3,4]) |> 3
    end
  end
end

