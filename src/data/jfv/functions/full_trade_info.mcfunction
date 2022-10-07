function jfv:sync_storage
#chooses either offerer or accepter for order of recieving vs sending
tellraw @s {"text":"The trade has been accepted!","color":"gold"}
tellraw @s[tag=offerer] {"text":"The items offered are:\n ","color":"light_purple","extra":[{"nbt":"Items[]","storage":"offer2","color":"aqua"}]}
tellraw @s[tag=offerer] {"text":"The items you offered are:\n ","color":"light_purple","extra":[{"nbt":"Items[]","storage":"offer1","color":"aqua"}]}
tellraw @s[tag=accepter] {"text":"The items offered are:\n ","color":"light_purple","extra":[{"nbt":"Items[]","storage":"offer1","color":"aqua"}]}
tellraw @s[tag=accepter] {"text":"The items you offered are:\n ","color":"light_purple","extra":[{"nbt":"Items[]","storage":"offer2","color":"aqua"}]}

tellraw @s {"text":"/trigger confirm_trade or [Click Here] to confirm offer","color":"green","clickEvent":{"action":"run_command","value":"/trigger confirm_trade"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"/trigger confirm_trade"}]}}}
tellraw @s {"text":"/trigger cancel_trade or [Click Here] to cancel offer","color":"red","clickEvent":{"action":"run_command","value":"/trigger cancel_trade"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"/trigger cancel_trade"}]}}}