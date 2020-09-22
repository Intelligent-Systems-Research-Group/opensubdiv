FROM nvidia/cuda:9.2-base
ADD . /opensubdiv/
WORKDIR /opensubdiv/
RUN apt-get update && apt-get install -y cmake g++ && \
mkdir build && mkdir ../install
WORKDIR /opensubdiv/build
RUN cmake -D NO_PTEX=1 -D NO_DOC=1 -D NO_OMP=1 -D NO_TBB=1 -D NO_CUDA=1 -D NO_OPENCL=1 -D NO_CLEW=1 -D NO_GLEW=1 -D NO_GLFW=1 -D NO_OPENGL=1 -DNO_TUTORIALS=1 -DNO_EXAMPLES=1 -DNO_REGRESSION=1 .. \
&& make && cmake -DCMAKE_INSTALL_PREFIX=/opensubdiv/install -P cmake_install.cmake

#MKDIR build
#WORKDIR build
