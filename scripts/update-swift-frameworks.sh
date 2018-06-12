#!/bin/sh
## tl;dr this tool determines the iOS libSwift frameworks we would need if we were an iOS app and links
## the appropriate iOSMac versions of said frameworks (found in /System/Library/PrivateFrameworks/Swift)
## There has got to be a better way to do this, but xcodebuild doesn't really let you get in the way
## of certain build steps, which is a huge bummer :(

mkdir -p ${TARGET_BUILD_DIR}/TempFrameworks

# Run swiftStdLibTool to determine the frameworks iOS would need _if_ we were an iOS app
# This tool also copies them so we can interate through them
xcrun swift-stdlib-tool --copy \
	--scan-executable ${TARGET_BUILD_DIR}/${EXECUTABLE_PATH} \
	--scan-folder ${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH} \
	--platform iphonesimulator \
	--toolchain ${TOOLCHAIN_DIR} \
	--destination ${TARGET_BUILD_DIR}/TempFrameworks \
	--strip-bitcode \
	--resource-destination ${TARGET_BUILD_DIR}/TempFrameworks \
	--resource-library libswiftRemoteMirror.dylib \
	--strip-bitcode-tool ${TOOLCHAIN_DIR}/usr/bin/bitcode_strip

# Use the awesome jtool from @Morpheus______
# If otool -L would be less chatty we wouldn't need this dependency
# Also, $JTOOL_PATH is defined in the Xcode project file.
$JTOOL_PATH -L ${TARGET_BUILD_DIR}/${EXECUTABLE_PATH}

# Iterate through our libraries and swap them out for their better looking stunt doubles
for file in ${TARGET_BUILD_DIR}/TempFrameworks/*.dylib; do
    [ -e "$file" ] || continue
    dylibName=$(basename "$file")

    # Note: we don't know how to deal with libswiftRemoteMirror.dylib yet.
    # For some reason libSwiftMapKit.dylib also likes to give us hecks.
    if [[ $dylibName = 'libswiftRemoteMirror.dylib' || $dylibName = 'libswiftMapKit.dylib' ]]; then
    	continue
	fi

    echo "iOSMac will probably need ${dylibName} - let's link it properly ..."
    dylibLocation="/System/Library/PrivateFrameworks/Swift/${dylibName}"

    echo "Re-installing ${dylibLocation} ..."

    # Requires optool from https://github.com/alexzielenski/optool to do this
    $OPTOOL_PATH uninstall -p "@rpath/${dylibName}" -t "${TARGET_BUILD_DIR}/${EXECUTABLE_PATH}"
    $OPTOOL_PATH install -c load -p "${dylibLocation}" -t "${TARGET_BUILD_DIR}/${EXECUTABLE_PATH}"
done

# Clean up unneeded @rpaths
dylibsToReplace=$($JTOOL_PATH -L ${TARGET_BUILD_DIR}/${EXECUTABLE_PATH})

for dylib in $dylibsToReplace; do
	if [[ $dylib = '@rpath'* ]]; then
		echo "warning: Removing unused @rpath - ${dylib}. If this causes issues for you add an exception here to prevent this library from being unlinked."
		$OPTOOL_PATH uninstall -p "${dylib}" -t "${TARGET_BUILD_DIR}/${EXECUTABLE_PATH}"
	fi
done

$JTOOL_PATH -L ${TARGET_BUILD_DIR}/${EXECUTABLE_PATH}

rm -rf ${TARGET_BUILD_DIR}/TempFrameworks