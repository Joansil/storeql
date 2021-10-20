defmodule Storeql.SchemaTest do
  use StoreqlWeb.ConnCase

  test "mutation: create choice", %{conn: conn} do
    conn =
      post(conn, "graphql", %{
        "query" => """
          mutation
          {
            createChoice(products:
            [
              {
                product: "066",
                stores: ["little things", "atacarejo ataca"]
              },

              {
                product: "066",
                stores: ["little things", "atacarejo ataca"]
              },
            ])
          }
        """,
        "variables" => %{}
      })

    assert json_response(conn, 200) == %{
             "data" => %{
               "createChoice" => "Payload recieved. Creating the orders"
             }
           }
  end
end
