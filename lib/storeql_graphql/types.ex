defmodule StoreqlGraphql.Types do
  use Absinthe.Schema.Notation
  alias StoreqlGraphql.Types

  import_types(Types.ProductType)
end
