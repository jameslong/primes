defmodule Primes.BruteForce do
  @moduledoc """
  Lazy brute force prime number generator.
  """

  alias Primes

  def first_n_primes(1), do: [2]
  def first_n_primes(2), do: [2, 3]
  def first_n_primes(n) do
    3
    |> Stream.iterate(&(&1 + 2))
    |> Stream.filter(&Primes.prime?/1)
    |> Stream.take(n - 1)
    |> Enum.to_list()
    |> (fn list -> [2 | list] end).()
  end
end
