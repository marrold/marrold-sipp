# marrold-sipp

marrold-sipp is a basic docker image containing the [SIPp](https://github.com/SIPp/sipp/tree/master/sipp_scenarios) binary - a SIP protocol test tool. 

## Info

The image is based on [debian:buster-slim](https://hub.docker.com/_/debian) and the current SIPp version is 3.6.1. SIPp has been compiled with all features, i.e with GSL, PCAP, SSL and SCTP support.

The image is currently only available for the `amd64` architecture.

## Example Usage

The intended usage is to mount a directory of SIPp scenarios (XML Files) and then execute a bash shell to run your tests:

`docker run -it -v ~/sipp-scenarios/:/opt marrold/marrold-sipp bash`

For UAS scenarios you may wish to expose port 5060:

`docker run -it -p 5060:5060/udp -v ~/sipp-scenarios/:/opt marrold/marrold-sipp bash`

Or use host networking:

`docker run -it --network host -v ~/sipp-scenarios/:/opt marrold/marrold-sipp bash`

## License

This Dockerfile is licensed under the terms of the _MIT license_. For other dependencies such as SIPp and OpenSSL, please see their relevant licenses.
