# Marzipan Platter
## Overview
At WWDC 2018 Apple announced that they are working on a multi-year strategy to make it easier to port UIKit applications to the Mac. While some first-party applications such as the Home & News app are going to use this API in macOS 10.14, third-party developers won't have _official_ access for another year. As a result, I made this project to help tinkerers/other impatient people get a taste of what's to come when Apple gives everyone access to Marzipan next year.

## Requirements/Notes
- macOS 10.14 Mojave & Xcode 10 (note: apparently Virtual Machines *do not* work with Marzipan, so you'll need a real Mac/Hackintosh to make magic happen)
- Disabling SIP & adding the `amfi_get_out_of_my_way=0x1` to your `boot-args`.
- Patience
- Setting `CFMZEnabled=1` before running your Marzipan app. This fixes internal bits that like to steal your UILabels and cause assertions for no good reason. Currently it's set in the `MarzipanPlatter` Debug scheme but I need to find a way to get the `Release` build to set the variable.
- Probably a beer or two.

## Caveats
- Requires you to disable SIP & add `amfi_get_out_of_my_way=0x1` to your `boot-args`. There has to be a better way.
- Seems to crash my debugger/Mac a lot (not sure if this is a me or a Mojave beta issue)
- The `UIKitSystem` process doesn't usually stop running when you stop debugging your app. It's good to restart it every now and then or else strange things will start happening.

## Build Release & Run (from the CLI)
If you're running into _oh my goodness my Mac keeps dying_ issues when debugging, I've provided some simple instructions to create a release version of your Marzipan app.

To build the archive: 
`xcodebuild archive -scheme MarzipanPlatter -archivePath ./build/MarzipanPlatter.xcarchive`

To export the `.app` from the archive: 
`xcodebuild -exportArchive -archivePath ./build/MarzipanPlatter.xcarchive -exportOptionsPlist ExportOptions.plist -exportPath ./build/`

To run `MarzipanPlatter` with the useful `CFMZEnabled` environment variable:
`CFMZEnabled=1 ./build/MarzipanPlatter.app/Contents/MacOS/MarzipanPlatter`

## TODO
- [ ] find a better way to run Marzipan apps without disabling important things like AMFI/SIP.
- [ ] continue adding samples to make this project sizzle.
- [ ] find a better way to debug Marzipan apps that doesn't involve rebooting my Mac every 30 minutes.
- [ ] write up an explaination of why you have to disable SIP/AMFI

## Thanks
- A big shout out to [@stroughtonsmith](https://twitter.com/stroughtonsmith) for sanity checking my approach to this problem/figuring out why UILabel decided to derp.
- Thanks to [@s1guza](https://twitter.com/s1guza) for [tbdump](https://github.com/Siguza/tbdump)

## Related Projects
- [MarzipanTool](https://github.com/zhuowei/MarzipanTool) - Tools to build and run iOS UIKit applications on macOS 10.14 Mojave, using the iOSMac framework announced at WWDC.

## Questions/Comments
You can follow/tweet/message me [@NSBiscuit](https://twitter.com/NSBiscuit). At the very least I can help yell at the computer for making our lives more difficult yet interesting.
