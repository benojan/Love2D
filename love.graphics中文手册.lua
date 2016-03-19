==配置函数==
function love.conf(t)
    t.identity = nil                    -- The name of the save directory (string)
    t.version = "0.10.1"                -- 游戏使用的LÖVE引擎版本 (string)
    t.console = false                   -- Attach a console (boolean, Windows only)
    t.accelerometerjoystick = true      -- Enable the accelerometer on iOS and Android by exposing it as a Joystick (boolean)
    t.externalstorage = false           -- True to save files (and read from the save directory) in external storage on Android (boolean) 
    t.gammacorrect = false              -- Enable gamma-correct rendering, when supported by the system (boolean)
 
    t.window.title = "Untitled"         -- 窗口标题 (string)
    t.window.icon = nil                 -- 窗口图标的文件路径 (string)
    t.window.width = 800                -- 窗口宽度 (number)
    t.window.height = 600               -- 窗口高度 (number)
    t.window.borderless = false         -- Remove all border visuals from the window (boolean)
    t.window.resizable = false          -- 设置窗口是否可调整 (boolean)
    t.window.minwidth = 1               -- 窗口最小宽度，若窗口可调整 (number)
    t.window.minheight = 1              -- 窗口最小高度，若窗口可调整 (number)
    t.window.fullscreen = false         -- 是否全屏 (boolean)
    t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
    t.window.vsync = true               -- Enable vertical sync (boolean)
    t.window.msaa = 0                   -- The number of samples to use with multi-sampled antialiasing (number)
    t.window.display = 1                -- Index of the monitor to show the window in (number)
    t.window.highdpi = false            -- Enable high-dpi mode for the window on a Retina display (boolean)
    t.window.x = nil                    -- The x-coordinate of the window's position in the specified display (number)
    t.window.y = nil                    -- The y-coordinate of the window's position in the specified display (number)
 
    t.modules.audio = true              -- Enable the audio module (boolean)
    t.modules.event = true              -- Enable the event module (boolean)
    t.modules.graphics = true           -- Enable the graphics module (boolean)
    t.modules.image = true              -- Enable the image module (boolean)
    t.modules.joystick = true           -- Enable the joystick module (boolean)
    t.modules.keyboard = true           -- Enable the keyboard module (boolean)
    t.modules.math = true               -- Enable the math module (boolean)
    t.modules.mouse = true              -- Enable the mouse module (boolean)
    t.modules.physics = true            -- Enable the physics module (boolean)
    t.modules.sound = true              -- Enable the sound module (boolean)
    t.modules.system = true             -- Enable the system module (boolean)
    t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
    t.modules.touch = true              -- Enable the touch module (boolean)
    t.modules.video = true              -- Enable the video module (boolean)
    t.modules.window = true             -- Enable the window module (boolean)
    t.modules.thread = true             -- Enable the thread module (boolean)
end


==绘图方法==

	弧(绘制模式:"fill"|"line",x座标,y座标,半径,起始弧度:x轴正方向为0,终止弧度:顺时针,线段数:越大则弧线越平滑)
		love.graphics.arc("fill", x, y, radius, angle1, angle2, segments )

	圆(绘制模式:"fill"|"line",圆心x座标,圆心y座标,半径,线段数:越大越平滑)
		love.graphics.circle("line", x, y, radius, segments )

	椭圆(绘制模式:"fill"|"line",圆心x坐标,圆心y坐标,宽半径(宽的一半),高半径(高的一半),线段数:越大越平滑)	
		love.graphics.ellipse("line", x, y, radiusx, radiusy )

	清除()--在love.draw之前的love.run中自动调用，或自己写love.run时被用到
		love.graphics.clear()
		love.graphics.clear(r, g, b, a ) since 0.10.0

	忽略(颜色:true|false,模板:true|false)

	画(物体:图片|画布|精灵组|粒子系统|网格,x座标,y座标,旋转弧度,x轴缩放,y轴缩放,x轴原点偏移值,y轴原点偏移值,x轴剪切系数,y轴剪切系数)

	画(材质:图片|画布,四边形,x轴,y轴,旋转弧度,x轴缩放,y轴缩放,x轴原点偏移值,y轴原点偏移值,x轴剪切系数,y轴剪切系数)
		love.graphics.draw(drawable, x, y, rotation, scaleX, scaleY, originX, originY, kx, ky )
		love.graphics.draw(texture, quad, x, y, math.rad(90), sx, sy, ox, oy, kx, ky )

	线(x座标1,y座标1,x座标2,y座标2, ... )
		--参数可以用table
		love.graphics.draw(200,50,400,50, ...)
		love.graphics.draw(points)

	点(x座标, y座标, ... )
		--参数可以用table
		love.graphics.points(x1, y1, x2, y2, ... )

	多边形(绘制模式, ... )
		--参数可以用table存放所有顶点，再传入
		love.graphics.polygon("fill", ... )

	呈现()--只有在自己写love.run方法时被用到
		love.graphics.present()

	打印(文本,x座标,y座标,旋转弧度,x轴缩放,y轴缩放,x轴原点偏移值,y轴原点偏移值,x轴剪切系数,y轴剪切系数)
		love.graphics.print("Hello World!", 150, 120, math.pi/3, 1, 1, 100, 100 )

	格式打印(文本,x座标,y座标,行最多像素（若小于1个单词，则显示1个单词）,对齐方式:"left"|"right"|"center"|"justify"左右对齐)
		love.graphics.printf("Hello World!", 150, 120, 75, "left" )

	矩形(绘制模式:"fill"|"line",x座标,y座标,宽,高)
		love.graphics.rectangle("line", 10, 10, 100, 100 )

==对象创建方法==

	新建画布()--创建一个窗口像素大小的画布
	新建画布(宽,高)
	*新建画布(宽,高,格式:"normal"|"rgba8"|...)
	*新建画布(宽,高,格式,多重采样反锯齿)
		canvas = love.graphics.newCanvas()
		canvas = love.graphics.newCnavas(width, height)
		canvas = love.graphics.newCanvas(width, height, format)
		canvas = love.graphics.newCanvas(width, height, format，msaa)

	新建字体(文件名, 字体大小)
	新建字体(字体大小)--使用默认字体"Vera Sans"
		font = love.graphics.newFont("anyfont.ttf", size)
		font = love.graphics.newFont(size)

	新建图片(文件名)
	新建图片(图片数据)
	新建图片(压缩的图片数据)
		image = love.graphics.newImage( filename )
		image = love.graphics.newImage( imageData )
		image = love.graphics.newImage( compressedImageData )

	新建图像字体(文件名,???)
		font = love.graphics.newImageFont(filename, glyphs)
		font = love.graphics.newImageFont(imageData, glyphs)
		font = love.graphics.newImageFont(image, glyphs)

	新建网格(顶点,纹理:图片|画布|nil无纹理,网格绘画模式:"fan"|"strip"|"triangles"|"points")
		--@参数 顶点:是一个table表，包含顶点x座标，顶点y座标,u纹理座标,v纹理座标,r,g,b,alpha
		--@参数 网格绘画模式:详见https://love2d.org/wiki/MeshDrawMode
		mesh = love.grahpics.newMesh(vertices, texture, mode)
		vertexcount = {0,0, 0,0, 255,255, 255,255}
		mesh = love.graphics.newMesh( vertexcount, texture, mode )

	新建粒子系统(纹理:图像|画布,粒子数)--用法见wiki
		system = love.graphics.newParticleSystem( texture, buffer )

	新建四边形(x座标,y座标,宽,高,图片宽,图片高)--用法见wiki
		quad = love.graphics.newQuad( x, y, width, height, sw, sh )

	新建截屏()

	新建截屏(Alpha值)--linux保存位置：~/.local/share/love
		screenshot = love.graphics.newScreenshot( )
		screenshot = love.graphics.newScreenshot( copyAlpha )

	新建着色器(代码)--详见wiki
		shader = love.graphics.newShader( code )
		shader = love.graphics.newShader( pixelcode, vertexcode )

	新建精灵组(图片,精灵数)
	新建精灵组(图片,精灵数,用法提示:"dynamic"动态|"static"静态|"stream"流)
	新建精灵组(纹理,精灵数,用法提示:"dynamic"动态|"static"静态|"stream"流)
		--详见https://love2d.org/wiki/SpriteBatchUsage
		spriteBatch = love.graphics.newSpriteBatch( image, size )
		spriteBatch = love.graphics.newSpriteBatch( image, size, usagehint )
		spriteBatch = love.graphics.newSpriteBatch( texture, size, usagehint )

	新建字体(字体,文本:nil)
		text = love.graphics.newText(font, textstring)

	新建视频(文件名,读取音频)
		video = love.graphics.newVideo(filename, loadaudio:nil)
	新建视频(视频流,读取音频)
		video = love.graphics.newVideo( videostream, loadaudio:nil)


==图形状态==

	获取背景颜色()
		--@返回 红,绿,蓝,Alpha值
		r, g, b, a = love.graphics.getBackgroundColor()

	获取混合模式()
		--@返回 混合模式
		mode = love.graphics.getBlendMode()

	获取画布()
		--@返回 画布
		canvas = love.graphics.getCanvas()

	获取画布格式()
		--@返回 画布格式是一张table表:其中key是格式名;value是boolean值
		formats = love.graphics.getCanvasFormats()

	获取颜色()
		--@返回 红,绿,蓝,Alpha值
		r, g, b, a = lvoe.graphics.getColor()

	获取颜色遮罩()
		--@返回 红,绿,蓝,Alpha值
		r, g, b, a = love.graphics.getColorMask()

	获取压缩图片的格式()
		--@返回 格式是一张table表:其中key是格式名;value是boolean值
		formats = love.graphics.getCompressedImageFormats()

	获取默认过滤器()
		--@返回 详见https://love2d.org/wiki/FilterMode
		min, mag, anisotropy = love.graphics.getDefaultFilter()

	获取字体()
		--@返回 字体
		font = love.graphics.getFont()

	获取线条连接风格()
		--@返回 线条连接风格:详见https://love2d.org/wiki/LineJoin
		join = love.graphics.getLineJoin()

	获取线条风格()
		--@返回 线条风格:"rough"|"smooth"
		style = love.graphics.getLineStyle()

	获取线条宽度()
		--@返回 宽度
		width = love.graphics.getLineWidth()

	获取点尺寸()
		--@返回 点尺寸
		size = love.graphics.getPointSize()

	获取渲染器信息()
		--@返回 名称:"OpenGL"|"OpenGL ES",版本,显卡厂商,显卡名
		name, version, vendor, device = love.graphics.getRendererInfo()

	获取剪裁框()
		--@返回 左上角x座标,左上角y座标,宽,高
		x, y, width, height = love.graphics.getScissor()

	获取渲染器()
		--@返回 渲染器
		shader=love.graphics.getShader()

	获取统计()
		--@返回 table表:性能相关的渲染统计表，详见https://love2d.org/wiki/love.graphics.getStats
		stats = love.graphics.getStats()

	获取系统上限(上限类型)
		--@返回 上限值
		--@参数 上限类型:详见https://love2d.org/wiki/GraphicsLimit
		limit = love.graphics.getSystemLimit( limittype )

	被支持(支持1:"canvas"|"shader",支持2,支持3,...)
		--详见https://love2d.org/wiki/GraphicsFeature
		--@返回 boolean值
		isSupported = love.graphics.isSupported( support1, support2, support3, ... )
		assert(love.graphics.isSupported("canvas"),"your graphics does not support canvases, sorry!")

	是线框()
		wireframe = love.graphics.isWireframe()

	重置()
		love.graphics.reset()

	设置背景颜色(红,绿,蓝)
	设置背景颜色(红,绿,蓝,Alpha值)
	设置背景颜色(table表:{r,g,b})
	设置背景颜色(table表:{r,g,b,a})
		love.graphics.setBackgroundColor( r, g, b )
		love.graphics.setBackgroundColor( r, g, b, a )
		love.graphics.setBackgroundColor( table )

	设置混合模式(混合模式)
		--参见https://love2d.org/wiki/BlendMode
		love.graphics.setBlendMode( mode )

	设置画布()--画在主屏幕上
	设置画布(画布)--画在所指定的画布上
		love.graphics.setCanvas()
		love.graphics.setCanvas( canvas1, canvas2, ... )

	设置颜色(红,绿,蓝,Alpha值)
		love.graphics.setColor(0, 255, 0, 255 )

	设置颜色遮罩(红,绿,蓝,Alpha值)
		love.graphics.setColorMask(r, g, b, a)

	设置默认过滤器(min, mag, anisotropy)
		--详见https://love2d.org/wiki/FilterMode
		love.graphics.setDefaultFilter( min, mag, anisotropy )

	设置字体(字体)
		love.graphics.setFont( font )

	设置线条连接(连接风格:"miter"斜接|"none"无|"bevel"斜面)
		--详见https://love2d.org/wiki/LineJoin
		love.graphics.setLineJoin("miter"|"none"|"bevel")

	设置线条风格(线条风格:"smooth"平滑|"rough"粗糙)
		love.graphics.setLineStyle("smooth"|"rough")( "smooth"|"rought" )

	设置线条宽度(宽度)
		love.graphics.setLineWidth( 2 )

	设置点尺寸(尺寸)
		love.graphics.setPointSize( 2 )

	设置剪裁框(左上角x座标,左上角y座标,宽,高)
		--详见https://love2d.org/wiki/love.graphics.setScissor
		--限制graphics的绘画区域，包括love.graphics.clear
		love.graphics.setScissor(0, 0, 100, 100)

	设置着色器(着色器)
	设置着色器()--禁用着色器,允许未过滤的绘画操作
		love.graphics.setShader( shader )
		love.graphics.setShader()

	设置线框(使用与否:boolean值)--只用于调试，勿作他用
		love.graphics.setWireframe( enable )

==坐标系统==

	起始()
		--重置当前坐标变换
		--详见https://love2d.org/wiki/love.graphics.origin
		love.graphics.origin()

	取出堆栈()
		--从坐标变换堆栈中取出并设为当前坐标变换
		--详见https://love2d.org/wiki/love.graphics.push
		love.graphics.pop()

	压入堆栈()
		--将当前坐标变换压入坐标变换堆栈中
		--详见https://love2d.org/wiki/love.graphics.pop

	压入堆栈( 堆栈类型："transform"|"all" )
		--@参数 堆栈类型:详见https://love2d.org/wiki/StackType
		love.graphics.push()
		love.graphics.push( stack )

	旋转(弧度)
		love.graphics.rotate()

	缩放(x坐标,y坐标)
		love.graphics.scale( sx, sy )

	剪切(剪切因子x,剪切因子y)
		--详见https://love2d.org/wiki/love.graphics.shear
		love.graphics.shear( kx, ky )

	翻转(相对x坐标,相对y坐标)
		love.graphics.translate( dx, dy )

==窗口==

	获取窗口大小()
		--@返回 宽,高
		width, height = love.graphics.getDimensions()

	获取窗口高度()
		--@返回 高
		height = love.graphics.getHeight()

	获取窗口宽度()
		--@返回 宽
		width = love.graphics.getWidth()
