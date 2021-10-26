defmodule Storeql.ChoicesTest do
  use Storeql.DataCase

  alias Storeql.Choices
  alias Storeql.Choices.Core.SendProductsToKafka

  import Mock

  test "create choices" do
    products = %{
      products: [
        %{product: "066", stores: ["little things", "atacarejo ataca"]},
        %{product: "066", stores: ["little things", "atacarejo ataca"]}
      ]
    }

    with_mock(
      SendProductsToKafka,
      execute: fn _products ->
        {:ok, {:brod_call_ref, 123, 123, "abc"}}
      end
    ) do
      assert Choices.create_choice(products) == {:ok, {:brod_call_ref, 123, 123, "abc"}}
    end
  end
end
