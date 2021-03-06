# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/algorithm
    REF boost-1.79.0
    SHA512 457f894e538182990c066fed06ce4ae1749e742eb31677bb00a60faab0072a3fddfbc993c467695ef52b7e0d72f13ee2bc5bf5d10176c091c68a59676426624b
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
