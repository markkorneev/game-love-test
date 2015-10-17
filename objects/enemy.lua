enemy = {}

function enemy.load()
	enemy.img = love.graphics.newImage("sprites/enemy.png")
	enemy.x = 0
	enemy.y = 0
	enemy.sp = 100
	enemy.bullets = {}
	enemy.cd = 10
end

function enemy.draw()
	love.graphics.draw(enemy.img, enemy.x, enemy.y)
end

-- Movement
function enemy.move(dt)

end

-- Fire
function enemy:shoot(dt)
	if self.cd <= 0 then
		self.cd = 10
		bullet = {}
		bullet.x = self.x + 95
		bullet.y = self.y
		bullet.sp = 1000
		table.insert(self.bullets, bullet)
	end
end

function UPDATE_ENEMY(dt)
	enemy.cd = enemy.cd - 1

end

function DRAW_ENEMY()
	enemy.draw()
end