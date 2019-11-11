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

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset)
    end
  end

   def show(conn, %{"id" => id}) do
    todolist = Task.get_todolist!(id)
    render(conn, "show.html", todolist: todolist)
  end
end
