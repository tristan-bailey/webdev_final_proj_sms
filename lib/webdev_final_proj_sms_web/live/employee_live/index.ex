defmodule WebdevFinalProjSmsWeb.EmployeeLive.Index do
  use WebdevFinalProjSmsWeb, :live_view

  alias WebdevFinalProjSms.Sms

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :employees, Sms.list_employees())}
  end

  #@impl true
  # def handle_params(params, _url, socket) do
  #   {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  # end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Employees")
    |> assign(:employee, nil)
  end
end
