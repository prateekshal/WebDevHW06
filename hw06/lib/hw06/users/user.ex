defmodule Hw06.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :password_hash, :string
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :ismanager, :boolean
    field :managerid, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :password, :password_confirmation, :ismanager, :managerid])
    |> validate_confirmation(:password)
    |> validate_length(:password, min: 12) # too short
    |> hash_password()
    |> validate_required([:email, :name, :password_hash])
  end

  def hash_password(cset) do
    pw = get_change(cset, :password)
    if pw do
      change(cset, Argon2.add_hash(pw))
    else
      cset
    end
  end
  
end
