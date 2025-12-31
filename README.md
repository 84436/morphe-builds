# My personal Morphe builds

- All builds use original APKs from [APKMirror](https://www.apkmirror.com/). For split APKs, they are merged using [APKEditor](https://github.com/REAndroid/APKEditor) (`apkeditor m -i splits -o original.apk -extractNativeLibs false`) before patching.
- Included splits (only guaranteed for YouTube, best-effort for other apps):
    - ABIs: `arm64-v8a`
    - Languages: `en` (English), `vi` (Vietnamese)
    - Resource resolutions: `xhdpi` (~320 dpi), `xxhdpi` (~480 dpi)

## Where are the builds?

[In the Releases section](https://github.com/84436/morphe-builds/releases).

## Should I trust you/your builds?

No, unless you personally know me.

## Note to self

https://github.com/MorpheApp/MicroG-RE/releases

How to partially your tracks:

```sh
# Amend latest commit
GIT_COMMITTER_DATE="2026-01-01T00:00:00+0700" GIT_AUTHOR_DATE="2026-01-01T00:00:00+0700" git commit --amend --no-edit --allow-empty-message --reset-author

# Add lightweight tag
GIT_COMMITTER_DATE="2026-01-01T00:00:00+0700" GIT_AUTHOR_DATE="2026-01-01T00:00:00+0700" git tag $version
```
