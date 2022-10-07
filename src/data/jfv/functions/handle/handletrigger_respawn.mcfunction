#teleport people to respawn or initialize warmup
scoreboard players set @s respawn 0
scoreboard players set @s[scores={Health=..15}] respawntimer 550
scoreboard players set @s[scores={Health=16..}] respawntimer 250
tellraw @s[scores={Health=..15}] {"text":"Teleporting to Respawn Point in 20 seconds!","color":"dark_purple"}
tellraw @s[scores={Health=16..}] {"text":"Teleporting to Respawn Point in 5 seconds, you have 80% or more health!","color":"dark_purple"}
tellraw @s {"text":"[Click Here] or use /trigger cancel to cancel!","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger cancel"},"hoverEvent":{"action":"show_text","value":"/trigger cancel"}}