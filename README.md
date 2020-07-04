# RadarDiscovery

Simple command line tool to send inquiry messages on the NavNet discovery channel of 172.31.255.255:2011.

## Building 

To create a command line tool, called radar, run

mix escript.build

If the account has permission to write into /usr/local/bin the compiled executable, radar, will be writting there and typically then be available to run from the command line.


## Testing
To run unit test run

mix test


## Usage
radar discover    Discover radars on NavNet

radar help        Display help message


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/radar_discovery](https://hexdocs.pm/radar_discovery).

