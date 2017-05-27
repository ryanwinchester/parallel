defmodule ParallexTest do
  use ExUnit.Case
  doctest Parallex

  test "Maps a list of numbers" do
    list = [-1, 0, 1, 2, 2.0, 10]
    sq = fn(n) -> n * n end
    assert Parallex.pmap(list, sq) === [1, 0, 1, 4, 4.0, 100]
  end

  test "Filters a list of numbers" do
    list = [-1, 0, 1, 2, 3.0, 4, 10]
    lt = fn(n) -> n < 4 end
    assert Parallex.pfilter(list, lt) === [-1, 0, 1, 2, 3.0]
  end
end
