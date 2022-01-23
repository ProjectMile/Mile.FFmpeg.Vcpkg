set(ILBC_VERSION 3.0.4)
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/TimothyGu/libilbc/releases/download/v${ILBC_VERSION}/libilbc-${ILBC_VERSION}.zip"
    FILENAME "libilbc-${ILBC_VERSION}.zip"
    SHA512 b32561ddc001033f505d22b378c076eb46c6e4a1418a1c19c58ee4d1d16e033cd7943b2d9d9d09596292e172dc56fb00522c2be211816175ac41847ce382b0f7
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    REF ${ILBC_VERSION}
    PATCHES do-not-build-ilbc_test.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DCMAKE_INSTALL_DOCDIR=share/${PORT}
)

vcpkg_install_cmake()

vcpkg_fixup_pkgconfig()

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    vcpkg_replace_string(${CURRENT_PACKAGES_DIR}/include/ilbc_export.h "#ifdef ILBC_STATIC_DEFINE" "#if 1")
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
