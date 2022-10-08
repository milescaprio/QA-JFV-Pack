tellraw @s {"text":"Commands:","color":"yellow"}
tellraw @s {"text":"/trigger deposit set <value> : Deposits diamonds to bank, <value> should be amount","color":"yellow"}
tellraw @s {"text":"/trigger withdraw set <value> : Withdraws diamonds from bank, <value> should be amount","color":"yellow"}
tellraw @s {"text":"/trigger quicktransfer set <value> : Transfers diamonds to nearest player, <value> should be amount. Warning: doing without other players online may eat your items.","color":"yellow"}
tellraw @s {"text":"/trigger home : Teleports home in 20 seconds.","color":"yellow"}
tellraw @s {"text":"/trigger shop : Teleports to the Shopping District in 20 seconds.","color":"yellow"}
tellraw @s {"text":"/trigger fight : Teleports to fight zone in 20 seconds.","color":"yellow"}
tellraw @s {"text":"/trigger respawn : Teleports to your spawn point in 20 seconds. Warning: if loading out of a dimension takes over 7.5 seconds, your items will be lost.","color":"yellow"}
tellraw @s {"text":"/trigger cancel : Stop Teleporting","color":"yellow"}
tellraw @s {"text":"/trigger trade_help : Help on how to use trade commands","color":"yellow"}
#deprecated
#tellraw @s {"text":"/trigger craft : Set current block to crafting table, for easy crafting","color":"yellow"}
#tellraw @s {"text":"/trigger enderchest : Set current block to enderchest, for easy inventory management","color":"yellow"}
tellraw @s {"text":"/trigger help : Bring up this menu","color":"yellow"}
execute as @s run scoreboard players set @s help 0