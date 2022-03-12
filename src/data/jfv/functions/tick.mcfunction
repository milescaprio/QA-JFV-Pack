#gamemode adventure @a[x=32,y=-64,z=0,dx=47,dy=383,dz=47,m=!adventure,tag=!op]
#gamemode survival @a[x=32,y=-64,z=0,dx=47,dy=383,dz=47,m=!survival,tag=!op]
#tell @a[x=56,y=83,z=24,distance=24..] get in of circle
#tell @a[x=56,y=83,z=24,distance=..24] get out circle
#tell @a[x=32,z=0,dx=47,dz=47,tag=!op] get out of circle
#tell @a[z=-1,dz=-65535,tag=!op] get in the circle
#tell @a[z=48,dz=65535,tag=!op] get in the circle
#tell @a[x=31,dx=-65535,tag=!op] get in the circle
#tell @a[x=80,dx=65535,tag=!op] get in the circle
#tell @a[x=31,y=-100,z=-1,dx=-65535,dy=500,dz=-65535,tag=!op] get in the circle
#tell @a[x=80,y=-100,z=48,dx=65535,dy=500,dz=65535,tag=!op] get in the circle
tag @a remove spawnZone
tag @a[x=32,y=-100,z=0,dx=47,dy=500,dz=47] add spawnZone
gamemode adventure @a[tag=spawnZone,tag=!op,gamemode=!adventure]
gamemode survival @a[tag=!spawnZone,tag=!op,gamemode=!survival]