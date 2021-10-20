defmodule StoreqlGraphql.Resolvers.ChoiceResolver do
  def create_choice(_parent, params, _resolution) do
    # %{
    #  products: [
    #    %{product: "066", stores: ["little things", "atacarejo ataca"]},
    #    %{product: "066", stores: ["little things", "atacarejo ataca"]}
    #  ]
    # }
    {:ok, "Payload recieved. Creating the orders"}
  end
end
