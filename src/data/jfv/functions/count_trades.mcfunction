#count how many of offerer and accepter flags there are
scoreboard players set #global offerer_flag_counter 0
execute as @e[tag=offerer_flag] run scoreboard players add #global offerer_flag_counter 1
scoreboard players set #global accepter_flag_counter 0
execute as @e[tag=accepter_flag] run scoreboard players add #global accepter_flag_counter 1
scoreboard players set #global offerer_counter 0
execute as @e[tag=offerer] run scoreboard players add #global offerer_counter 1
scoreboard players set #global accepter_counter 0
execute as @e[tag=accepter] run scoreboard players add #global accepter_counter 1