defmodule Session.One.Calc do
  # Simple calculations
  def run(n) when is_number(n), do: n
  def run({:sum, a, b}), do: run(a) + run(b)
  def run({:prod, a, b}), do: run(a) * run(b)

  # Run Length Encoding
  def rle([head | []]), do: [head]
  def rle([a, a | tail]), do: rle([{a, 2}] ++ tail)
  def rle([{a, n}, a | tail]), do: rle([{a, n + 1}] ++ tail)
  def rle([head | tail]), do: [head] ++ rle(tail)
end
