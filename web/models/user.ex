defmodule DragonHoard.User do
  alias DragonHoard.User

  defstruct [
    name:     nil,
    email:    nil,
    login:    nil,
    id:       nil,
    pw_hash:  nil,
  ]

  def register(%User{} = user) do
    # make sure it's valid
    # unique login
    # unique email
    # make sure pw is hashed
  end


end
