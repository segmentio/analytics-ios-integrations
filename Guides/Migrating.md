## Migrate a destination from an old repo to the monorepo

#### 1. Clone the destination you intend to migrate
```shell
git clone https://github.com/segment-integrations/analytics-ios-integration-firebase
```
#### 2. Clone the monoRepo
```shell
git clone https://github.com/segmentio/analytics-ios-integrations
```
#### 2. Create new Xcode project, => Choose "Cococa Touch framework" and name project as previous  destination and check the  Objective C and add unit tests boxes.

#### 3. Create new group and name it source and add two new groups, "Core" and "Supporting Files".

#### 4. Move the  destination into the integrations directory where all the source files are under core and .plist and header file, add to supporting files.

#### 5. Add unit tests to test.m

##(At this point project will not run especially since it requires dependencies)

#### 6. Close project and open the iOS-Integrations.xcworkspace in the parent folder, drag the xxxx.xcodeproj to the workspace. It should be added and show as a target but a framework. 

#### 7. Copy the podspec file and set

```
s.source         = { :git => '' }
s.source_files = 'Source/**/*'
s.exclude_files = 'Source/Supporting Files'

``` 

Also update dependencies version to latest if required.

#### 8. Add to pod in the parent folder file the following:

##### a. The relative path of the xxx.xcodeproj
##### b. The framework and test target.
##### c. Add the project path again in the framework target
##### d. Include any shared dependencies or new dependencies.

And run pod install. If successful, running and testing will work correctly. 

#### 9. In example project, add the newly added destination by setting its relative path.







