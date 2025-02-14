Building a REST API in Erlang
1. Install Compatible rebar3:
Ensure that you have a compatible version of rebar3 installed. In the rebar.config file, add the dependencies for Cowboy (HTTP server) and Jiffy (JSON parser).

2. Specify Source Directory:
If your Erlang source files are located in directories other than the default src, specify the paths using the src_dirs option in rebar.config.

3. Define Routing:
Configure the routing logic within app.erl to handle the incoming HTTP requests.

4. Add Release Information:
Include relx in rebar.config to specify the release information, enabling the creation of a deployable package.

5. Configuration Files:
Place the following configuration files inside the config directory:

vm.args: Contains runtime configurations for the Erlang VM, such as memory management options.
sys.config: Holds application-specific configurations.

6. Purpose of Configuration Files:

vm.args: Defines settings for the Erlang runtime environment, including memory-related configurations.
rebar.config: Instructs the compiler on dependencies, plugins, and other build-related settings.
sys.config: Provides configuration details to the application at runtime.
Create Release Package:
Execute rebar3 release to build the release package.

7. Deploying the Application:

Copy the rest_app folder from /_build/default/rel/ to the desired deployment directory.
Navigate to the deployment directory and run the application using the following commands:
./rest_app daemon: To start the application in the background.
./rest_app foreground: To start the application in the foreground for debugging purposes.
