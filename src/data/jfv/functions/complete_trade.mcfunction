function jfv:sync_storage
execute at @e[tag=offerer_flag] run data modify block ~ ~-0.5 ~ Items set from storage offer2 Items
execute at @e[tag=accepter_flag] run data modify block ~ ~-0.5 ~ Items set from storage offer1 Items
tellraw @a[tag=offerer] {"text":"Trade completed!","color":"gold"}
tellraw @a[tag=accepter] {"text":"Trade completed!","color":"gold"}
playsound entity.experience_orb.pickup master @a[tag=offerer] ~ ~ ~
playsound entity.experience_orb.pickup master @a[tag=accepter] ~ ~ ~
tellraw @a {"text":"","color":"blue","extra":[{"selector":"@a[tag=offerer]"},{"text":"'s trade has been completed!"}]}
function jfv:end_trade