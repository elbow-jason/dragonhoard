defmodule DragonHoard.Seabass do

  def start_link(_, _) do
    env = Application.get_all_env(:dragon_hoard)
      |> Dict.get(__MODULE__)
      |> Enum.into(%{})

    :cberl.start_link(:cberl_default, 5) #, env.host) #, env.username, env.password)
  end

end