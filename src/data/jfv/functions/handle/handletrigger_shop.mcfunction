#teleport people to shop or initialize warmup
scoreboard players set @s shop 0
scoreboard players set @s[scores={Health=..15}] shoptimer 400
scoreboard players set @s[scores={Health=16..}] shoptimer 100
tellraw @s[scores={Health=..15}] {"text":"Teleporting to the Shopping District in 20 seconds!","color":"dark_purple"}
tellraw @s[scores={Health=16..}] {"text":"Teleporting to the Shopping District in 5 seconds, you have 80% or more health!","color":"dark_purple"}
tellraw @s {"text":"[Click Here] or use /trigger cancel to cancel!","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger cancel"},"hoverEvent":{"action":"show_text","value":"/trigger cancel"}}