defmodule DragonHoard.Password do
  alias DragonHoard.User

  def hash_password(password) do
    Comeonin.Bcrypt.hashpwsalt(password)
  end

  def matches?(password_attempt, pw_hash) do
    Comeonin.Bcrypt.checkpw(password_attempt, pw_hash)
  end

end