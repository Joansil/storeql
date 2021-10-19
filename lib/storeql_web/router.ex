defmodule StoreqlWeb.Router do
  use StoreqlWeb, :router

  #  pipeline :api do
  #    plug :accepts, ["json"]
  #  end
  #
  #  scope "/api", StoreqlWeb do
  #    pipe_through :api
  #  end

  scope "/" do
    forward "/graphql", Absinthe.Plug, schema: StoreqlGraphql.Schema, json_code: Jason

    if Mix.env() == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: StoreqlGraphql.Schema, json_code: Jason
    end
  end
end
