/// <reference types="/home/arch/.bun/install/global/node_modules/@types/bun/index.d.ts" />

export { }

type PatchBundle = {
  version: string
  patches: Patch[]
}

type Patch = {
  name: string
  description: string
  compatiblePackages: CompatiblePackage[] | null
}

type CompatiblePackage = {
  packageName: PackageName
  targets: CompatiblePackageTarget[]
}

type CompatiblePackageTarget = {
  version: PackageVersion
  isExperimental: boolean
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
    if (packageName === null && patch.compatiblePackages === null) {
      matchingPatches[patch.name] = patch.description
      continue
    }

    for (const compatiblePackage of patch.compatiblePackages ?? []) {
      if (compatiblePackage.packageName === packageName) {
        matchingPatches[patch.name] = patch.description
      }
    }
  }
  return matchingPatches
}

const latestCompatibleVersionFor = (packageName: PackageName | null) => {
  if (packageName === null) {
    return
  }
  const matchingVersionSet: Set<PackageVersion> = new Set()
  for (const patch of patchBundle.patches) {
    for (const compatiblePackage of patch.compatiblePackages ?? []) {
      if (compatiblePackage.packageName === packageName) {
        for (const target of compatiblePackage.targets) {
          if (!target.isExperimental) {
            matchingVersionSet.add(target.version)
          }
        }
      }
    }
  }
  const matchingVersions = Array.from(matchingVersionSet).toSorted().toReversed()
  return matchingVersions[0]
}

const target = ALL_PACKAGES
console.log(latestCompatibleVersionFor(target))
console.log(
  Object.entries(patchesFor(target))
    .map(([name, description]) => `  "${name}" # ${description}`)
    .join('\n')
)
