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

  def prime_multiplication_table(n) do
    n
    |> Primes.SieveOfEratosthenes.first_n_primes()
    |> Primes.MultiplicationTable.generate_and_print_table()
  end

  def compare_solutions(n \\ 100_000) do
    to_test = [
      {"Brute force", &Primes.BruteForce.first_n_primes/1},
      {"Sieve", &Primes.SieveOfEratosthenes.first_n_primes/1},
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
