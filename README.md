# analytics-ios-integrations

Monorepo storing Segment's analytics iOS integrations. You can find additional documentation for this repo in the `guides` directory.

## Requirements:
To run monorepo or migrate a destination, the following are required:

Xcode 8+
Xcode command line tools and default must be set under "Locations" in Xcode preferences. (If multiple versions of Xcode are installed on a machine, an occur may occur, and so correct default version must be correctly selected)

And local dependencies:

1- HomeBrew
2- Cocopods 1.8
3- RubyGems Bundler
4- OCLint
5- Clang-format

Alternatively, run .check.sh to install any missing local dependencies.

```bash
$ ./check.sh
```

## Usage
You can open the iOS-Integrations.xcworkspace project on Xcode. All integrations are included by default.

Any scripts can be either run in "Scripts" directory or in root directory.

To run in root, use the following:

```bash
$ ./start.sh sh xxxx.sh
```
For the purposes of the guide, we will assume, you are inside the Scripts directory.

1- Please run check.sh to make sure all required dependencies have been installed on machine
```bash
$ ./check.sh
```

2- Please run pod install or update in root and in example projects, alternatively you can run to do so for you.
```bash
$ ./update.sh
```

### Linter and formatter
We use [clang-format](https://github.com/llvm-mirror/clang/tree/master/tools/clang-format) and clang-format's [guide](http://clangformat.com) to format our code and [OCLint](http://docs.oclint.org/en/stable/guide/index.html) to check source code and pod spec lint to check podspec:
Note: During lint, it includes cleaning project and building source files.

```bash
$ ./lint  
$ ./format 
```

### Tests
We use xcode build tools to run tests. You can run all the tests using:
```bash
$ ./test 
```

### Release
You can release using:
```bash
$ ./release
```

For releasing production versions, please check our Segment's internal documentation.

## Migrating Destinations to the Monorepo

You can find more information on migrating a destination [here](./guides/MIGRATING.md).


## Semantic Versioning

Version X.Y.Z
#### 1 Pre-release versions
Version `1.0.0-alpha.1`: is the pre-official release of the integration SDK. Here the SDK is still being test run

#### 2 Initial Release
Version `1.0.0`: is initial official stable release of the integration SDK going into production

#### 3 Patch Release
Version `1.0.Z`: is the release when a bug is fixed in the integration SDK, `Z` must be incremented. i.e `1.0.1`

#### 4 Minor Version 
Version `1.Y.0`: is the release when a backwards compatible feature is introduced to the integration SDK. `Y` must be incremented and `patch` version number must be reset to 0. i.e `1.1.0`

#### 5 Major Version 
Version `X.0.0`: is the release when a backwards incompatible change is introduced to the integration SDK. `X` must  be incremented while the `minor` and `patch` version numbers must be reset to 0. i.e  `2.0.0`

## How to submit a PR 

### Commit Process
#### 1 Branches should include ticket number e.g DAND-6-TASK-NAME
#### 2 Commits should include ticket number and a verb for action e.g DAND-6-Fix - or DAND-6-Add or DAND-6-Update
---
### Before Submitting PR Requirements
#### 1 Run linter and formatter before committing
```bash
$ ./lint
$ ./format
```
#### 2 You must run the tests, ensuring they all pass
```
./test
```
#### 3 Include a well-detailed title and description 

#### 4 Ensure the following: 
- [x] Check if implementation works according to the PR descriptions
- [x] Check if there are breaking changes in this PR
- [x] Check if the new changes could potentially break anything in the future.
- [x] Check if there are any structural or architectural changes
- [x] Check for overall best practices

### Ready to go :rocket:

## How to review a PR
Here's a checklist of what to look for when reviewing a PR:
- [x] No changes have been made to `.circleci`.
- [x] No changes have been made to `.buildkite`.
- [x] CircleCI SaaS has completed successfully.
- [x] Buildkite CI has completed successfully (only for non-forked repos).
- [x] There is *enough* testing coverage for the changes.
- [x] If the change is updating an integration's SDK, the Changelog link is included in the description of the PR.
- [x] Big changes are split on multiple commits.
- [x] The version has changed following SemVer for functional changes.

If any of this checks fail, the PR will be rejected.
