## Create Development Machine (dev.sangah.com)

The following commands are going to create a new machine link on your computer 
and install Docker Engine into it.

From this folder run:

    $ ./create-dev-machine.sh ssh_key_without_passphrase.key 192.168.0.20 sangah121

**create-dev-machine.sh** takes the following arguments in sequence:

1. ssh key file
2. host ip
3. host name

For a detailed documentation visit the following sites:
- https://docs.docker.com/machine/reference/create/
- https://docs.docker.com/machine/drivers/generic/

> If the previous command fail it might be required to edit the sudoers file to add permission to the ssh user
> to run application without the need to input the password.
> 
> Type the following command and inside the file add ``sangah ALL=(ALL) NOPASSWD: ALL`` 
> replacing the user with the right one.
>
>       $ sudo visudo



## Create an Amazon EC2 Instance

The following command create and prepare an Amazon intance with Docker Engine ready to use.

    $ ./create-aws-machine.sh ACCESS_KEY SECRET_KEY MACHINE_NAME

**create-aws-machine.sh** takes the following arguments in sequence:

1. the Amazon user access key provided to you
2. the Amazon user secret key provided to you
3. the machine name

For a detailed documentation visit these sites: 
- https://docs.docker.com/machine/drivers/aws/