import urllib2
import json
import datetime
import os.path, time
from os.path import expanduser

#market options: en-US, zh-CN, ja-JP, en-AU, en-UK, de-DE, en-NZ
market = 'pt-BR'
resolution = '1920x1080'
baseDirectory= expanduser("~") +'/Pictures/Wallpapers/'
old = 'Old/'
wallpaperName = 'wallpaper.jpg'

loop_value = 1
while (loop_value == 1):
    try:
		urllib2.urlopen("http://google.com")
    except urllib2.URLError, e:
		time.sleep( 10 )
    else:
		loop_value = 0

		response = urllib2.urlopen("http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=" + market)
		obj = json.load(response)
		url = (obj['images'][0]['urlbase'])
		url = 'http://www.bing.com' + url + '_' + resolution + '.jpg'
		name = url[url.rfind('/')+1:]

		if not os.path.exists(baseDirectory+old): 
			os.makedirs(baseDirectory+old)
		path = baseDirectory + old + name

		if os.path.exists(path):
			todayDate = datetime.datetime.now().strftime("%m/%d/%Y")
			fileDate = time.strftime('%m/%d/%Y', time.gmtime(os.path.getmtime(path)))
			if todayDate == fileDate:
				print "You already have today's Bing image"
			else:
				print ("Downloading Bing wallpaper to %s" % (path))
				f = open(path, 'w')
				bingpic = urllib2.urlopen(url)
				f.write(bingpic.read())
		else:
			print ("Downloading Bing wallpaper to %s" % (path))
			f = open(path, 'w')
			bingpic = urllib2.urlopen(url)
			f.write(bingpic.read())
			os.remove(baseDirectory+wallpaperName)
			os.symlink(path, baseDirectory+wallpaperName)
