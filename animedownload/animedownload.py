import json
import os
import subprocess

torrent_link_shell = os.popen("zenity --entry --title='Anime Download and Encode' --text='Enter torrent link'")
torrent_link = torrent_link_shell.read().strip()

torrent_folder_shell = os.popen('zenity --file-selection --directory --title="Select destination folder"')
torrent_folder = torrent_folder_shell.read().strip()

torrent_info_script = os.popen('sh /home/ballas/animedownload/detail.sh "{}"'.format(torrent_link))
torrent_name_dict = json.loads(torrent_info_script.read().strip())
torrent_name = torrent_name_dict["name"]

torrent_download = subprocess.run('sh /home/ballas/animedownload/download.sh "{}" "{}"'.format(torrent_link, torrent_folder), shell=True)

torrent_path = torrent_folder + "/" + torrent_name

torrent_encode = subprocess.run('sh /home/ballas/animedownload/encode.sh "{}"'.format(torrent_path), shell=True)
