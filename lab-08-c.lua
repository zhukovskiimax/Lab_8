lgi = require 'lgi'

glib = lgi.GLib

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-08.glade')

red = require 'redis'
cli = red.connect('127.0.0.1', 6379)


ui = bld.objects



function ui.area:on_draw(cr)
  cr:set_source_rgb(1, 1, 1)
  cr:paint()
  
  alpharii = cli:get('alpharii')
  omegon = cli:get('omegon')
      cr:set_source_rgb(0,  0, 0)
      cr:rectangle(alpharii, omegon, 100,100)
      cr:fill()
  
  return true
end

t=0
function on_timer()
     ui.area:queue_draw()
    glib.timeout_add(glib.PRIORITY_DEFAULT,10, on_timer)
end

on_timer();

function ui.window:on_destroy(...)
  gtk.main_quit()
  end

ui.window.title = 'lab-08'
ui.window:show_all()

gtk.main()
  
