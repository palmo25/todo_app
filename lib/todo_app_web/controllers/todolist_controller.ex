defmodule TodoAppWeb.TodolistController do
  use TodoAppWeb, :controller

  alias TodoApp.Task
  alias TodoApp.Task.Todolist

  def index(conn, _params) do
    todolists = Task.list_todolists()
    todolist = Task.change_todolist(%Todolist{})
    render(conn, "index.html", todolists: todolists, todolist: todolist)
  end

  def create(conn, %{"todolist" => todolist_params}) do
    # todolist = Task.change_todolist(%Todolist{})
    # todolists = Task.list_todolists()
    case Task.create_todolist(todolist_params) do
      {:ok, todolist} ->
        conn
        |> put_flash(:info, "Todolist created successfully.")
        # |> redirect(to: Routes.todolist_path(conn, :show, todolist))
        |> redirect(to: Routes.todolist_path(conn, :index))

      # |> render("index.html")

      # {:error, %Ecto.Changeset{} = todolist}
      {:error, todolist} ->
        conn
        |> put_flash(:info, "Todolist form is invalid.")
        |> redirect(to: Routes.todolist_path(conn, :index))
        # render(conn, "index.html", todolist: todolist)
    end
  end

  def show(conn, %{"id" => id}) do
    todolist = Task.get_todolist_with_items(id)
    render(conn, "show.html", todolist: todolist)
  end
end
