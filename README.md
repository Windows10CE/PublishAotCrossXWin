# PublishAotCrossXWin

This is a NuGet package with an MSBuild target to aid in crosscompilation with [PublishAot](https://learn.microsoft.com/en-us/dotnet/core/deploying/native-aot/). It helps resolving following error:

```sh
$ dotnet publish -r win-x64
Microsoft.NETCore.Native.Publish.targets(59,5): error : Cross-OS native compilation is not supported.
```

This nuget package allows using lld-link as the linker and having [xwin](https://github.com/Jake-Shadle/xwin) provide the sysroot to allow crosscompiling to win-x64/win-arm64/win-x86 from a Linux machine.

1. Make sure lld-link is installed and in your PATH. It is not installed by default in GitHub actions runners, the Ubuntu package is `lld`.
2. [Download](https://github.com/Jake-Shadle/xwin/releases/) an archive with xwin for your host machine, extract it and place it on your PATH. This was built using using 0.6.6-rc.2.
3. To your project that is already using Native AOT, add a reference to this NuGet package.
4. Publish for one of the newly available RIDs:
    * `dotnet publish -r win-x64`
    * `dotnet publish -r win-arm64`
    * `dotnet publish -r win-x86`
