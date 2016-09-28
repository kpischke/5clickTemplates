#!/bin/bash
USER=$1
LICIP=$2
HOST=`hostname`
echo $USER,$LICIP,$HOST

mkdir /mnt/resource/INSTALLERS
tar -xzf /mnt/resource/STAR-CCM+11.02.010_01_linux-x86_64-r8.tar.gz -C /mnt/resource/INSTALLERS/

cd /mnt/resource/INSTALLERS/starccm+_11.02.010/

mkdir -p /mnt/nfsshare/ansys_inc/shared_files/licensing/

echo SERVER=1055@$LICIP > /mnt/nfsshare/ansys_inc/shared_files/licensing/ansyslmd.ini
echo ANSYSLI_SERVERS=2325@$LICIP >> /mnt/nfsshare/ansys_inc/shared_files/licensing/ansyslmd.ini

echo export FLUENT_HOSTNAME=$HOST >> /home/$USER/.bashrc
echo export INTELMPI_ROOT=/opt/intel/impi/5.1.3.181 >> /home/$USER/.bashrc
echo export I_MPI_FABRICS=shm:dapl >> /home/$USER/.bashrc
echo export I_MPI_DAPL_PROVIDER=ofa-v2-ib0 >> /home/$USER/.bashrc
echo export I_MPI_ROOT=/opt/intel/compilers_and_libraries_2016.2.181/linux/mpi >> /home/$USER/.bashrc
echo export PATH=/mnt/nfsshare/ansys_inc/v172/fluent/bin:/opt/intel/impi/5.1.3.181/bin64:$PATH >> /home/$USER/.bashrc
echo export I_MPI_DYNAMIC_CONNECTION=0 >> /home/$USER/.bashrc

source /mnt/resource/INSTALLERS/ANSYS/INSTALL -silent -install_dir "/mnt/nfsshare/ansys_inc/" -fluent


