import math

class Helper(object):
    def getAngledPoint(angle,longueur,cx,cy):
        x = (math.cos(angle)*longueur)+cx
        y = (math.sin(angle)*longueur)+cy
        return (x,y)
    getAngledPoint = staticmethod(getAngledPoint)
    
    def calcAngle(x1,y1,x2,y2):
         dx = x2-x1
         dy = y2-y1
         #angle = (math.atan2(dy,dx) % (2*math.pi)) * (180/math.pi)
         angle = (math.atan2(dy,dx) ) #% (2*math.pi)) * (180/math.pi)
         return angle
    calcAngle = staticmethod(calcAngle)
    
    def calcDistance(x1,y1,x2,y2):
         dx = abs(x2-x1)**2
         dy = abs(y2-y1)**2
         distance=math.sqrt(dx+dy)
         return distance
    calcDistance = staticmethod(calcDistance)
	
    def getAngledImage(folderpath,imagepath,angle):
        deg = int(math.degrees(angle))
        #Contrer le offset de 90 degres (
        if deg < 0:
            deg = 360+deg  
        angle = 360-(deg + 90)        
        if angle < 0:
            angle = 360-(0-angle)               
        #Str selon les dizaines
        if angle < 10:
            strAngle = "00"+str(angle)+".png"
        elif angle < 100:
            strAngle = "0"+str(angle)+".png"
        else:
            strAngle = str(angle)+".png"
        
        return folderpath+imagepath+strAngle
    getAngledImage = staticmethod(getAngledImage)