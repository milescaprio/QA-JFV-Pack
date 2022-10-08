#manage view trade trigger (different section because this doesn't edit the trade)
#fetch offer data for viewer
execute as @s run function jfv:sync_storage
execute as @s run tellraw @s {"text":"The items last offered are:\n ","color":"light_purple","extra":[{"nbt":"Items[]","storage":"offer1","color":"aqua"}]}
scoreboard players set @s view_trade 0