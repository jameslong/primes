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

  test "first prime - brute force" do
    assert Primes.first_n_primes_brute_force(1) == [2]
  end

  test "first two primes - brute force" do
    assert Primes.first_n_primes_brute_force(2) == [2, 3]
  end

  test "first 10 primes - brute force" do
    assert Primes.first_n_primes_brute_force(10) == @first_10_primes
  end

  test "sanity check first 1000 primes - brute force" do
    result = Primes.first_n_primes_brute_force(1000)
    assert Enum.all?([
      length(result) == 1000,
      Enum.all?(result, &Primes.prime?/1),
      List.last(result) == 7919
    ])
  end

  test "first prime - sieve" do
    assert Primes.first_n_primes_sieve(1) == [2]
  end

  test "first two primes - sieve" do
    assert Primes.first_n_primes_sieve(2) == [2, 3]
  end

  test "first 10 primes - sieve" do
    assert Primes.first_n_primes_sieve(10) == @first_10_primes
  end

  test "sanity check first 1000 primes - sieve" do
    result = Primes.first_n_primes_sieve(1000)
    assert Enum.all?([
      length(result) == 1000,
      Enum.all?(result, &Primes.prime?/1),
      List.last(result) == 7919
    ])
  end
end
