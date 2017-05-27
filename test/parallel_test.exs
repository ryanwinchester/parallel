defmodule ParallexTest do
  use ExUnit.Case
  doctest Parallex

  test "Maps a list of numbers" do
    list = [-1, 0, 1, 2, 2.0, 10]
    sq = fn n -> n*n end
    result = [1, 0, 1, 4, 4.0, 100]
    assert Parallex.pmap(list, sq) === result
  end

  test "Filters a list of numbers" do
    list = [-1, 0, 1, 2, 3.0, 4, 10]
    lt = fn n -> n < 4 end
    result = [-1, 0, 1, 2, 3.0]
    assert Parallex.pfilter(list, lt) === result
  end
end
