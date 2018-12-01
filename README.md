# almsFO4Fallrim
This script smooths the usage of [FallrimTools](https://www.nexusmods.com/fallout4/mods/22633?tab=files) on Linux.

Constructive suggestions on improving the script are welcome.


## Getting Started

#### The path of things

You realy need to change location path of your savegames and the downloaded Falrim.
This can be done by changing the lines:
```bash
fo4savepath="NEEDTOBECHANGED"
```
and:
```bash
fallrimpath="NEEDTOBECHANGED"
```
I put comments in the file with an example of path for this variables. Be cool that you can use paths with spaces by all the means.

On my system, I've made symbolic links for the savegame folder and also for the Fallout 4 .ini files folder. Separete partition, easing things to [Loot](https://loot.github.io/) and [Vortex](https://www.nexusmods.com/site/mods/1?tab=description), and stuff... But this isn't realy necessary, you can point direct to the original folder on your Steam Library.  Originally it must be on:
```bash
<SteamLibraryLocation>/steamapps/compatdata/377160/pfx/drive_c/users/steamuser/My Documents/My Games/Fallout4
```
Obviously the ``` bash <SteamLibraryLocation>``` must be changed to the actual Steam Library location on your system.

The script checks if you already changed the necessary paths.

#### Access from anywhere

This script has an option to add itself as an alias in the ```bash~/.profile```. So it can be called, from any terminal, as:
```bash
fallrim
```
This option must need reload the ~/.profile through the terminal:
```bash
source ~/.profile
```
Or logoff/login on your system account.

## Usefull links
(Yep, I easelly forget things so...)

* [Java 8 on Ubuntu](http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html) - Tutorial on how to install Java 8 on Ubuntu
* [FallrimTools](https://www.nexusmods.com/fallout4/mods/22633?tab=files) - Download Fallrim

* [f4se](https://f4se.silverlock.org/) - Download f4se

* [f4se on Proton](https://www.reddit.com/r/wine_gaming/comments/9uk36c/fallout_4_how_to_get_fallout_4_script_extender/) - Tutorial on how to use f4se on Steam Proton

* [Fallout 4 issues](https://github.com/ValveSoftware/Proton/issues/308) - Github page

* [Fallout 4 Protondb](https://www.protondb.com/app/377160) - Protondb page


## Acknowledgments
My english is a work in progress, as a ton of things that I want to do. And I'm not growing youngger... :worried::stuck_out_tongue_winking_eye:
