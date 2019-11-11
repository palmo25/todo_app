defmodule TodoApp.Task.Todolist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todolists" do
    field :description, :string

    has_many :items, TodoApp.Task.Item
    timestamps()
  end

  @doc false
  def changeset(todolist, attrs) do
    todolist
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
