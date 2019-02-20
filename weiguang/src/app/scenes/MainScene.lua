
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
   local bg =  display.newSprite("bj.png"):center():addTo(self)
    --加节点
    local no = display.newNode():center():addTo(self)

    cc.ui.UIPushButton.new({normal = "start1.png"}, {scale9 = true})
    :onButtonClicked(function()
    	print("button clicked")
    end)
    :addTo(no)

    --裁剪 
    local stencil = display.newSprite("start1.png")

    local light = display.newSprite("b1.png")

    local clip = cc.ClippingNode:create(stencil)

    clip:addChild(light):addTo(no)

    --移动
    local size = stencil:getContentSize()
    local sizeLight = light:getContentSize()
    light:pos(-size.width/2 - sizeLight.width,0)
    light:runAction(cc.RepeatForever:create(cc.Sequence:create(
         cc.MoveTo:create(6, cc.p(size.width/2 + sizeLight.width,0)),

         cc.Place:create(cc.p(-size.width/2 - sizeLight.width,0)),

         cc.DelayTime:create(1)
    	)))
          

    local action = cc.BezierBy:create(3, {cc.p(display.right*1/3, display.height/2), 
       cc.p(display.right*2/3, display.height*1/3), cc.p(100, 200) })

    no:runAction(action)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
