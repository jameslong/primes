defmodule Primes.MultiplicationTable do
  @moduledoc """
  Generates and prints multiplication tables for lists.
  """

  def generate_and_print_table(list) do
    list
    |> generate_table()
    |> print_table()
  end

  def generate_table([]), do: []
  def generate_table(list) do
    first_row = [nil | list]
    rest = Enum.map(list, fn x ->
      [x | Enum.map(list, &(&1 * x))]
    end)
    [first_row | rest]
  end

  def print_table([]), do: ""
  def print_table(list) do
    list
    |> Enum.map(&print_row/1)
    |> Enum.join("\n")
    |> IO.puts()
  end

  def print_row(row) do
    inner =
      row
      |> Enum.map(&print_cell/1)
      |> Enum.join(" | ")
    "| #{inner} |"
  end

  def print_cell(nil), do: " "
  def print_cell(n), do: "#{n}"
end
