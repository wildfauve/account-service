defmodule AccountService.BillingEntities.Account do
  use Ecto.Schema
  import Ecto.Changeset
  alias AccountService.BillingEntities.Account


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "account" do
    field :name, :string
    field :purpose, :string
    # belongs_to :billing_entity, EctoAssoc.BillingEntity

    timestamps()
  end

  @doc false
  def changeset(%Account{} = account, attrs) do
    account
    |> cast(attrs, [:name, :purpose])
    |> validate_required([:name, :purpose])
  end
end
