require("turtle")
local chartmap = require("chartmap")
local colormap = require("colormap")
local complex  = require("complex")
local common   = require("common")
local signals  = require("signals")

local  W,  H = 800, 800
local greyLevel  = 200
local minX, maxX = -20, 20
local minY, maxY = -20, 20
local dX, dY, xySize = 1, 1, 3
local clBlu = colr(colormap.getColorBlueRGB())
local clRed = colr(colormap.getColorRedRGB())
local clBlk = colr(colormap.getColorBlackRGB())
local clGry = colr(colormap.getColorPadRGB(greyLevel))
local clMgn = colr(colormap.getColorMagenRGB())
local clGrn = colr(colormap.getColorGreenRGB())
local clCya = colr(colormap.getColorCyanRGB())
local intX  = chartmap.New("interval","WinX", minX, maxX, 0, W)
local intY  = chartmap.New("interval","WinY", minY, maxY, H, 0)
local scOpe = chartmap.New("scope"):setBorder(minX, maxX, minY, maxY)
      scOpe:setSize(W, H):setColor(clBlk, clGry):setInterval(intX, intY):setDelta(dX, dY)

local c1 = complex.getNew(-15,-15)
local c2 = complex.getNew( -5,  5)
local c3 = complex.getNew( -1, 8)
local c4 = complex.getNew(  1, -8)
local c5 = complex.getNew(  5, -5)
local c6 = complex.getNew( 15, 15)
local tc = {c1,c2,c3,c4,c5,c6,["*"]=25}

local tC = complex.getCatmullRomCurve(tc,0.1)

open("Complex Catmull Rom curve demo")
size(W, H)
zero(0, 0)
updt(false) -- disable auto updates

scOpe:Draw(true, true, true):setSizeVtx(5)
for i = 1, #tc do
  scOpe:drawComplexText(tc[i], "   {"..i.."}", true)
  scOpe:drawComplexPoint(tc[i], clMgn)
end

scOpe:setSizeVtx(2)
for i = 1, (#tC-1) do
  scOpe:drawComplexLine(tC[i+1],tC[i])
  updt(); wait(0.03)
end

wait()
