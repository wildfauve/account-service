defmodule AccountService.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :event_id, :string
      add :event_type, :string
      add :state, :string
      add :event, :map
      add :audit, :map
      add :state_audit, {:array, :map}, default: []

      timestamps()
    end

  end
end
