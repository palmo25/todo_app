defmodule TodoApp.Task.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string

    belongs_to :todolist, TodoApp.Task.Todolist
    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> assoc_constraint(:todolist)
  end
end
