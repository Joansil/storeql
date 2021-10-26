defmodule StoreqlGraphql.Resolvers.ChoiceResolver do
  alias Storeql.Choices

  def create_choice(_parent, params, _resolution) do
    Task.async(fn -> Choices.create_choice(params) end)
    {:ok, "Payload recieved. Creating the orders"}
  end
end
