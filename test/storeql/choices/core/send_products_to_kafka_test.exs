defmodule Storeql.Choices.Core.SendProductsToKafkaTest do
  use Storeql.DataCase

  alias Storeql.Choices.Core.SendProductsToKafka

  import Mock

  test "send products to kafka" do
    products = %{
      products: [
        %{product: "066", stores: ["little things", "atacarejo ataca"]},
        %{product: "066", stores: ["little things", "atacarejo ataca"]}
      ]
    }

    with_mock(
      :brod,
      start_client: fn _hosts, _client_id -> :ok end,
      start_producer: fn _client_id, _topic, _opts -> :ok end,
      produce: fn _client_id, _topic, _partition, _key, _payload ->
        {:ok, {:brod_call_ref, 123, 123, "abc"}}
      end
    ) do
      assert SendProductsToKafka.execute(products) == {:ok, {:brod_call_ref, 123, 123, "abc"}}
    end
  end
end
