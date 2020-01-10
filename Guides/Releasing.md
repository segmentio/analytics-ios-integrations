# iOS Required Changes for Releasing


## Below are some of the required changes needed before release and after adding an integration:
#### 1. Update the path of `Source` in the pod spec to point to master branch and change version for next release version.
#### 2. Change path of every added integration(pod) in Example projects pod file from relative path to the published path or git master branch source.
#### 3. `git commit -am "Prepare for release X.Y.Z."` (where X.Y.Z is the new version).
#### 4. `git tag -a X.Y.Z -m "Version X.Y.Z"` (where X.Y.Z is the new version).
#### 5. `git push && git push --tags`.
#### 6. `pod trunk push xxxx`, where xxxx is the newley added integration podspec.