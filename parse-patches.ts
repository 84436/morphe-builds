/// <reference types="/home/arch/.bun/install/global/node_modules/@types/bun/index.d.ts" />

export { }

type PatchBundle = {
  version: string
  patches: Patch[]
}

type Patch = {
  name: string
  description: string
  compatiblePackages: Record<PackageName, PackageVersion[]> | null
  options: []
}

type PackageName = string
type PackageVersion = string

const YOUTUBE: PackageName = 'com.google.android.youtube'
const YOUTUBE_MUSIC: PackageName = 'com.google.android.apps.youtube.music'
const REDDIT: PackageName = 'com.reddit.frontpage'
const ALL_PACKAGES = null

const patchBundle: PatchBundle = await Bun.file("patches.json").json();

const patchesFor = (packageName: PackageName | null) => {
  const matchingPatches: Record<Patch['name'], Patch['description']> = {}
  for (const patch of patchBundle.patches) {
    if (packageName === null) {
      if (patch.compatiblePackages === null) {
        matchingPatches[patch.name] = patch.description
      }
    } else if (patch.compatiblePackages && patch.compatiblePackages[packageName]) {
      matchingPatches[patch.name] = patch.description
    }
  }
  return matchingPatches
}

console.log(
  Object.entries(patchesFor(ALL_PACKAGES))
    .map(([name, description]) => `  # "${name}" # ${description}`)
    .join('\n')
)
