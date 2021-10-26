defmodule Storeql.Choices do
  alias Storeql.Choices.Core.SendProductsToKafka

  def create_choice(products) do
    # %{
    #  products: [
    #    %{product: "066", stores: ["little things", "atacarejo ataca"]},
    #    %{product: "066", stores: ["little things", "atacarejo ataca"]}
    #  ]
    # }
    SendProductsToKafka.execute(products)
  end
end
