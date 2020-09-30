# AutoGDM

<img align="left" src="https://github.com/Duisterhof/AutoGDM/blob/master/logo.png">

AutoGDM is an automated gas dispersion modelling (GDM) pipeline aimed at robotics research. The pipeline takes binary topview images as input and computes a 3D gas concentration map. It uses the ROS [GADEN](https://github.com/MAPIRlab/gaden) package as a filament simulator, and [OpenFOAM](https://www.openfoam.com/) CFD to generate a 3D flow field. 

## Installation Instructions
_Note: AutoGDM was tested on Ubuntu 18.04_

	git clone 

#### Download the repository
Download/clone the repository.
    
    git clone https://github.com/coppolam/swarmulator.git
    cd swarmulator
    
#### Packages Required
Swarmulator runs using OpenGL and XML parsing.
You will need the following packages. Run the following to make sure you have everything you need, installed in order:

    sudo apt-get install freeglut3-dev
    sudo apt-get install libxerces-c-dev
    sudo apt-get install xsdcxx
    sudo apt-get install libeigen3-dev
    sudo apt-get install libprotobuf-dev
    sudo apt-get install xmlstarlet

#### Build instructions
Once you have all the packages needed to build Swarmulator, you can build it with:

	make clean && make ANIMATION=ON LOGGER=ON VERBOSE=ON

If you don't want the animation, just don't type the `ANIMATION=ON` part, same for `LOGGER`, which logs data, or `VERBOSE` which outputs information to the console

Swarmulator is designed to be modular, so that you can compile for any combination of controller and robot dynamics that you wish. By default, the `aggregation` controller and the `particle` agent will be used. To use another one, speficity this in the make command, as follows:

    make clean && make CONTROLLER=<yourcontrollername> AGENT=<youragentname> ANIMATION=ON

for example, try out:

    make clean && make CONTROLLER=boid AGENT=particle_oriented ANIMATION=ON

To find which agents and controllers are available in the branch, check the folders `sw/simulation/controllers` and `sw/simulation/agents`. See the next section "Prototyping with Swarmulator" for instructions on how to make your own!

(Pro tip: If you want it to build fast, use `make -j` instead of just `make`, but this will take up more memory. On a virtual machine, where memory is limited, using `-j` may cause it to fail to build.)

#### Extra: Generate the doxygen documetation
Swarmulator was commented using the doxygen format. To generate the doxygen documentation, use

    doxygen doxyfile

And access the documentation using

    xdg-open docs/html/index.html 

## Running Swarmulator
Swarmulator can be launched from the terminal. To run Swarmulator, use the following command: 

    .\swarmulator <nagents>

Where <nagents> is the number of agents you would like to have at the start of the simulation.
    .\swarmulator 10

#### Setting up the runtime parameters
Swarmulator uses a configuration file called `parameters.xml` in order to load run-time parameters. These are loaded when Swarmulator starts, without having to re-build!

`parameters.xml` is to be found in in the `conf` folder.

Here you can edit all the run-time parameters. The standard ones are described below.
In the next sub-section, you can find out how to make your own!

* `simulation_updatefreq`: Refresh-rate of the simulation (Hz)
* `simulation_realtimefactor`: Simulation real-time factor. The higher the faster, up to whatever your computer can handle, since eventually the mutex synchronization will win, which is particularly relavant for large numbers of robots.
* `time_limit`: The time limit of simulated time after which the simulator will quit. If set to 0, then the simulation won't quit until you make it quit.

* `environment`: The environment that the robots operate in (essentially defining the walls).
Use `square` for a standard squared room, or leave it empty for a boundless environment.
For a randomly generated environment, use `random`. You can always make your own enviromment by defining it and placing it in `conf/environments`.

* `window_width`: Height of the animation window (in pixels)
* `window_height`: Width of the animation window (in pixels)
* `scale`: Scale of the agents drawn in the animation window
* `mouse_drag_speed`: Sensitivity of the mouse during drag-and-drop actions. Use 1.0 for a 1 to 1 feel.
* `mouse_zoom_speed`: Sensitivity of zoom function to motion of the scroll wheel.
* `animation_updatefreq`: Frame-rate of the animation.

* `logger_updatefreq`: Log-rate. If the logger thread is activated, then this will create a text log at the indicated rate (with respect to the simulation time).

* `policy` : This is the (relative) path to a file that holds the specifics of a policy (if your controller needs one, else it's not relevant). For instance, it can be a txt file holding the probability of doing something, or the weights of a neural network.
* `fitness`: This specifies the fitness function that would like to use (if relevant to your application). Please see the file for the current options ```sw/simulation/fitness_functions.h```, and feel free to implement your own!
    To use it, specify the name of the fitness function. For instance
    ```<fitness>aggregation_clusters</fitness>``` will measure how aggregated the swarm is.

#### Adding your own additional runtime parameters
It is possible to easily add your own runtime parameter to Swarmulator.
This can be done into three quick steps.
1. Open `conf/parameters.xsd`. Here you declare the new parameter as an additional XSD element.
        ```<xs:element name="parameter_name" type="xs:parameter_type"/>```
2. Open `conf/parameters.xml`. Here you define the value of the parameter to be read at runtime.
       ```<new_parameter_name>default value</new_parameter_name>```
That's it! Now you use the parameter anywhere in the code by calling `param->new_parameter_name()`.

#### Interactive user commands when using the animation
You can interact with Swarmulator in real time through the animation window. It is possible to intuitively move and zoom within the animation using drag-and-drop and your mouse's scroll wheel. 

Additionally, there are a number of keyboard commands for the following:
* Add a new agent (`a`). This can be done by pressing the `a`, at which point a new agent will be created at the location pointed by the mouse cursor.
* Pause (`p`). The simulation can be paused by pressing the `p` key.
* Resume (`r`, note: it only works after pausing by pressing `p`). Resume the simulation.
* Step-through (`s`, note: it only works after pausing by pressing `p`). This will run the simulation for a very small time step and then pause. It can be pressed repeatedly to slowly step through the simulation.
* Toggle real-time factor (`m`). Toggle the realtime factor between the value specified in `conf/parameters.xml` and `1`. This allows you analyze the swarm in the animation.
* Quit (`q`). This will quit Swarmulator.

## Prototyping with Swarmulator
Swarmulator is built for quick prototyping, making it simple to switch out different controllers and agents in the swarm.
The controller and agent in use are defined in `sw/settings.h`.
Using this approach, you can quickly switch out different controllers and then recompile the code.

#### Using your own controller
All controllers must be a child of the class `Controller`, to be found at `sw/simulation/controller.cpp`. 
You can define a controller as a child class of `Controller`, and then define that you want to use it in `sw/settings.h`.
You can look at the controllers in `sw/simulation/controllers/...` for examples.
You can use the functions in `OmniscientObserver` in order to simulate the sensing of other agents as you see fit.

The bash script found in `scripts/make_new_controller.sh` will create an empty controller for you, ready for use!
You can run it as follows:

    cd scripts
    ./make_new_controller.sh myawesomenewcontroller


#### Using your agent dynamics
All agents must be a child of the class `Agent`, to be found at `sw/simulation/agent.cpp`. 
You can define an agent as a child class of `Agent`, and, as for controllers, define that you want to use it in `sw/settings.h`.
You can look at the controllers in `sw/simulation/agents/...` for examples of agents, where you can declare the dynamics of the agents.

The bash script found in `scripts/make_new_agent.sh` will create an empty controller for you, ready for use!
You can run it as follows:

    cd scripts
    ./make_new_agent.sh myawesomenewagent

# Using Swarmulator to evolve a swarm behavior
Swarmulator was originally designed just to quickly prototype and analyze swarm behaviors.
However, thanks to its speed and ability to operate at high real time factors, it also lends itself to doing evolution of swarm controllers in a (relatively) short amount of time.

Please see the file `scripts/python/example_evolution.py` and the README file in the same folder for an example that uses evolution to evolve a policy.

# PYTORCH!
It's now possible to use Swarmulator with the PyTorch C++ library. An example controller with README instructions to set it up is avaiable in the controller `pytorch` under `sw/simulation/controllers`. Go check it out and have fun!
