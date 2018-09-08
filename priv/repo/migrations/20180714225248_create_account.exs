defmodule AccountService.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :purpose, :string
      add :billing_entity_id, references(:billing_entities, type: :uuid)

      timestamps()
    end

  end
end
