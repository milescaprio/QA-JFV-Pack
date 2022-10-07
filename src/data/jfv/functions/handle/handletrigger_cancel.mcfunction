#manage cancel trigger
scoreboard players set @s shoptimer 0
scoreboard players set @s hometimer 0
scoreboard players set @s respawntimer 0
scoreboard players set @s cancel 0
tellraw @s {"text":"Cancelled!","color":"green"}