defmodule HelloWeb.UserController do
  use HelloWeb, :controller

  use PhoenixSwagger

  swagger_path :index do
    get "/api/user"
    description "List users"
    produces "application/json"

    parameters do
      messenger :query, :string, "Messenger", required: true
    end

    response 200, "Success"
  end

  def index(conn, %{"messenger" => messenger}) do
    json(conn, %{id: messenger})
  end
end
