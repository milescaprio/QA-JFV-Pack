#the logic in the handleall is kinda funny, it's assumed that the executor is triggering the function but we have to handle others also and check later if we removed it, and also re-check if manually executing from the point of view of another entity.
#if there are two people (one with new trigger and one with tag) then clear triggered person, only one allowed
execute as @a[tag=offerer] run execute as @s run tellraw @s {"text":"A trade is already in progress!", "color":"red"}
execute as @a[tag=offerer] run execute as @s run scoreboard players set @s offer_trade 0

#convert to temporary tag, limit 1 so we can detect a second next tick
#unnecessary using triggerall call, but it's a nice way to show how to use it
tag @s[scores={offer_trade=1..}] add offering_trade
execute if score #global offer_trade_timer matches -1 run function jfv:end_trade
scoreboard players set @s offer_trade 0

#initialize if player is on top of chest; add eventlong tag
#if player is standing on chest we can spawn the offerer flag bunny
execute as @s[tag=offering_trade] at @s run execute if block ~ ~-0.5 ~ minecraft:chest run summon rabbit ~ ~ ~ {Age:-25000,RabbitType:4,Invulnerable:1,PersistenceRequired:1b,Silent:1,NoAI:1,Tags:["offerer_flag"],ActiveEffects:[{Id:14,Amplifier:0,Duration:999999,ShowParticles:0b}]}
#if the bunny exists now, it's new, we can start the trade
execute as @s at @s run execute as @e[tag=offerer_flag] run tag @p[tag=offering_trade] add offerer
execute as @s[tag=offering_trade,tag=!offerer] run tellraw @s {"text":"You must be on top of a chest to offer a trade!","color":"red"}
execute as @s[tag=offering_trade,tag=offerer] run tellraw @s {"text":"You are offering a trade!\n","color":"green","extra":[{"text":"[Click Here] or use /trigger cancel_trade to cancel!","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger cancel_trade"},"hoverEvent":{"action":"show_text","value":"/trigger cancel_trade"}}]}
execute as @s[tag=offering_trade,tag=offerer] run scoreboard players set #global offer_trade_timer 2400
execute as @s[tag=offering_trade,tag=offerer] run tellraw @a               {"text":"","color":"blue","extra":[{"selector":"@a[tag=offerer]"},{"text":" offers a trade! It will expire in 120 seconds!"}]}
execute as @s[tag=offering_trade,tag=offerer] run tellraw @a {"text":"/trigger view_trade or [Click Here] to view offer","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger view_trade"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"/trigger view_trade"}]}}}
execute as @s[tag=offering_trade,tag=offerer] run tellraw @a {"text":"/trigger accept_trade or [Click Here] to accept offer","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger accept_trade"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"/trigger accept_trade"}]}}}