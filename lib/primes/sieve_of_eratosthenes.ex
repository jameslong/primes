defmodule Primes.SieveOfEratosthenes do
  @moduledoc """
  Lazy Sieve of EratosthenesBrute force prime number generator.
  """

  alias Primes

  def first_n_primes(1), do: [2]
  def first_n_primes(2), do: [2, 3]
  def first_n_primes(n) do
    3
    |> Stream.iterate(&(&1 + 2))
    |> Stream.transform(%{}, fn (i, acc) ->
      case Map.get(acc, i) do
        nil -> # prime
          square = i * i
          updated_acc = add_to_key_value(acc, square, i)
          {[i], updated_acc}
        factors -> # not prime
          removed = Map.delete(acc, i)
          updated_acc = Enum.reduce(factors, removed, fn (fact, acc) ->
            add_to_key_value(acc, i + (2 * fact), fact)
          end)
          {[], updated_acc}
      end
    end)
    |> Stream.take(n - 1)
    |> Enum.to_list()
    |> (fn list -> [2 | list] end).()
  end

  defp add_to_key_value(map, key, value) do
    values = Map.get(map, key, [])
    new_values = [value | values]
    Map.put(map, key, new_values)
  end
end
