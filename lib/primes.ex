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

  def first_n_primes_brute_force(1), do: [2]
  def first_n_primes_brute_force(2), do: [2, 3]
  def first_n_primes_brute_force(n) do
    3
    |> Stream.iterate(&(&1 + 2))
    |> Stream.filter(&prime?/1)
    |> Stream.take(n - 1)
    |> Enum.to_list()
    |> (fn list -> [2 | list] end).()
  end

  def first_n_primes_sieve(1), do: [2]
  def first_n_primes_sieve(2), do: [2, 3]
  def first_n_primes_sieve(n) do
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

  def compare_solutions(n \\ 100_000) do
    to_test = [
      {"Brute force", &first_n_primes_brute_force/1},
      {"Sieve", &first_n_primes_sieve/1},
    ]

    IO.puts "N = #{n}"
    Enum.each(to_test, fn {name, function} ->
      duration = time(fn -> function.(n) end)
      IO.inspect "#{name}: #{duration}s"
    end)
    IO.puts "Done"
  end

  def time(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end
