
# react-native-cuehall-gz-snacks-billards

## Getting started

`$ npm install react-native-cuehall-gz-snacks-billards --save`

### Mostly automatic installation

`$ react-native link react-native-cuehall-gz-snacks-billards`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-cuehall-gz-snacks-billards` and add `RNCuehallGzSnacksBillards.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCuehallGzSnacksBillards.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNCuehallGzSnacksBillardsPackage;` to the imports at the top of the file
  - Add `new RNCuehallGzSnacksBillardsPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-cuehall-gz-snacks-billards'
  	project(':react-native-cuehall-gz-snacks-billards').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-cuehall-gz-snacks-billards/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-cuehall-gz-snacks-billards')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNCuehallGzSnacksBillards.sln` in `node_modules/react-native-cuehall-gz-snacks-billards/windows/RNCuehallGzSnacksBillards.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Cuehall.Gz.Snacks.Billards.RNCuehallGzSnacksBillards;` to the usings at the top of the file
  - Add `new RNCuehallGzSnacksBillardsPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNCuehallGzSnacksBillards from 'react-native-cuehall-gz-snacks-billards';

// TODO: What to do with the module?
RNCuehallGzSnacksBillards;
```
  