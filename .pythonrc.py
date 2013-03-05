import sys
import os
from pprint import pprint
import atexit
import rlcompleter
from tempfile import mkstemp
from code import InteractiveConsole
try:
	import requests
except ImportError:
	print("Unable to import requests")
try:
	import readline
except ImportError:
	print("Unable to import readline")

historyFile = os.path.expanduser("~/.pyhistory")
if not os.path.exists(historyFile) and not os.path.isfile(historyFile):
	try:
		open(historyFile, "wb").close()
	except:
		pass

if "readline" in sys.modules and os.access(historyFile, 2):
	atexit.register(readline.write_history_file, historyFile)
	readline.parse_and_bind("tab: complete")

# Python Console with an editable buffer.
# Stolen/Edited from https://github.com/whiteinge/dotfiles/blob/master/.pythonrc.py
EDITOR = os.environ.get('EDITOR', 'vim')
EDIT_CMD = '\e'
class EditableBufferInteractiveConsole(InteractiveConsole):
	def __init__(self, *args, **kwargs):
		self.last_buffer = [] # This holds the last executed statement
		InteractiveConsole.__init__(self, *args, **kwargs)

	def runsource(self, source, *args):
		self.last_buffer = [ source.encode('utf-8') ]
		return InteractiveConsole.runsource(self, source, *args)

	def raw_input(self, *args):
		line = InteractiveConsole.raw_input(self, *args)
		if line == EDIT_CMD:
			fd, tmpfl = mkstemp('.py')
			os.write(fd, b'\n'.join(self.last_buffer))
			os.close(fd)
			os.system('{0} {1}'.format(EDITOR, tmpfl))
			line = open(tmpfl).read()
			os.unlink(tmpfl)
			tmpfl = ''
			lines = line.split('\n')
			for i in range(len(lines) - 1): self.push( lines[i] )
			line = lines[-1]
		return line
c = EditableBufferInteractiveConsole(locals=locals())
c.interact(banner="Type \e to get an external editor.")
# Nothing past here kthnx
