defmodule SecureLog.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :birthdate, :date
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :birthdate])
    |> validate_required([:first_name, :last_name, :birthdate])
  end
end
