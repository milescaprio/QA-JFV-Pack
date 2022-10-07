#tellraw conventions: 
#red: error on your or server's part
#dark_purple: teleporting
#green: command success
#blue: other things happening
#light_purple: response to your command
#aqua: command follow-up info
#gold: important notifications

#remove these tags, theyll get added back when they need to
tag @a remove spawnZone
tag @a remove fightZone
tag @a remove depositing
tag @a remove withdrawing
tag @a remove homing
tag @a remove shopping
tag @a remove fighting
tag @a remove respawning
tag @a remove quicktransferring
tag @a remove paying
tag @a remove cancelling
tag @a remove offering_trade
tag @a remove accepting_trade

function jfv:new_players

#spawn zone tag and gamemode setting based on tag and op
tag @a[x=24,y=-100,z=-8,dx=55,dy=500,dz=55] add spawnZone
tag @a[x=0,y=265,z=100,dx=100,dy=20,dz=50] add fightZone
gamemode adventure @a[tag=spawnZone,tag=!op,gamemode=!adventure]
gamemode adventure @a[tag=fightZone,tag=!op,gamemode=!adventure]
gamemode survival @a[tag=!spawnZone,tag=!fightZone,tag=!op,gamemode=!survival]


#deposit trigger management
execute as @a[scores={deposit=1..}] run execute store success score @s deduceSucess run clear @s diamond 1
execute as @a[scores={deposit=1..}] run execute if score @s deduceSucess matches 1 run tag @s add depositing
scoreboard players reset @a[scores={deposit=1..}] deduceSucess
execute as @a[tag=depositing] run scoreboard players add @s Diamond_Bank 1
execute as @a[tag=depositing] run scoreboard players remove @s deposit 1
tellraw @a[tag=!depositing,scores={deposit=1..}] {"text":"You don't have that many to deposit!","color":"red"}
execute as @a[tag=!depositing,scores={deposit=1..}] run scoreboard players set @s deposit 0


#quicktransfer trigger management
scoreboard players remove @a[scores={quicktransfer=1..}] Diamond_Bank 1
tag @a[scores={quicktransfer=1..,Diamond_Bank=0..}] add quicktransferring
execute as @a[tag=quicktransferring] run scoreboard players add @p[tag=!quicktransferring] Diamond_Bank 1
scoreboard players remove @a[tag=quicktransferring] quicktransfer 1
scoreboard players add @a[tag=!quicktransferring,scores={quicktransfer=1..}] Diamond_Bank 1
tellraw @a[tag=!quicktransferring,scores={quicktransfer=1..}] {"text":"You don't have that many to transfer!","color":"red"}
scoreboard players set @a[tag=!quicktransferring,scores={quicktransfer=1..}] quicktransfer 0


#withdraw trigger management
scoreboard players remove @a[scores={withdraw=1..}] Diamond_Bank 1
tag @a[scores={withdraw=1..,Diamond_Bank=0..}] add withdrawing
give @a[tag=withdrawing] diamond
scoreboard players remove @a[tag=withdrawing] withdraw 1
scoreboard players add @a[tag=!withdrawing,scores={withdraw=1..}] Diamond_Bank 1
tellraw @a[tag=!withdrawing,scores={withdraw=1..}] {"text":"You don't have that many to withdraw!","color":"red"}
scoreboard players set @a[tag=!withdrawing,scores={withdraw=1..}] withdraw 0


#teleport people home or initialize warmup
tag @a[scores={home=1..}] add homing
scoreboard players set @a[tag=homing] home 0
scoreboard players set @a[tag=homing,scores={Health=..15}] hometimer 400
scoreboard players set @a[tag=homing,scores={Health=16..}] hometimer 100
tellraw @a[tag=homing,scores={Health=..15}] {"text":"Teleporting home in 20 seconds!","color":"dark_purple"}
tellraw @a[tag=homing,scores={Health=16..}] {"text":"Teleporting home in 5 seconds, you have 80% or more health!","color":"dark_purple"}
tellraw @a[tag=homing] {"text":"[Click Here] or use /trigger cancel to cancel!","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger cancel"},"hoverEvent":{"action":"show_text","value":"/trigger cancel"}}
scoreboard players remove @a[scores={hometimer=0..}] hometimer 1
execute as @a[scores={hometimer=0}] run tp 56 84 24
tellraw @a[scores={hometimer=0}] {"text":"Teleporting home!","color":"dark_purple"}
#playsound minecraft:entity.egg.throw master @a[scores={hometimer=0}] ~ ~ ~


#teleport people to shop or initialize warmup
tag @a[scores={shop=1..}] add shopping
scoreboard players set @a[tag=shopping] shop 0
scoreboard players set @a[tag=shopping,scores={Health=..15}] shoptimer 400
scoreboard players set @a[tag=shopping,scores={Health=16..}] shoptimer 100
tellraw @a[tag=shopping,scores={Health=..15}] {"text":"Teleporting to the Shopping District in 20 seconds!","color":"dark_purple"}
tellraw @a[tag=shopping,scores={Health=16..}] {"text":"Teleporting to the Shopping District in 5 seconds, you have 80% or more health!","color":"dark_purple"}
tellraw @a[tag=shopping] {"text":"[Click Here] or use /trigger cancel to cancel!","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger cancel"},"hoverEvent":{"action":"show_text","value":"/trigger cancel"}}
scoreboard players remove @a[scores={shoptimer=0..}] shoptimer 1
#playsound minecraft:entity.egg.throw master @a[scores={shoptimer=0}] ~ ~ ~ 
execute as @a[scores={shoptimer=0}] run tp 50 70 120
tellraw @a[scores={shoptimer=0}] {"text":"Teleporting to the Shopping District!","color":"dark_purple"}


#teleport people to fight or initialize warmup
tag @a[scores={fight=1..}] add fighting
scoreboard players set @a[tag=fighting] fight 0
scoreboard players set @a[tag=fighting,scores={Health=..15}] fighttimer 400
scoreboard players set @a[tag=fighting,scores={Health=16..}] fighttimer 100
tellraw @a[tag=fighting,scores={Health=..15}] {"text":"Teleporting to the Fight Zone in 20 seconds!", "color":"dark_purple"}
tellraw @a[tag=fighting,scores={Health=16..}] {"text":"Teleporting to the Fight Zone in 5 seconds, you have 80% or more health!","color":"dark_purple"}
tellraw @a[tag=fighting] {"text":"[Click Here] or use /trigger cancel to cancel!","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger cancel"},"hoverEvent":{"action":"show_text","value":"/trigger cancel"}}
scoreboard players remove @a[scores={fighttimer=0..}] fighttimer 1
#playsound minecraft:entity.egg.throw master @a[scores={fighttimer=0}] ~ ~ ~ 
execute as @a[scores={fighttimer=0}] run tp 50 270 120
tellraw @a[scores={fighttimer=0}] {"text":"Teleporting to the Fight Zone!","color":"dark_purple"}


#teleport people to respawn or initialize warmup
tag @a[scores={respawn=1..}] add respawning
scoreboard players set @a[tag=respawning] respawn 0
scoreboard players set @a[tag=respawning,scores={Health=..15}] respawntimer 400
scoreboard players set @a[tag=respawning,scores={Health=16..}] respawntimer 100
tellraw @a[tag=respawning,scores={Health=..15}] {"text":"Teleporting to Respawn Point in 20 seconds!","color":"dark_purple"}
tellraw @a[tag=respawning,scores={Health=16..}] {"text":"Teleporting to Respawn Point in 5 seconds, you have 80% or more health!","color":"dark_purple"}
tellraw @a[tag=respawning] {"text":"[Click Here] or use /trigger cancel to cancel!","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger cancel"},"hoverEvent":{"action":"show_text","value":"/trigger cancel"}}
scoreboard players remove @a[scores={respawntimer=0..}] respawntimer 1
#on, kill, off, they go home, and death counter decrements
tellraw @a[scores={respawntimer=12}] {"text":"Teleporting to Respawn Point!","color":"dark_purple"}
execute as @a[scores={respawntimer=8}] run gamerule keepInventory true 
execute as @a[scores={respawntimer=8}] run gamerule doImmediateRespawn true
kill @a[scores={respawntimer=4}]
execute as @a[scores={respawntimer=0}] run gamerule keepInventory false
execute as @a[scores={respawntimer=0}] run gamerule doImmediateRespawn false
scoreboard players remove @a[scores={respawntimer=0}] Deaths 1
#playsound minecraft:entity.egg.throw master @a[scores={respawntimer=0}] ~ ~ ~


#manage cancel trigger
tag @a[scores={cancel=1..}] add cancelling
scoreboard players set @a[tag=cancelling] shoptimer 0
scoreboard players set @a[tag=cancelling] hometimer 0
scoreboard players set @a[tag=cancelling] respawntimer 0
scoreboard players set @a[tag=cancelling] cancel 0
tellraw @a[tag=cancelling] {"text":"Cancelled!","color":"green"}


#manage enderchest and craft trigger, right now not working
execute as @a[scores={craft=1..},gamemode=!adventure] run setblock ~ ~ ~ crafting_table destroy
scoreboard players set @a[scores={craft=1..}] craft 0
execute as @a[scores={enderchest=1..},gamemode=!adventure] run setblock ~ ~ ~ ender_chest destroy
scoreboard players set @a[scores={enderchest=1..}] enderchest 0


#manage active trading triggers
#tick down trade timeout timer
execute if score #global offer_trade_timer matches 0.. run scoreboard players remove #global offer_trade_timer 1

#if there are two people (one with new trigger and one with tag) then clear triggered person, only one allowed
execute as @a[tag=offerer] run execute as @a[scores={offer_trade=1..}] run tellraw @s {"text":"A trade is already in progress!", "color":"red"}
execute as @a[tag=offerer] run execute as @a[scores={offer_trade=1..}] run scoreboard players set @s offer_trade 0

#convert to temporary tag, limit 1 so we can detect a second next tick
tag @a[scores={offer_trade=1..},limit=1] add offering_trade
scoreboard players set @a[tag=offering_trade] offer_trade 0

#initialize if player is on top of chest; add eventlong tag
#if player is standing on chest we can spawn the offerer flag bunny
execute as @a[tag=offering_trade] at @s run execute if block ~ ~-0.5 ~ minecraft:chest run summon rabbit ~ ~ ~ {Age:-25000,RabbitType:4,Invulnerable:1,PersistenceRequired:0,Silent:1,NoAI:1,Tags:["offerer_flag"],ActiveEffects:[{Id:14,Amplifier:0,Duration:999999,ShowParticles:0b}]}
#if the bunny exists now, it's new, we can start the trade
execute as @a[tag=offering_trade] at @s run execute as @e[tag=offerer_flag] run tag @a[tag=offering_trade] add offerer
execute as @a[tag=offering_trade,tag=!offerer] run tellraw @s {"text":"You must be on top of a chest to offer a trade!","color":"red"}
execute as @a[tag=offering_trade,tag=offerer] run tellraw @s {"text":"You are offering a trade!\n","color":"green","extra":[{"text":"[Click Here] or use /trigger cancel to cancel!","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger cancel"},"hoverEvent":{"action":"show_text","value":"/trigger cancel"}}]}
execute as @a[tag=offering_trade,tag=offerer] run scoreboard players set #global offer_trade_timer 2400
execute as @a[tag=offering_trade,tag=offerer] run tellraw @a               {"text":"","color":"blue","extra":[{"selector":"@a[tag=offerer]"},{"text":" offers a trade! It will expire in 120 seconds!"}]}
execute as @a[tag=offering_trade,tag=offerer] run tellraw @a {"text":"/trigger view_trade or [Click Here] to view offer","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger view_trade"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"/trigger view_trade"}]}}}
execute as @a[tag=offering_trade,tag=offerer] run tellraw @a {"text":"/trigger accept_trade or [Click Here] to accept offer","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger accept_trade"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"/trigger accept_trade"}]}}}

execute if score #global offer_trade_timer matches 1.. run function jfv:count_trades
execute if score #global offer_trade_timer matches 1.. run function jfv:handle_trade_errors
execute if score #global offer_trade_timer matches 0 run tellraw @a {"text":"","color":"blue","extra":[{"selector":"@a[tag=offerer]"},{"text":"'s trade has expired!"}]}
execute if score #global offer_trade_timer matches 0 run function jfv:end_trade

#accepting trade
#first existing players cancel duplicates
execute as @a[tag=accepter] run execute as @a[scores={accept_trade=1..}] run tellraw @s {"text":"The trade has already been reserved!","color":"red"}
execute as @a[tag=accepter] run execute as @a[scores={accept_trade=1..}] run scoreboard players set @s accept_trade 0

#add tag to players (using offerer), cancel players who coudn't recieve the tag because there was no offerer
execute as @a[tag=offerer] run tag @a[scores={accept_trade=1..},limit=1] add accepting_trade
tellraw @a[scores={accept_trade=1..},tag=!accepting_trade] {"text":"There is no trade to accept!","color":"red"}
scoreboard players set @a[tag=accepting_trade] accept_trade 0
execute as @a[tag=accepting_trade] at @s run execute if block ~ ~-0.5 ~ minecraft:chest run summon rabbit ~ ~ ~ {Age:-25000,RabbitType:4,Invulnerable:1,PersistenceRequired:0,Silent:1,NoAI:1,Tags:["accepter_flag"],ActiveEffects:[{Id:14,Amplifier:0,Duration:999999,ShowParticles:0b}]}
execute as @a[tag=accepting_trade] at @s run execute as @e[tag=accepter_flag] run tag @a[tag=accepting_trade] add accepter
execute as @a[tag=accepting_trade,tag=!accepter] run tellraw @s {"text":"You must be on top of a chest to accept a trade!","color":"red"}
execute as @a[tag=accepting_trade,tag=accepter] run scoreboard players set #global offer_trade_timer 1200
execute as @a[tag=accepting_trade,tag=accepter] run function jfv:full_trade_info
execute as @a[tag=accepting_trade,tag=accepter] run execute as @a[tag=offering_trade,tag=offerer] run function jfv:full_trade_info
scoreboard players set @a[scores={accept_trade=1..}] accept_trade 0

#manage cancel trade trigger
execute as @a[tag=!offerer,tag=!accepter,scores={cancel_trade=1..}] run tellraw @s {"text":"You are not in a trade!","color":"red"}
execute as @a[tag=offerer,scores={cancel_trade=1..}] run tellraw @a {"text":"","color":"blue","extra":[{"selector":"@a[tag=offerer]"},{"text":"'s trade has been cancelled!"}]}
execute as @a[tag=accepter,scores={cancel_trade=1..}] run tellraw @a {"text":"","color":"blue","extra":[{"selector":"@a[tag=offerer]"},{"text":"'s trade has been cancelled!"}]}
execute as @a[tag=offerer,scores={cancel_trade=1..}] run function jfv:end_trade
execute as @a[tag=accepter,scores={cancel_trade=1..}] run function jfv:end_trade
scoreboard players set @a[scores={cancel_trade=1..}] cancel_trade 0

#manage confirm trade trigger
tag @a[tag=offerer,scores={confirm_trade=1..}] add trade_confirmed
tag @a[tag=accepter,scores={confirm_trade=1..}] add trade_confirmed
tellraw @a[scores={confirm_trade=1..},tag=!trade_confirmed] {"text":"You are not in a trade!","color":"red"}
scoreboard players set @a[scores={confirm_trade=1..}] confirm_trade 0
#complete trade
execute as @a[tag=offerer,tag=trade_confirmed] run execute as @a[tag=accepter,tag=trade_confirmed] run function jfv:complete_trade


#manage view trade trigger (different section because this doesn't edit the trade)
#fetch offer data for viewer
execute as @a[scores={view_trade=1..}] run function jfv:sync_storage
execute as @a[scores={view_trade=1..}] run tellraw @s {"text":"The items offered are:\n ","color":"light_purple","extra":[{"nbt":"Items[]","storage":"offer1","color":"aqua"}]}
scoreboard players set @a[scores={view_trade=1..}] view_trade 0


#manage trade help trigger
execute as @a[scores={trade_help=1..}] run function jfv:trade_help
scoreboard players set @a[scores={trade_help=1..}] trade_help 0


#manage helping trigger
execute as @a[scores={help=1..}] run function jfv:help
execute as @a[scores={help=1..}] run scoreboard players set @s help 0