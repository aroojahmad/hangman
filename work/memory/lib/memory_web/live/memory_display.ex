defmodule MemoryWeb.Live.MemoryDisplay do
  use MemoryWeb, :live_view


  def mount(_params, _session, socket) do
    { :ok, schedule_tick_and_update_assigns(socket) }
  end

  def handle_info(:tick, socket) do
    { :no_reply, schedule_tick_and_update_assigns(socket) }
  end

  defp schedule_tick_and_update_assigns(socket) do
    Process.send_after(self(), :tick, 1000)
    socket = assign(socket, :memory, :erlang.memory())
  end

  def render(assigns) do
    ~H"""
    <table>
    <%= for { name, value } <- assigns.memory do %>
    <tr>
      <th><%= name %></th>
      <td><%= value %></td>
     </tr>
     <%= end %>
    </table>
    """
  end

end
