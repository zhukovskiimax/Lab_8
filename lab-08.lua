lgi = require 'lgi'

glib = lgi.GLib 

gtk = lgi.Gtk
gtk.init()

red = require 'redis'
cli = red.connect('127.0.0.1', 6379)

t=0
function on_timer()
    t = t + 0.1
    alpharii    = 50 + math.cos(t) * 25
    omegon      = 50 + math.sin(t) * 25
    cli:set('alpharii',alpharii)
    cli:set('omegon',omegon)
   
    glib.timeout_add(glib.PRIORITY_DEFAULT,10, on_timer)
end

on_timer();

gtk.main()
  
