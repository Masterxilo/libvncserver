$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest



# choco install -y cmake
bash.exe -c pwd


# attempt to add some dependencies to deps for cmake autodetection (?) [[
pushd deps
if (-not (Test-Path "SDL2-devel-2.24.0-mingw")) {
    wget.exe --no-clobber https://github.com/libsdl-org/SDL/releases/download/release-2.24.0/SDL2-devel-2.24.0-mingw.zip
    Expand-Archive SDL2-devel-2.24.0-mingw.zip
}
# still getting: -- Could NOT find SDL2 (missing: SDL2_LIBRARY SDL2_INCLUDE_DIR) ....

popd
# ]]

# assumes WSL is installed & set up
bash.exe /mnt/c/Users/windows/libvncserver/build-windows-version

pushd build/examples
trap { popd }
if (-not (Test-Path "libwinpthread-1.dll")) {
    something1-file-download.ps1 libwinpthread-1.dll
}

popd

echo "Running an example..."
.\build\examples\simple.exe
