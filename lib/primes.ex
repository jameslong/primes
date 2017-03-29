defmodule Primes do
  @moduledoc """
  Functions related to prime number generation.
  """

  def prime?(1) do false end
  def prime?(2) do true end
  def prime?(x) do
    upper_bound = round(:math.sqrt(x))
    2..upper_bound
    |> Enum.all?(&(rem(x, &1) != 0))
  end

  def first_n_primes(1), do: [2]
  def first_n_primes(2), do: [2, 3]
  def first_n_primes(n) do
    3
    |> Stream.iterate(&(&1 + 2))
    |> Stream.filter(&prime?/1)
    |> Stream.take(n - 1)
    |> Enum.to_list()
    |> (fn list -> [2 | list] end).()
  end
end
