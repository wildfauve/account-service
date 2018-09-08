defmodule AccountService.Repo.Migrations.CreateBillingEntity do
  use Ecto.Migration

  def change do
    create table(:billing_entities, primary_key: false) do
      add :id,              :binary_id, primary_key: true
      add :name,            :string
      add :party_identity,  :string
      add :party_predicate, :string

      timestamps()
    end

  end
end
