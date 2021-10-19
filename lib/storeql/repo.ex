defmodule Storeql.Repo do
  use Ecto.Repo,
    otp_app: :storeql,
    adapter: Ecto.Adapters.Postgres
end
