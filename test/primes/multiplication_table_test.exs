defmodule Primes.MultiplicationTableTest do
  use ExUnit.Case
  doctest Primes.MultiplicationTable

  alias Primes.MultiplicationTable
  import ExUnit.CaptureIO

  test "table from empty list" do
    assert MultiplicationTable.generate_table([]) == []
  end

  test "table from non-empty list" do
    assert MultiplicationTable.generate_table([2, 3, 5]) == [
      [nil, 2, 3, 5],
      [2, 4, 6, 10],
      [3, 6, 9, 15],
      [5, 10, 15, 25],
    ]
  end

  test "print empty table" do
    fun = fn -> MultiplicationTable.print_table([]) end
    assert capture_io(fun) == ""
  end

  test "print non-empty table" do
    fun = fn -> MultiplicationTable.print_table([2, 3, 5]) end
    assert capture_io(fun) == """
      |   | 2 | 3 | 5 |
      | 2 | 4 | 6 | 10 |
      | 3 | 6 | 9 | 15 |
      | 5 | 10 | 15 | 25 |
      """
  end
end
