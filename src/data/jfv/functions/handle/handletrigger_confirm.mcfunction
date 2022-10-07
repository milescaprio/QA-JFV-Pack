#manage confirm trade trigger
tag @s[tag=offerer] add trade_confirmed
tag @s[tag=accepter] add trade_confirmed
tellraw @s[tag=!trade_confirmed] {"text":"You are not in a trade!","color":"red"}
scoreboard players set @s confirm_trade 0
#complete trade
execute as @s[tag=offerer,tag=trade_confirmed] run execute as @s[tag=accepter,tag=trade_confirmed] run function jfv:complete_trade