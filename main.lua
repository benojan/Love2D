function love.load() --游戏开始被调用
	player = { x=0, y=0, speed=1000, img=nil}
	player.img = love.graphics.newImage('皮卡丘.png')
	love.graphics.setBackgroundColor(255,255,255)
end

function love.update(dt)
	if love.keyboard.isDown('escape') then --quitGame
		love.event.push('quit')
	end
	if love.keyboard.isDown('left','a') then --moveLeft
		player.x = player.x - (player.speed*dt)
		if player.x < 0 then
			player.x = 0
		end
	elseif love.keyboard.isDown('right','d') then --moveRight
		player.x = player.x + (player.speed * dt)
		if player.x > (love.graphics.getWidth() - player.img:getWidth() ) then
			player.x = love.graphics.getWidth() - player.img:getWidth()
		end
	end
end

function love.draw() --每一帧渲染画面时回调函数
	love.graphics.draw(player.img, player.x, player.y)
end

function love.keypressed(key)
	
end

function love.keypressed(key)

end
