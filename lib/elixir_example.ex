defmodule ElixirExample do
  @moduledoc """
  Documentation for `ElixirExample`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirExample.hello()
      :world

  """
  def hello do
    :world
  end

  def main do
    IO.puts(hello())
  end
end
