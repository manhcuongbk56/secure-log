defmodule SecureLog.Repo do
  use Ecto.Repo,
    otp_app: :secure_log,
    adapter: Ecto.Adapters.Postgres
end
