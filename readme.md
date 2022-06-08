##Fake aws cnfiguration

The network configuration needs to be same as the one used in sns as in the script `exec.sh`

Run `aws configure` and add the following fakes credentials ony if you are't using anyone elses credentials

|Name                        |credentials                               |
|----------------------------|:----------------------------------------:|
|AWS Access Key ID [None]    | AKIAI44QH8DHBEXAMPLE                     |
|AWS Secret Access Key [None]| je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY |
|Default region name [None]  | us-east-1                                |
|Default output format [None]| json                                     |

If you have the makefile installed, you can run `make run` and it will create the container and run the script `exec.sh`

Please see the script `exec.sh`
Observable: await server initalization to run the script
