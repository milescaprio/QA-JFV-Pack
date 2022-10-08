#manage confirm trade trigger
tag @s[tag=offerer] add trade_confirmed
tag @s[tag=accepter] add trade_confirmed
tellraw @s[tag=!trade_confirmed] {"text":"You are not in a trade!","color":"red"}
scoreboard players set @s confirm_trade 0
#complete trade, limit 1 just to be safe
execute as @a[tag=offerer,tag=trade_confirmed] run execute as @a[tag=accepter,tag=trade_confirmed,limit=1] run function jfv:complete_trade