defmodule Primes.SieveOfEratosthenesTest do
  use ExUnit.Case
  doctest Primes.SieveOfEratosthenes

  alias Primes.SieveOfEratosthenes

  @first_10_primes [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

  test "first prime" do
    assert SieveOfEratosthenes.first_n_primes(1) == [2]
  end

  test "first two primes" do
    assert SieveOfEratosthenes.first_n_primes(2) == [2, 3]
  end

  test "first 10 primes" do
    assert SieveOfEratosthenes.first_n_primes(10) == @first_10_primes
  end

  test "sanity check first 1000 primes" do
    result = SieveOfEratosthenes.first_n_primes(1000)
    assert Enum.all?([
      length(result) == 1000,
      Enum.all?(result, &Primes.prime?/1),
      List.last(result) == 7919
    ])
  end
end
