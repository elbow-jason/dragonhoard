defmodule DragonHoard.Repo do
  @moduledoc """
  Store non-transactional data in MongoDB.
  """
  use Ecto.Repo, otp_app: :dragon_hoard, adapter: Mongo.Ecto
end
