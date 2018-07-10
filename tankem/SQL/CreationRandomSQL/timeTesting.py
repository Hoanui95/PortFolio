import random
import time

glo = 1000

def strTimeProp(start, end, format, prop):
    """Get a time at a proportion of a range of two formatted times.

    start and end should be strings specifying times formated in the
    given format (strftime-style), giving an interval [start, end].
    prop specifies how a proportion of the interval to be taken after
    start.  The returned time will be in the specified format.
    """

    stime = time.mktime(time.strptime(start, format))
    etime = time.mktime(time.strptime(end, format))
    stime = 0  
    etime = 0
    ptime = stime + prop * (etime - stime)

    return time.strftime(format, time.localtime(ptime))


def randomDate(start, end, prop):
    return strTimeProp(start, end, '%Y/%m/%d %H:%M:%S', prop)

if __name__ == "__main__":
    temp = (randomDate("2008/1/1 1:30:00", "2008/1/1 1:30:00", random.random()))
    
    print(temp)
    #print(randomDate(temp, temp, random.random()))