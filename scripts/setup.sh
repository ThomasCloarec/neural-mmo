read -p "DEPENDENCIES: this script requires Anaconda Python 3.8, gcc, zlib1g-dev, make, cmake, and build-essential. Installation will fail otherwise. Proceed [y/n]?" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
   [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

#Install python packages
echo "Installing conda pip packages"
pip install -r scripts/requirements.txt

echo "Installing rllib"
pip install ray[rllib]

echo "Installing cuda torch"
conda install pytorch torchvision torchaudio cudatoolkit=11.0 -c pytorch

echo "Done. Errors? Check that dependencies have been met"
