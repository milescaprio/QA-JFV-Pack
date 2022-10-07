#manage cancel trade trigger
execute as @s[tag=!offerer,tag=!accepter] run tellraw @s {"text":"You are not in a trade!","color":"red"}
execute as @s[tag=offerer] run tellraw @a {"text":"","color":"blue","extra":[{"selector":"@a[tag=offerer]"},{"text":"'s trade has been cancelled!"}]}
execute as @s[tag=accepter] run tellraw @a {"text":"","color":"blue","extra":[{"selector":"@a[tag=offerer]"},{"text":"'s trade has been cancelled!"}]}
execute as @s[tag=offerer] run function jfv:end_trade
execute as @s[tag=accepter] run function jfv:end_trade
scoreboard players set @s cancel_trade 0