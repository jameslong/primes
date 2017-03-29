defmodule PrimesTest do
  use ExUnit.Case
  doctest Primes

  @first_10_primes [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  @first_10_nonprimes [1, 4, 6, 8, 9, 10, 12, 14, 15, 16]

  test "primality of 1" do
    refute Primes.prime?(1)
  end

  test "primality of 2" do
    assert Primes.prime?(2)
  end

  test "primality of first 10 primes" do
    assert Enum.all?(@first_10_primes, &Primes.prime?/1)
  end

  test "primality of first 10 non-primes" do
    refute Enum.any?(@first_10_nonprimes, &Primes.prime?/1)
  end

  test "first prime" do
    assert Primes.first_n_primes(1) == [2]
  end

  test "first 10 primes" do
    assert Primes.first_n_primes(10) == @first_10_primes
  end

  test "sanity check first 1000 primes" do
    result = Primes.first_n_primes(1000)
    assert Enum.all?([
      length(result) == 1000,
      Enum.all?(result, &Primes.prime?/1),
      List.last(result) == 7919
    ])
  end
end
