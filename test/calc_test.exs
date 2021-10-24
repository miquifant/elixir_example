defmodule CalcTest do
  use ExUnit.Case
  alias Session.One.Calc

  test "run number returns number" do
    assert Calc.run(42) == 42
  end

  test "run prod returns the product of two numbers" do
    assert Calc.run({:prod, 14, 3}) == 42
  end

  test "run sum returns the sum of two numbers" do
    assert Calc.run({:sum, 2, 40}) == 42
  end

  test "run combining numbers, prods and sums returns the result of the operation" do
    assert Calc.run({:prod, {:sum, 1, {:sum, 10, 3}}, 3}) == 42
  end

  #test "example" do
  #  assert Calc.rle([1,1,1,2,2,2,3,1,1,2,3,4,5]) == [{1,3},{2,3},3,{1,2},2,3,4,5]
  #end
end
