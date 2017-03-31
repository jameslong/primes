defmodule Primes.SieveOfEratosthenes do
  @moduledoc """
  Lazy Sieve of Eratosthenes prime number generator.
  """

  @doc """
  Generates the first n primes using a lazy Sieve of Eratosthenes.

  An accumulator 'multiples' is used to store the next multiple of each prime
  found as well as the prime factors of that multiple. A number is prime if,
  when reached, it does not exist in 'multiples'.

  As optimisations we don't store even multiples of the primes, and only store
  from the square of the prime and above.

  For a more in depth explanation of this algorithm please see:
  http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
  """

  def first_n_primes(1), do: [2]
  def first_n_primes(2), do: [2, 3]
  def first_n_primes(n) do
    3
    |> Stream.iterate(&(&1 + 2))
    |> Stream.transform(%{}, fn (i, multiples) ->
      case Map.get(multiples, i) do
        nil -> # i is prime
          new_multiples = store_multiple(multiples, i * i, i)
          {[i], new_multiples}
        factors -> # i is not prime
          new_multiples =
            multiples
            |> Map.delete(i)
            |> store_next_multiples(i, factors)
          {[], new_multiples}
      end
    end)
    |> Enum.take(n - 1)
    |> List.insert_at(0, 2)
  end

  defp store_next_multiples(multiples, i, factors) do
    Enum.reduce(factors, multiples, fn (fact, acc) ->
     store_multiple(acc, i + (2 * fact), fact)
    end)
  end

  defp store_multiple(multiples, i, factor) do
    factors = Map.get(multiples, i, [])
    new_factors = [factor | factors]
    Map.put(multiples, i, new_factors)
  end
end
