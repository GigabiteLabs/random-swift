# random-swift

A utility for randomly generating data, content, and assets for iOS & macOS apps written in Swift.

[![CI Status](https://travis-ci.com/GigabiteLabs/random-swift.svg?branch=main)](https://travis-ci.com/GigabiteLabs/random-swift.svg?branch=main)
[![Version](https://img.shields.io/cocoapods/v/random-swift.svg?style=flat)](https://cocoapods.org/pods/random-swift)
[![License](https://img.shields.io/cocoapods/l/random-swift.svg?style=flat)](https://cocoapods.org/pods/random-swift)
[![Platform](https://img.shields.io/cocoapods/p/random-swift.svg?style=flat)](https://cocoapods.org/pods/random-swift)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/gigabitelabs/random-swift)](http://clayallsopp.github.io/readme-score?url=https://github.com/gigabitelabs/random-swift)
[![codebeat badge](https://codebeat.co/badges/74cdcf45-bec8-4abe-bf6c-a689efe6acad)](https://codebeat.co/projects/github-com-gigabitelabs-random-swift-main)

[BETA]: this framework is not a complete set of features and is in active development. check the examples documented in this readme for confirmation of what is available.

## Requirements

- iOS v11.0 or higher
- macOS v10.15 or higher (mac catalyst)

## Installation

### Cococapods
random-swift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'random-swift'
```

### Swift Package Manager
add this repository to your project via Swift PM:
- open your project
- select the project's .xcodeproj in the navigator
- select your project target
- select "Swift Packages"
- enter: https://github.com/GigabiteLabs/random-swift.git and choose the latest release version.

## Documentation

Full public documentation of the framework [can be found here](https://gigabitelabs.github.io/random-swift/).

## Import Options

### Import into entire project

Open `AppDelegate.swift`

Add an exported import statement to the top of the class like so:

```swift
@_exported import random_swift
```

The framework is now accessible in every class in your project.

**Note:** There are some [differing opinions](https://forums.swift.org/t/exported-and-fixing-import-visibility/9415) about `@_exported import`, namely, the risk of object and class [name collisions](https://stackoverflow.com/questions/25231650/swifts-standard-library-and-name-collision) between frameworks, however, if you don’t have any issues with the exported import approach in your project, you’re gonna be alright, and the convenience trade-off is probably worth it.

### Import into class or file

After installing, import into your class:

```swift
import random_swift
```

## Usage

Currently supported:

### Global Accessibility & Persistent Configuration

- Security & true randomness assured by leveraging the underlying `arc4random()` generator built into swift

- `Random` is available as a shared instance within the imported scope (class, project, etc.)

	```swift
	// access it with:
	Random.$type
	```
    
- A configuration set persists on the shared instance for the duration of the application session

	```swift
	// setup an IntRange configuration
	let intRange = IntRange(lower: 4, upper: 100)

	// setup a percentage range configuration
	let pctRange = PercentageRange(min: 0.10, max: 0.98)

	// assign the configurations
	Random.intRange = intRange
	Random.percentageRange = pctRange
	```
	While this shared instance is still in memory (i.e. the app is still 	running / not terminated or backgrounded), the *last used* configuration 	will be used as the default configuration for any calls for random values 	that need a range or an upper-bound limit.

- You can dynamically use new range configurations if you need to change them on the fly for new requests

	An example retrieving a new randomValue with a new range config:

	```swift
	// setup:
	let newIntRange = IntRange(lower: 1, upper: 5000)
	
	// get a random int value within the range
	let rangedInt = Random.int.withinRange(range: newIntRange)
	
	// get a random int value anywhere between 0 and the newIntRange.upper
	Random.int.withUpperLimit(of: newIntRange)
	```

### Notes:

- All `IntRange` and numerical return types are **exclusive** of the upper-bound:
    - For example, if the upper-bound target value is `200` and the lower-bound value is `0`, the only possible values that can return are `0` through `199`.
        - If the upper-bound *must* include `200` as a possible return value, you simply need to setup the upper-bound as `(upper-bound-target-value) + 1`


<br>

### Random Words

Random supports true random word generation.

Random words are generated from a static dictionary containing 235,886 words, all of which are packaged by default with macOS. 

**Functions**

- Get a random Word:

    ```swift
    let randomWord = Random.word
    ```

<br>



<br>

### Random Values

#### Random.int

**Functions**

- Get a random `Int`:

	```swift
	let randomInt = Random.int.value()
	```

- Get a random `Int` value within a given range between upper and lower bounds, :

	```swift
	// setup a range
	let newIntRange = IntRange(lower: 10, upper: 250)
	
	// get a random int value between range.lower and range.upper
	let randomIntWithinRange: Int = Random.int.withinRange(range: newIntRange)
	```

**Computed Properties**

- Get a random `Int`:

	```swift
	let randomInt = Random.int.value
	```

Note: The following computed properties require configuration to be in place beforehand. 

These will always return 0 if:

	- A config has not been set by using a function call
	- or by directly configuring `Random.intRange`.

Usage is basically the same as a function call:

- Get a random `Int` below a given `IntRange` upper-bound limit:

	```swift
	// setup a range & configure
	let range = IntRange(lower: 10, upper: 200)
	Random.intRange = range
	
	// get a random int value within the range
	let rangedInt = Random.int.withinUpperLimit
	```

- Get a random `Int` value within a given range between lower and upper bounds:

	```swift
	// setup a range & configure
	let range = IntRange(lower: 10, upper: 250)
	Random.intRange = range
	
	// get a random int value between range.lower and range.upper
	let randomWithinRange: Int = Random.int.withinRange
	// randomWithinRange == some Int between 10 and 200, exclusive of 200 (so max 199)
	```

#### Random.percentage

**Functions**

- Get a random percentage (as `Double`), rounded (optional) to a maximum decimal place value:

	```swift
	let randomPct = Random.percentage.value(roundedTo: 5)
	// returns percentage with no more than 5 place values
	// e.g. 0.45369
	```

- Get a random percentage below a given `PercentageRange` max limit, rounded (optional) to a max number of decimal place values:

	```swift
	// setup a range
	let range = PercentageRange(lower: 0.10, upper: 0.999)

	// get a random int value within the range
	let rangedPct: Double = Random.percentage.withUpperLimit(of: range, maxDecimalPlaces: 3)
	// returns percentage with no more than 3 decimal places
	// e.g. 0.294
	```

- Get a random percentage value within a given range, between min and max limits:

	```swift
	// setup a range
	let range = PercentageRange(lower: 0.15, upper: 0.322)
	
	// get a random int value between range.lower and range.upper
	let randomPctWithinRange: Double = Random.percentage.withinRange(range, maxDecimalPlaces: 1)
	// returns percentage with no more than 1 decimal place
	// e.g. 0.6
	```

**Computed Properties**

- Get a random percentage (as `Double`):

	```swift
	let randomPct: Double = Random.percentage.value
	```

Note: the following computed properties require configuration to be in place beforehand. 

These will always return 0.0 if:

	- A config has not been set by using a function call
    
	- or by directly configuring `Random.percentageRange`.

Usage is basically the same as a function call:

- Get a random percentage below a given `PercentageRange` max limit:

	```swift
	// setup a range & configure shared instance
	let range = PercentageRange(lower: 0.15, upper: 0.322)
	Random.intRange = range
	
	// get a random percentage value within the range
	let rangedPct: Double = Random.percentage.withUpperLimit
	```

- Get a random percentage value within a given range, between min and max limits:

	```swift
	// setup a range & configure
	let range = PercentageRange(lower: 0.01, upper: 0.9)
	Random.intRange = range
	
	// get a random int value between range.lower and range.upper
	let randomPctWithinRange: Double = Random.percentage.withinRange
	// randomWithinRange == some Int between 0.01 and 0.9, exclusive of 0.9 (so max 0.89)
	```

### Random Date

#### Random.date

**Functions**


**Computed Properties**


## Authors

Original Author:
[Dan Burkhardt](https://github.com/gigabitelabs/danburkhardt)
Founder & Lead Engineer @[GigabiteLabs](https://gigabitelabs.com)
Twitter: [@GigabiteDan](https://twitter.com/gigabitedan)

Contributors:
(nobody else yet ;) 

## License

random-swift is available under the MIT license. See the LICENSE file for more info.
