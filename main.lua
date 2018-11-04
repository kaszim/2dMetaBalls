balls = {}

function love.load()
	ball = love.graphics.newImage("ball.png")
  shader = love.graphics.newShader("shader.glsl")
	shader2 = love.graphics.newShader("shader2.glsl")
	canvas = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())
	canvas2 = love.graphics.newCanvas(love.graphics.getWidth(), love.graphics.getHeight())

	for i=1, 100 do
		local dirx = math.random(0,1)
		if(dirx == 1) then
			dirx = -1
		else
			dirx = 1
		end

		local diry = math.random(0,1)
		if(diry == 1) then
			diry = -1
		else
			diry = 1
		end

		table.insert(balls, {
			pos = {x = math.random(0,600), y = math.random(0,500)},
			vel = {x = math.random(30,100)*dirx, y = math.random(30,100)*diry},
			scale = math.random(0.7, 1.2),
			color = {r = math.random(0, 255), g = math.random(0, 255), b = math.random(0, 255)}
		})
	end
	--love.graphics.setBlendMode("multiply")
end

function love.update(dt)
	for i=1, #balls do
		balls[i].pos.x = balls[i].pos.x + balls[i].vel.x * dt
		balls[i].pos.y = balls[i].pos.y + balls[i].vel.y * dt

		if(balls[i].pos.x + 150 * balls[i].scale > love.graphics.getWidth()) then
			balls[i].vel.x = balls[i].vel.x * -1
		end
		if(balls[i].pos.x + 50 * balls[i].scale < 0) then
			balls[i].vel.x = balls[i].vel.x * -1
		end

		if(balls[i].pos.y + 150 * balls[i].scale > love.graphics.getHeight()) then
			balls[i].vel.y = balls[i].vel.y * -1
		end
		if(balls[i].pos.y + 50 * balls[i].scale < 0) then
			balls[i].vel.y = balls[i].vel.y * -1
		end
	end
end

function love.draw()
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.clear()
	love.graphics.setShader()

	love.graphics.setCanvas(canvas)
	love.graphics.clear()

	for i=1, #balls do
		love.graphics.setColor(balls[i].color.r, balls[i].color.g, balls[i].color.b)
		love.graphics.draw(ball, balls[i].pos.x, balls[i].pos.y, 0, balls[i].scale)
	end

	love.graphics.setCanvas(canvas2)
	love.graphics.clear()

	love.graphics.setShader(shader2)
	love.graphics.draw(canvas)
	love.graphics.setShader()

	love.graphics.setCanvas()
	love.graphics.setShader(shader)
	love.graphics.draw(canvas2)
	love.graphics.setShader()
	love.graphics.setColor(0, 255, 0, 255)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
end
