defmodule Parallex do
  @moduledoc """
  Concurrent versions of some common `Enum` functions.
  These might be useful if the applied function is calculation heavy.
  """

  @doc """
  Perform an `Enum.filter/2` function using concurrent processes.

  ## Examples

      iex> Parallex.pfilter([1, 2, 3, 4], fn(x) -> x < 4 end)
      [1, 2, 3]

  """
  def pfilter(collection, func) do
    results = pmap(collection, func)
    n = Enum.count(collection) - 1

    Enum.reduce(0..n, [],
      fn i, acc ->
        cond do
          Enum.at(results, i) -> [Enum.at(collection, i) | acc]
          true -> acc
        end
      end)
    |> Enum.reverse
  end

  @doc """
  Perform an `Enum.map/2` function using concurrent processes.

  ## Examples

      iex> Parallex.pmap([1, 2, 3, 4], fn(x) -> x * x end)
      [1, 4, 9, 16]

  """
  def pmap(collection, func) do
    collection
    |> Enum.map(&(Task.async(fn -> func.(&1) end)))
    |> Enum.map(&Task.await/1)
  end
end
