defmodule TodoApp.Repo.Migrations.CreateTodolists do
  use Ecto.Migration

  def change do
    create table(:todolists) do
      add :description, :string

      timestamps()
    end
  end
end
