defmodule DragonHoard.MongoPool do
  use Mongo.Pool, name: __MODULE__, adapter: Mongo.Pool.Poolboy

  require IEx

  def start_link(_thing, opts) do
    start_link(opts)
  end

  def run(func, _opts) do
    IO.inspect _opts
    IEx.pry
    run(func)
  end
end