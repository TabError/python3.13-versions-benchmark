
if [[ ! -d $(pyenv root)/plugins/pyenv-suffix ]]
then
        echo "pyenv-suffix plugin is missing!"
        echo "it should be installed so that the different python3.13 versions can be distinguished"
        echo "See: https://github.com/AdrianDAlessandro/pyenv-suffix"
        exit 1
fi



# normal 3.12 version (for reference)
echo " === Installing 3.12.7-stock === "
PYENV_VERSION_SUFFIX="-stock" \
  pyenv install 3.12.7


# installing 3.13.0 versions

# normal 3.13 version
echo " === Installing 3.13.0-stock === "
PYENV_VERSION_SUFFIX="-stock" \
  pyenv install 3.13.0

# 3.13 version with GIL disabled
echo " === Installing 3.13.0-nogil" === 
PYENV_VERSION_SUFFIX="-nogil" \
  PYTHON_CONFIGURE_OPTS='--disable-gil' \
  pyenv install 3.13.0

# 3.13 version with experimental JIT enabled
echo " === Installing 3.13.0-jit" === 
PYENV_VERSION_SUFFIX="-jit" \
  PYTHON_CONFIGURE_OPTS='--enable-experimental-jit' \
  pyenv install 3.13.0

# 3.13 version with GIL disabled and experimental JIT enabled
echo " === Installing 3.13.0-nogil-jit === "
PYENV_VERSION_SUFFIX="-nogil-jit" \
  PYTHON_CONFIGURE_OPTS='--disable-gil --enable-experimental-jit' \
  pyenv install 3.13.0



# installing optimized version?
# TODO
# PYTHON_CONFIGURE_OPTS='--enable-optimizations --with-lto --enable-experimental-jit=yes-off' PYENV_VERSION_SUFFIX="-cust" pyenv install --verbose 3.13.0 -v



# installing pypy versions

# pypy 3.10 binary
echo " === Installing pypy3.10 === "
pyenv install pypy3.10-7.3.17

# # pypy 3.10 built on this machine
# # TODO
# echo " === Installing pypy3.10-src === "
# pyenv install pypy3.10-7.3.17-src



# show installed versions
pyenv versions

