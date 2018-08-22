DEFINE_BASECLASS("npc_random_base")

if CLIENT then
SWEP.WepSelectIcon		= surface.GetTextureID( "npc_sw_weapon_e11d_edit" )
	 
killicon.Add( "npc_sw_weapon_e11d_edit", "vgui/hud/e11d", color_white )
end

SWEP.WorldModel					= "models/weapons/w_E-11D.mdl"
SWEP.HoldType					= "ar2"

SWEP.MuzzleEffect    			= ""
SWEP.ShellEffect				= ""
SWEP.Tracer						= "effect_sw_laser_red"

SWEP.Damage						= 55
SWEP.Force						= 1
SWEP.Spread						= Vector(0,0,0)
SWEP.Primary.Cone			= 0.0125
SWEP.SpreadMPenalty				= 1.1
SWEP.BurstCount					= 0
SWEP.BurstDelay					= 0
SWEP.Primary.NumShots			= 1
SWEP.Primary.ClipSize			= 100
SWEP.Primary.DefaultClip		= 500
SWEP.Primary.Delay				= 5
SWEP.MinDelay                   = .05
SWEP.MaxBurstCount              = 50
SWEP.MinBurstCount              = 20
SWEP.Primary.Sound				= Sound("e11d.fire")

sound.Add( {
	name = "e11d.fire",
	channel = CHAN_ITEM,
	volume = 1.0,
	level = 80,
	pitch = 100,
	sound = {"weapons/e11d-1.wav",
			 "weapons/e11d-2.wav",
			 "weapons/e11d-3.wav"}
} )