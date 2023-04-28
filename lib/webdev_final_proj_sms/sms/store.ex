defmodule WebdevFinalProjSms.Sms.Store do
  use Ecto.Schema
  import Ecto.Changeset
  alias WebdevFinalProjSms.Sms.Product

  schema "stores" do
    field :location, :string
    field :store_id, :integer
    has_many :products, Product

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:store_id, :location])
    |> validate_required([:store_id, :location])
  end
end
