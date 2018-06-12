# Marzipan Platter
## tl;dr
![Gifs are all the rage in Paris](https://github.com/biscuitehh/MarzipanPlatter/raw/master/assets/demo.gif)

## Overview
At WWDC 2018 Apple announced that they are working on a multi-year strategy to make it easier to port UIKit applications to the Mac. While some first-party applications such as the Home & News app are going to use this API in macOS 10.14, third-party developers won't have _official_ access for another year. As a result, I made this project to help tinkerers/other impatient people get a taste of what's to come when Apple gives everyone access to Marzipan next year.

## Requirements/Notes
- macOS 10.14 Mojave & Xcode 10 (note: apparently Virtual Machines *do not* work with Marzipan, so you'll need a real Mac/Hackintosh to make magic happen)
- Disabling SIP & adding the `amfi_get_out_of_my_way=0x1` to your `boot-args`.
- Requires [jtool](http://www.newosxbook.com/tools/jtool.html) to parse the MachO loader commands.
- Requires [optool](https://github.com/alexzielenski/optool) to edit the MachO header of our _almost_ final product.
- Patience
- No longer requires any environment variables because the best rules are no rules.
- Still probably requires a beer or two.

## Caveats
- Requires you to disable SIP & add `amfi_get_out_of_my_way=0x1` to your `boot-args`. There has to be a better way.
- Seems to crash my debugger/Mac a lot (not sure if this is a me or a Mojave beta issue)
- The `UIKitSystem` process doesn't usually stop running when you stop debugging your app. It's best if you leave `sshd` open (I mean we already killed code signing, what's the worst that could happen) and connected so you can kill `UIKitSystem` if your development machine locks up. Thanks goes to [@stroughtonsmith](https://twitter.com/stroughtonsmith) and [@_inside](https://twitter.com/_inside) for the gnarly tip!

## Before Building/Running the project
- Set the `JTOOL_PATH` and `OPTOOL_PATH` user-defined settings to the respective locations where you installed `jtool`/`optool` (listed in the requirements above). You can find the `JTOOL_PATH` & `OPTOOL_PATH` in the Build Settings of the Xcode project.
- Ensure you've disabled SIP & set your `boot-args` to include `amfi_get_out_of_my_way=0x1`. Hopefully we can circumvent the entitlement check with a less brutish method in the near future.

## Build Release & Run (from the CLI)
If you're running into _oh my goodness my Mac keeps dying_ issues when debugging, I've provided some simple instructions to create a release version of your Marzipan app.

To build the archive: 
`xcodebuild archive -scheme MarzipanPlatter -archivePath ./build/MarzipanPlatter.xcarchive`

To export the `.app` from the archive: 
`xcodebuild -exportArchive -archivePath ./build/MarzipanPlatter.xcarchive -exportOptionsPlist ExportOptions.plist -exportPath ./build/`

To run `MarzipanPlatter` with the useful `CFMZEnabled` environment variable:
`./build/MarzipanPlatter.app/Contents/MacOS/MarzipanPlatter`

## TODO
- [ ] find a better way to run Marzipan apps without disabling important things like AMFI/SIP.
- [ ] continue adding samples to make this project sizzle.
- [ ] find a better way to debug Marzipan apps that doesn't involve rebooting my Mac every 30 minutes.
- [ ] write up an explaination of why you have to disable SIP/AMFI
- [ ] fix these TODOs

## Thanks
- A big shout out to [@stroughtonsmith](https://twitter.com/stroughtonsmith) for sanity checking my approach to this problem/figuring out why UILabel decided to derp.
- [@s1guza](https://twitter.com/s1guza) for [tbdump](https://github.com/Siguza/tbdump)
- [@zhuowei](https://twitter.com/zhuowei) for coming up with the clever `ldwrap` method. Definitely check out the MarzipanTool repo listed below.
- [@Morpheus______](https://twitter.com/Morpheus______) for the awesome `jtool` and `*OS Internals` books that have taught me many things.

## Related Projects
- [MarzipanTool](https://github.com/zhuowei/MarzipanTool) - Tools to build and run iOS UIKit applications on macOS 10.14 Mojave, using the iOSMac framework announced at WWDC.

## Questions/Comments
It's probably best if you leave an issue if you have a real problem with this code. However, you can tweet/DM me [@NSBiscuit](https://twitter.com/NSBiscuit) on Twitter if you want to chat about life/snakes/random thoughts/etc.
