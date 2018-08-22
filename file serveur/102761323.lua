DEFINE_BASECLASS("npc_random_base")

if CLIENT then
SWEP.WepSelectIcon		= surface.GetTextureID( "npc_sw_weapon_dh17_edit" )
	 
killicon.Add( "npc_sw_weapon_dh17_edit", "vgui/hud/dh17", color_white )
end

SWEP.WorldModel					= "models/weapons/w_DH17.mdl"
SWEP.HoldType					= "ar2"

SWEP.MuzzleEffect    			= ""
SWEP.ShellEffect				= ""
SWEP.Tracer						= "effect_sw_laser_red"

SWEP.Damage						= 12
SWEP.Force						= 1
SWEP.Spread						= Vector(0,0,0)
SWEP.Primary.Cone			= 0.0125
SWEP.SpreadMPenalty				= 1.1
SWEP.BurstCount					= 0
SWEP.BurstDelay					= 0
SWEP.Primary.NumShots			= 1
SWEP.Primary.ClipSize			= 25
SWEP.Primary.DefaultClip		= 75
SWEP.Primary.Delay				= 5
SWEP.MinDelay                   = .2
SWEP.MaxBurstCount              = 20
SWEP.MinBurstCount              = 7
SWEP.Primary.Sound				= "weapons/DH17_fire.wav"