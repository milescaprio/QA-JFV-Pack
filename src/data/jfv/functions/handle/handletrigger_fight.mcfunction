#teleport people to fight or initialize warmup
scoreboard players set @s fight 0
scoreboard players set @s[scores={Health=..15}] fighttimer 400
scoreboard players set @s[scores={Health=16..}] fighttimer 100
tellraw @s[scores={Health=..15}] {"text":"Teleporting to the Fight Zone in 20 seconds!", "color":"dark_purple"}
tellraw @s[scores={Health=16..}] {"text":"Teleporting to the Fight Zone in 5 seconds, you have 80% or more health!","color":"dark_purple"}
tellraw @s {"text":"[Click Here] or use /trigger cancel to cancel!","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger cancel"},"hoverEvent":{"action":"show_text","value":"/trigger cancel"}}