## Create Development Machine (dev.sangah.com)

The following commands create a new machine on your computer provisioning an already existing machine with 
Docker Engine, most important it will recreate the certificate required to use Docker Engine remotely.
This is a one time operation and **should not** be done by other developers that want to use this Docker hosted machine.

From this folder run:

    $ ./create-dev-machine.sh ssh_key_without_passphrase.key 203.239.21.121 sangah121

**create-dev-machine.sh** takes the following arguments in sequence:

1. ssh key file
2. host ip
3. host name

For a detailed documentation visit the following sites:
- https://docs.docker.com/machine/reference/create/
- https://docs.docker.com/machine/drivers/generic/

**If the previous command fail it might be required to edit the sudoers file to add permission to the ssh user
to run application without the need to input the password.**

> Type the following command and add at the end ``sangah ALL=(ALL) NOPASSWD: ALL`` replacing the user with the right one.
>
>       $ sudo visudo

**In order to share this Docker machine with other developers, the certificate located inside the folder
`~/.docker/machine` have to be copied into the other developer's machine,
and edit the file `.docker/machine/machines/<MACHINE NAME>/config.json` with the correct paths.** 


## Create an Amazon EC2 Instance

In order to use this service two environment variables have to be available:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

Add the following code at the end of the file `.bashrc` located inside the user's home folder as below,
replacing the keys with the right ones:

    export AWS_ACCESS_KEY_ID=12345
    export AWS_SECRET_ACCESS_KEY=45235656232343

log in again with the user to update the environment or just type:

    $ source ~/.bashrc


The following command create and prepare an Amazon intance with Docker Engine ready to use.

    $ ./create-aws-machine.sh MACHINE_NAME


**create-aws-machine.sh** takes the following arguments in sequence:

1. The Machine Name (ex. `aws1`, `cce_pmis`, `lg_aws1`)
2. The AMI ID Image *(default: `ami-a3915acd`)* (http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html)
3. The Machine Type *(default: `t2.micro`)*

The following command will create a machine `t2.micro` named `sa-aws1` using default `ami-a3915acd` image:

    $ ./create-aws-machine.sh sa-aws1

The following command will create a machine `t2.medium` named `sa-aws2` using default `ami-7d6fbe13` image:

    $ ./create-aws-machine.sh sa-aws2 ami-7d6fbe13 t2.medium



For a detailed documentation visit these sites: 
- https://docs.docker.com/machine/drivers/aws/

After the AWS Instance is created we need to set the environment inside the machine.
From the bash type:

    $ docker-machine.exe ssh <MACHINE_NAME>
    $ sudo usermod -a -G docker ubuntu
    $ exit

You should log out and log in again

    $ docker-machine.exe ssh <MACHINE_NAME>
    $ sudo curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" \
      -o /usr/local/bin/docker-compose
    $ sudo chmod +x /usr/local/bin/docker-compose
    $ docker-compose --version
    $ docker login dev.sangah.com:5043
    $ exit

Done.