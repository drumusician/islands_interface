defmodule IslandsInterface.Web.GameChannel do
  use IslandsInterface.Web, :channel

  alias IslandsEngine.Game

  def join("game:" <> _player, _payload, socket) do
    {:ok, socket}
  end

  def handle_in("new_game", payload, socket) do
    "game:" <> player = socket.topic
    case Game.start_link(player) do
      {:ok, _pid} ->
        {:reply, :ok, socket}
      {:error, reason} ->
        {:reply, {:error, %{reason: inspect(reason)}}, socket}
    end
  end

  def handle_in("add_player", player, socket) do
    case Game.add_player({:global, socket.topic}, player) do
      :ok ->
        broadcast!(socket, "player_added", %{message: "New player just joined: " <> player})
        {:noreply, socket}
      {:error, reason} ->
        {:reply, {:error, %{reason: reason}}, socket}
    end
  end

end
