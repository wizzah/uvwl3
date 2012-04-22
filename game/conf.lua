--all configuration options
function love.conf(g)
	--identifying
	g.author = "Frenjamin Banklin"
	g.title = "GAME TIME YEAH"
	g.version = "0.8.0" -- Love2D version
	
	--graphical
	g.modules.graphics = true
	g.modules.image = true
	g.screen.fsaa = 0
	g.screen.fullscreen = false
	g.screen.height = 600
	g.screen.width = 800
	
	--control
	g.modules.joystick = false
	g.modules.keyboard = true
	g.modules.mouse = true

	--etc.
	g.console = false
	g.identity = nil
	g.release = false
	g.modules.audio = true
	g.modules.sound = true
	g.modules.event = true
	g.modules.physics = true
	g.modules.timer = true
end