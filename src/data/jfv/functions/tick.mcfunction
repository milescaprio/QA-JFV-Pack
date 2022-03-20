tag @a remove spawnZone
tag @a remove depositing
tag @a remove withdrawing
tag @a remove homing
tag @a remove shopping
tag @a remove quicktransferring
tag @a remove paying
tag @a remove helping
tag @a remove cancelling
scoreboard players enable @a deposit
scoreboard players enable @a withdraw
scoreboard players enable @a home
scoreboard players enable @a help
scoreboard players enable @a shop
scoreboard players enable @a quicktransfer
scoreboard players enable @a cancel
scoreboard players enable @a craft
scoreboard players enable @a enderchest

tag @a[x=24,y=-100,z=-8,dx=55,dy=500,dz=55] add spawnZone
gamemode adventure @a[tag=spawnZone,tag=!op,gamemode=!adventure]
gamemode survival @a[tag=!spawnZone,tag=!op,gamemode=!survival]

execute as @a[scores={deposit=1..}] run execute store success score @s deduceSucess run clear @s diamond 1
execute as @a[scores={deposit=1..}] run execute if score @s deduceSucess matches 1 run tag @s add depositing
scoreboard players reset @a[scores={deposit=1..}] deduceSucess
execute as @a[tag=depositing] run scoreboard players add @s Diamond_Bank 1
execute as @a[tag=depositing] run scoreboard players remove @s deposit 1
tell @a[tag=!depositing,scores={deposit=1..}] You don't have that many to deposit!
execute as @a[tag=!depositing,scores={deposit=1..}] run scoreboard players set @s deposit 0

execute as @a[scores={quicktransfer=1..}] run scoreboard players remove @s Diamond_Bank 1
execute as @a[scores={quicktransfer=1..,Diamond_Bank=0..}] run tag @s add quicktransferring
execute as @a[tag=quicktransferring] run scoreboard players add @p[tag=!quicktransferring] Diamond_Bank 1
execute as @a[tag=quicktransferring] run scoreboard players remove @s quicktransfer 1
execute as @a[tag=!quicktransferring,scores={quicktransfer=1..}] run scoreboard players add @s Diamond_Bank 1
tell @a[tag=!quicktransferring,scores={quicktransfer=1..}] You don't have that many to transfer!
execute as @a[tag=!quicktransferring,scores={quicktransfer=1..}] run scoreboard players set @s quicktransfer 0

execute as @a[scores={withdraw=1..}] run scoreboard players remove @s Diamond_Bank 1
execute as @a[scores={withdraw=1..,Diamond_Bank=0..}] run tag @s add withdrawing
execute as @a[tag=withdrawing] run give @s diamond
execute as @a[tag=withdrawing] run scoreboard players remove @s withdraw 1
execute as @a[tag=!withdrawing,scores={withdraw=1..}] run scoreboard players add @s Diamond_Bank 1
tell @a[tag=!withdrawing,scores={withdraw=1..}] You don't have that many to withdraw!
execute as @a[tag=!withdrawing,scores={withdraw=1..}] run scoreboard players set @s withdraw 0

execute as @a[scores={home=1..}] run tag @s add homing
execute as @a[tag=homing] run scoreboard players set @s home 0
execute as @a[tag=homing] run scoreboard players set @s hometimer 200
tell @a[tag=homing] Teleporting home in 10 seconds!
execute as @a[scores={hometimer=0..}] run scoreboard players remove @s hometimer 1
execute as @a[scores={hometimer=0}] run tp 56 84 24
tell @a[scores={hometimer=0}] Teleporting home!

execute as @a[scores={shop=1..}] run tag @s add shopping
execute as @a[tag=shopping] run scoreboard players set @s shop 0
execute as @a[tag=shopping] run scoreboard players set @s shoptimer 200
tell @a[tag=shopping] Teleporting to the Shopping District in 10 seconds!
execute as @a[scores={shoptimer=0..}] run scoreboard players remove @s shoptimer 1
execute as @a[scores={shoptimer=0}] run tp 348 66 201
tell @a[scores={shoptimer=0}] Teleporting to the Shopping District!

execute as @a[scores={cancel=1..}] run tag @a add cancelling
execute as @a[tag=cancelling] run scoreboard players set @s shoptimer 0
execute as @a[tag=cancelling] run scoreboard players set @s hometimer 0
execute as @a[tag=cancelling] run scoreboard players set @s cancel 0
tell @a[tag=cancelling] Cancelling!

execute as @a[scores={craft=1..},gamemode=!adventure] run setblock ~ ~ ~ crafting_table destroy
execute as @a[scores={craft=1..}] run scoreboard players set @s craft 0

execute as @a[scores={enderchest=1..,gamemode=!adventure}] run setblock ~ ~ ~ ender_chest destroy
execute as @a[scores={enderchest=1..}] run scoreboard players set @s enderchest 0

execute as @a[scores={help=1..}] run tag @s add helping
tellraw @a[tag=helping] {"text":"Commands:","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger deposit set <value> : Deposits diamonds to bank, <value> should be amount","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger withdraw set <value> : Withdraws diamonds from bank, <value> should be amount","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger quicktransfer set <value> : Transfers diamonds to nearest player, <value> should be amount","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger home : Teleports to spawn in 10 seconds.","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger shop : Teleports to the Shopping District in 10 seconds.","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger cancel : Stop Teleporting","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger craft : Set current block to crafting table, for easy crafting","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger enderchest : Set current block to enderchest, for easy inventory management","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger help : Bring up this menu","color":"yellow"}
execute as @a[scores={help=1..}] run scoreboard players set @s help 0