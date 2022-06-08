##Fake aws cnfiguration

The network configuration needs to be same as the one used in sns as in the script `exec.sh`

run `aws configure` and add the following fakes credentials
AWS Access Key ID [None]: AKIAI44QH8DHBEXAMPLE
AWS Secret Access Key [None]: je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
Default region name [None]: us-east-1
Default output format [None]: json

if you have the makefile installed, you can run `make run` and it will create the container and run the script `exec.sh`

Please see the script `exec.sh`
Observable: await server initalization to run the script
