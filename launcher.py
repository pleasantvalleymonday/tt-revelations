import direct.directbase.DirectStart
from pandac.PandaModules import loadPrcFile
loadPrcFile('dependencies/config/general.prc')
loadPrcFile('dependencies/config/release/dev.prc')
from panda3d.core import TransparencyAttrib
from direct.gui.DirectGui import *
from panda3d.core import *
from direct.gui.OnscreenText import OnscreenText 
from pandac.PandaModules import Vec3
from direct.task import Task
import urllib2
import socket
import sys
import hashlib
import os

background=OnscreenImage(image = 'resources/phase_3/maps/background.jpg', pos = (0, 0, 0),parent=render2d)
background.setTransparency(TransparencyAttrib.MAlpha)

logo=OnscreenImage(image = 'resources/phase_3/maps/toontown-logo.png', pos = (0, 0, 0),parent=render2d)
logo.setTransparency(TransparencyAttrib.MAlpha)
logo.setScale(0.5)

buttonup=OnscreenImage(image = 'resources/launcher/Button_Up.png', pos = (0, 0, 0))
buttonup.setTransparency(TransparencyAttrib.MAlpha)
buttonup.setScale(0.0)

buttondown=OnscreenImage(image = 'resources/launcher/Button_Down.png', pos = (0, 0, 0))
buttondown.setTransparency(TransparencyAttrib.MAlpha)
buttondown.setScale(0.0)

username = None
password = None

#callback function to set  text 
def setUsername(textEntered):
    global username
    user__t.hide()
    user_b.hide()
    #pass__t.show()
    #pass_b.show()
    play_b.show()
    username = textEntered


'''def setPassword(textEntered):
    global password
    user__t.hide()
    user_b.hide()
    pass__t.hide()
    pass_b.hide()
    play_b.show()
    password = textEntered'''



 
#add button
user_b = DirectEntry(text = "" ,scale=.05,command=setUsername,pos = (-0.83,0,0.57), numLines = 1,width=15)
#pass_b = DirectEntry(text = "" ,scale=.05,command=setPassword,pos = (-0.83,0,0.57), numLines = 1,width=15,obscured=1)

#add text
user_t = TextNode('user')
user_t.setText("Username:")
user__t = aspect2d.attachNewNode(user_t)
user__t.setScale(0.07)
user__t.setPos(-1.20,0,0.575)
user_t.setShadow(0.10, 0.10)
user_t.setShadowColor(0, 0, 0, 1)


'''pass_t = TextNode('pass')
pass_t.setText("Password:")
pass__t = aspect2d.attachNewNode(pass_t)
pass__t.setScale(0.07)
pass__t.setPos(-1.20,0,0.575)
pass_t.setShadow(0.10, 0.10)
pass_t.setShadowColor(0, 0, 0, 1)
pass__t.hide()
pass_b.hide()'''

def launch():
    
    #setup_login = urllib2.urlopen('http://cog-nation.net/api/login.php?u='+username+'&p='+password+'').read()
    print username
    print password
    os.environ['launcher'] = str(os.getpid())
    gameserver = '174.105.247.146'
    launchfile = open("launchfile.bat", "w")
    
    launchfile.write("set TTJ_GAMESERVER= 149.56.46.134\n")

    launchfile.write("set TTJ_PLAYCOOKIE=%s\n"%username)
    
    launchfile.write("\"C:\Panda3D-1.10.0\python\ppython.exe\" -m toontown.toonbase.ToontownStart\n")
    
    launchfile.write("del launchfile.bat")

    launchfile.close()
    os.system("launchfile.bat")
    sys.exit()
    

    #['AccessLevel','ban','bodytype','suittype','firstlogin','lastloginip']


#play_b = DirectButton(text = ("PLAY"), scale=.15, text_bg=(1,0,0,1),pos = (.63,0,.54),command=launch)

play_b = DirectButton(frameSize=None, text='', image=(buttonup,buttondown,buttonup), relief=None, command=launch,  text_pos=(0, -0.015), \
geom=None, pad=(0.01, 0.01), suppressKeys=0, pos = (0.94, 0, 0.68), text_scale=0.059999999999999998,  borderWidth=(0.015, 0.01), scale=0.34)
#play_b.hprInterval(.5,Vec3(360,0,0)).loop()
play_b.hide()

run()
