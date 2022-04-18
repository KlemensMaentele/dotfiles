from ranger.api.commands import *
import subprocess

class update_wallpaper(Command):
    """
    :update_wallpaper
    Create systemlink to ~/Pictures/wall/wall.png and update
    """
    def execute(self):
        subprocess.check_call(['updatewall', self.fm.thisfile.path ])
class trash(Command):
    """
    :trash
    Use trash script
    """
    def execute(self):
        subprocess.check_call(['trash', self.fm.thisfile.path ])
class untrash(Command):                                                   
    """
    :untrash
    Use untrash script
    """
    def execute(self):
        subprocess.check_call(['untrash', self.fm.thisfile.basename ])
