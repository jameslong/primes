defmodule PrimesTest do
  use ExUnit.Case
  doctest Primes

  test "first prime" do
    assert Primes.first_n_primes(1) == [2]
  end

  test "first 10 primes" do
    assert Primes.first_n_primes(10) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end
end
