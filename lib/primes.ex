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

  def first_n_primes(_n), do: []
end
