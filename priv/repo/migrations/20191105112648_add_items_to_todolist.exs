defmodule TodoApp.Repo.Migrations.AddItemsToTodolist do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :todolist_id, references(:todolists)
    end
  end
end
