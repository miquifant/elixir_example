defmodule Session.One.Prueba do
  def factorial(0), do: 1
  def factorial(n), do: n * factorial(n - 1)

  def fibo(0), do: 1
  def fibo(1), do: 1
  def fibo(n), do: fibo(n - 1) + fibo(n - 2)

  def concat({a, b}), do: "#{a}#{b}"
  # resto de casos
  def concat(_), do: :error
end
