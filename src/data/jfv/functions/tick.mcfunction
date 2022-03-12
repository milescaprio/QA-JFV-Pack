tag @a remove spawnZone
tag @a remove depositing
tag @a remove withdrawing
scoreboard players enable @a deposit
scoreboard players enable @a withdraw

tag @a[x=32,y=-100,z=0,dx=47,dy=500,dz=47] add spawnZone
gamemode adventure @a[tag=spawnZone,tag=!op,gamemode=!adventure]
gamemode survival @a[tag=!spawnZone,tag=!op,gamemode=!survival]

execute as @a[scores={deposit=1..}] run execute store success score @s deduceSucess run clear @s diamond 1
execute as @a[scores={deposit=1..}] run execute if score @s deduceSucess matches 1 run tag @s add depositing
#execute as @a[tag=depositing] run say depositing;
#execute as @a[tag=!depositing] run say not depositing;
scoreboard players reset @a[scores={deposit=1..}] deduceSucess
execute as @a[tag=depositing] run scoreboard players add @s Diamond_Bank 1
execute as @a[tag=depositing] run scoreboard players remove @s deposit 1
tell @a[tag=!depositing,scores={deposit=1..}] You don't have that many to deposit!
execute as @a[tag=!depositing,scores={deposit=1..}] run scoreboard players set @s deposit 0

execute as @a[scores={withdraw=1..}] run scoreboard players remove @s Diamond_Bank 1
execute as @a[scores={withdraw=1..,Diamond_Bank=0..}] run tag @s add withdrawing
execute as @a[tag=withdrawing] run give @s diamond
execute as @a[tag=withdrawing] run scoreboard players remove @s withdraw 1
execute as @a[tag=!withdrawing,scores={withdraw=1..}] run scoreboard players add @s Diamond_Bank 1
tell @a[tag=!withdrawing,scores={withdraw=1..}] You don't have that many to withdraw!
execute as @a[tag=!withdrawing,scores={withdraw=1..}] run scoreboard players set @s withdraw 0