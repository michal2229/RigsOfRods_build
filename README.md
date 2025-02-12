# RigsOfRods_build
First install some compiler (you can specify it in build_all.sh script) and CMake. Then Cg Toolkit (needed for rendering materials, the game is mostly gray without it) - if your system is not compatible with the packages in data/deps_system, just take the tar and place binaries/libs/headers/etc to some general system paths for your distro - there are high chances it could work (I managed to install the RedHat rpm on OpenSuse Tumbleweed using the system installer with no problem). 
Then run the commands:
```
git clone https://github.com/michal2229/RigsOfRods_build.git --recursive  # clone the repo
cd RigsOfRods_build/  # go to repo dir
./build_all.sh  # build stuff
./rigs-of-rods/build/bin/RoR  # launch game
```
You should have the game running with some mods installed. I modified ror-dependencies to make building more seamless. I also improved force feedback a little (I think... I need to test a bit more, but it looks good so far - TODO: maybe upstream).

Note: ogre or ois installed in your system might trouble CMake. The first could break pagedgeometry, so that it won't link properly with RoR, the second could break your force feedback.
