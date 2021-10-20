defmodule StoreqlGraphql.Schema do
  use Absinthe.Schema
  alias StoreqlGraphql.Resolvers

  import_types(StoreqlGraphql.Types)

  query do
  end

  mutation do
    @desc "Create client choice"
    field :create_choice, :string do
      arg(:products, list_of(non_null(:product_input)))
      resolve(&Resolvers.ChoiceResolver.create_choice/3)
    end
  end
end
