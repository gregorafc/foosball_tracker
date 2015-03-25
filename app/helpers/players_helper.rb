module PlayersHelper

  def retire_show(player)
    if player.retire?
      'Retiring'
    else
      link_to 'Retire', player, 
                        method: :delete, data: { confirm: 'Are you sure?'}

    end
  end
end
