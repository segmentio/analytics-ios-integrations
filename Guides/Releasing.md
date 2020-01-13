# iOS Required Changes for Releasing


## Below are some of the required changes needed before release and after adding an integration:
##### 1. Update the path of `Source` in the pod spec to point to master branch and change version for next release version.
##### 2. Run ./lint.sh and .test.ch to make sure no errors detected and all tests pass.
##### 3. Update the `CHANGELOG.md` for the impending release.
##### 4. `git commit -am "Prepare for release X.Y.Z."` (where X.Y.Z is the new version).
##### 5. `git tag -a X.Y.Z -m "Version X.Y.Z"` (where X.Y.Z is the new version).
##### 6. `git push && git push --tags`.
##### 7. `pod trunk push xxxx`, where xxxx is the newley added integration podspec.