--Leave this stuff the same
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.Base = "fighter_base"
ENT.Type = "vehicle"
ENT.PrintName = "Sheathipede Shuttle"
ENT.Author = "Liam0102, Doctor Jew"
-- Leave the same
ENT.Category = "Star Wars Vehicles: Other"
ENT.AutomaticFrameAdvance = true
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.EntModel = "models/sheathipede_shuttle/sheathipede_shuttle.mdl"
ENT.Vehicle = "SheathipedeShuttle"
ENT.Allegiance = "Neutral"
ENT.StartHealth = 600 --How much health they should have.
list.Set("SWVehicles", ENT.PrintName, ENT)

if SERVER then
	ENT.FireSound = Sound("weapons/xwing_shoot.wav") -- The sound to make when firing the weapons.

	ENT.NextUse = {
		Wings = CurTime(),
		Use = CurTime(),
		Fire = CurTime()
	}

	--Leave this alone for the most part.
	AddCSLuaFile()

	function ENT:SpawnFunction(pl, tr)
		local e = ents.Create("sheathipede_shuttle")
		local spawn_height = 10
		--You can ignore the rest
		e:SetPos(tr.HitPos + Vector(200, 0, spawn_height))
		e:SetAngles(Angle(0, pl:GetAimVector():Angle().Yaw + 0, 0))
		e:Spawn()
		e:Activate()

		return e
	end

	function ENT:Initialize()
		self:SetNWInt("Health", self.StartHealth)

		--The locations of the weapons (Where we shoot out of), local to the ship.
		self.WeaponLocations = {
			Right = self:GetPos() + self:GetForward() * -30 + self:GetRight() * 432 + self:GetUp() * -17.25,
			Middle = self:GetPos() + self:GetForward() * 585 + self:GetRight() * 0 + self:GetUp() * -91.75,
			Left = self:GetPos() + self:GetForward() * -30 + self:GetRight() * -432 + self:GetUp() * -17.25
		}

		self.WeaponsTable = {} -- IGNORE
		self.BoostSpeed = 2000 -- The speed we go when holding SHIFT -- I've lowered this as it was far too fast for effectively a flying tank, and lowered the acceleration speed. It was far too powerful compared to other ships (Liam)
		self.ForwardSpeed = 1500 -- The forward speed 
		self.UpSpeed = 600 -- Up/Down Speed
		self.AccelSpeed = 6 -- How fast we get to our previously set speeds
		self.CanBack = true -- Can we move backwards? Set to true if you want this.
		self.CanRoll = true -- Set to true if you want the ship to roll, false if not
		self.CanStrafe = false -- Set to true if you want the ship to strafe, false if not. You cannot have roll and strafe at the same time
		self.CanStandby = true -- Set to true if you want the ship to hover when not inflight
		self.CanShoot = false -- Set to true if you want the ship to be able to shoot, false if not
		self.OverheatAmount = 25
		self.DontOverheat = false
		self.MaxIonShots = 15
		-- Ignore these.
		self.Cooldown = 2
		self.Bullet = CreateBulletStructure(60, "green")

		self.ExitModifier = {
			x = 0,
			y = -400,
			z = 0
		}

		self.BaseClass.Initialize(self) -- Ignore, needed to work
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end

	-- Ignore
	ENT.CanFPV = false
	ENT.EnginePos = {}

	ENT.Sounds = {
		Engine = Sound("vehicles/stap/stap_engine.wav") -- This is the flight sound. These can get complicated, so I'd use the ones I've already put in the addon
	}

	local View = {}

	local function CalcView()
		local p = LocalPlayer()
		local veh = p:GetNWEntity("SheathipedeShuttle", NULL)

		if (IsValid(veh)) then
			local fpvPos = veh:GetPos()
			View = SWVehicleView(veh, 700, 200, fpvPos)

			return View
		end
	end

	hook.Add("CalcView", "SheathipedeShuttleView", CalcView)

	function ENT:FlightEffects()
		local id = self:EntIndex()
		self.EnginePos = {self:GetPos() + self:GetForward() * -325 + self:GetRight() * 80 + self:GetUp() * 140, self:GetPos() + self:GetForward() * -325 + self:GetRight() * -80 + self:GetUp() * 140}

		for k, v in pairs(self.EnginePos) do
			local dynlight = DynamicLight(id + 4096 * k)
			dynlight.Pos = v
			dynlight.Brightness = 5
			dynlight.Size = 200
			dynlight.Decay = 1024
			dynlight.R = 214
			dynlight.G = 222
			dynlight.B = 73
			dynlight.DieTime = CurTime() + 1
		end
	end

	function ENT:Think()
		self.BaseClass.Think(self)
		local p = LocalPlayer()
		local Flying = self:GetNWBool("Flying" .. self.Vehicle)
		local TakeOff = self:GetNWBool("TakeOff")
		local Land = self:GetNWBool("Land")

		if (Flying) then
			if (not TakeOff and not Land) then
				self:FlightEffects()
			end

			Health = self:GetNWInt("Health")

			if (p:KeyDown(IN_WALK) and self.NextView < CurTime()) then
				if (FPV) then
					FPV = false
				else
					FPV = true
				end

				self.NextView = CurTime() + 1
			end
		end
	end

	local function SheathipedeShuttleReticle()
		local p = LocalPlayer()
		local Flying = p:GetNWBool("FlyingSheathipedeShuttle")
		local veh = p:GetNWEntity("SheathipedeShuttle")

		if (Flying and IsValid(veh)) then
			SW_HUD_DrawHull(veh.StartHealth)
			SW_WeaponReticles(veh)
			SW_HUD_DrawOverheating(veh)
			local x = ScrW() / 2
			local y = ScrH() / 4 * 3.1
			SW_HUD_Compass(veh, x, y)
			SW_HUD_DrawSpeedometer()
		end
	end

	--Make this unique. Again Ship name + Reticle
	hook.Add("HUDPaint", "SheathipedeShuttleReticle", SheathipedeShuttleReticle) -- Here you need to make the middle argument something unique again. I've set it as what the function is called. Could be anything. And the final arguement should be the function just made.
end