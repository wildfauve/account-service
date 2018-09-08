defmodule AccountService.BillingEntities.BillingEntity do
  use Ecto.Schema
  import Ecto.Changeset
  alias AccountService.BillingEntities.BillingEntity


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "billing_entity" do
    field     :name,            :string
    field     :party_identity,  :string
    field     :party_predicate, :string
    has_many  :accounts,        EctoAssoc.Account

    timestamps()
  end

  @doc false
  def changeset(%BillingEntity{} = billing_entity, attrs) do
    billing_entity
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
