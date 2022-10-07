#accepting trade
#first existing players cancel duplicates
execute as @a[tag=accepter] run execute as @s run tellraw @s {"text":"The trade has already been reserved!","color":"red"}
execute as @a[tag=accepter] run execute as @s run scoreboard players set @s accept_trade 0

#add tag to players (using offerer), cancel players who coudn't recieve the tag because there was no offerer
execute as @a[tag=offerer] run tag @s add accepting_trade
tellraw @a[scores={accept_trade=1..},tag=!accepting_trade] {"text":"There is no trade to accept!","color":"red"}
scoreboard players set @a[tag=accepting_trade] accept_trade 0
execute as @s[tag=accepting_trade] at @s run execute if block ~ ~-0.5 ~ minecraft:chest run summon rabbit ~ ~ ~ {Age:-25000,RabbitType:4,Invulnerable:1,PersistenceRequired:0,Silent:1,NoAI:1,Tags:["accepter_flag"],ActiveEffects:[{Id:14,Amplifier:0,Duration:999999,ShowParticles:0b}]}
execute as @s[tag=accepting_trade] at @s run execute as @e[tag=accepter_flag] run tag @a[tag=accepting_trade] add accepter
execute as @s[tag=accepting_trade,tag=!accepter] run tellraw @s {"text":"You must be on top of a chest to accept a trade!","color":"red"}
#if there is an accepter, there must be an offerer, so we can continue the trade
execute as @s[tag=accepting_trade,tag=accepter] run scoreboard players set #global offer_trade_timer 1200
execute as @s[tag=accepting_trade,tag=accepter] run function jfv:full_trade_info
execute as @s[tag=accepting_trade,tag=accepter] run execute as @a[tag=offerer] run function jfv:full_trade_info
scoreboard players set @s accept_trade 0