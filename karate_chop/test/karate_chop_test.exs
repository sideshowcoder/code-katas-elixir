Code.require_file "test_helper.exs", __DIR__

defmodule KarateChopTest do
  use ExUnit.Case
  import KarateChop, only: [ chop: 2 ]

  test "don't find anything in the empty list" do
    assert -1 == chop(3, [])
  end

  test "don't find if not present" do
    assert -1 == chop(3, [1])
  end

  test "do find as first element" do
    assert 0 == chop(3, [3])
  end

  test "do find as last element" do
    assert 2 == chop(3, [1,2,3])
  end

  test "sanity" do
    assert -1 == chop(0, [1,3,4,5])
    assert -1 == chop(2, [1,3,4,5])
    assert -1 == chop(5, [1,2,3,4])
    assert 0 == chop(1, [1,2,3,4])
    assert 1 == chop(2, [1,2,3,4])
    assert 2 == chop(3, [1,2,3,4])
    assert 3 == chop(4, [1,2,3,4])
  end

end
