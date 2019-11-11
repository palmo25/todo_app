defmodule TodoAppWeb.TodolistControllerTest do
  use TodoAppWeb.ConnCase

  alias Todo.Task

  @create_attrs %{description: "some description"}
  @update_attrs %{description: "some updated description"}
  @invalid_attrs %{description: nil}

  def fixture(:todolist) do
    {:ok, todolist} = Task.create_todolist(@create_attrs)
    todolist
  end

  describe "index" do
    test "lists all todolists", %{conn: conn} do
      conn = get(conn, Routes.todolist_path(conn, :index))
      assert html_response(conn, 200) =~ "Todolists"
    end
  end

  describe "create todolist" do
    test "redirects to index when data is valid", %{conn: conn} do
      conn = post(conn, Routes.item_path(conn, :create), todolist: @create_attrs)

    #   assert %{id: id} = redirected_params(conn)
    #   assert redirected_to(conn) == Routes.item_path(conn, :show, id)

    #   conn = get(conn, Routes.item_path(conn, :show, id))
    #   assert html_response(conn, 200) =~ "Show Item"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.item_path(conn, :create), item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Item"
    end
  end
end
