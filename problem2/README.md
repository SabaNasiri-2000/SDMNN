for running My_cli.sh,first you should have cgroup-tools installed on your system,you can install it by the follwing command:<br>
sudo apt-get install cgroup-tools<br>
this packge is used to limit the memory usage of the container.<br>
My_cli.sh and ubunto 20.04 file system, which is uploaded,should be in the same directory.<br>
My_cli.sh accepts 2 inputs,the first one should be the hostname chosen by you, and the second one is the memory usage of the container which can be limited.if you are in the same directory with My_cli.sh,run it as follows:<br>
./My_cli.sh hostname memorylimit<br>
after running My_cli.sh,new bash with the chosen hostname will be executed and for every container,there will be a new directory which is the root of the container and contains file system of ubunto 20.04.<br>
name of the directory is defined by the time which container is created at.<br>
for memory limit,a new directory is created in cgroup/memory which its name is proportional to the time which container is created at.the amount of the memoey which is specified to container can be checked in here.<br>
