# Once
[![GitHub release](https://img.shields.io/github/release/sgr-ksmt/Once.svg)](https://github.com/sgr-ksmt/Once/releases)
![Language](https://img.shields.io/badge/language-Swift%203-orange.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

Execute closure once!!! Once is a micro framework.

```swift
import Once

class ViewController: UIViewController {
    private var dataSource = DataSource()
    lazy var onceReloader: OnceClosure = execute_once {
        print("execute once")
        self.dataSource.reload()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onceReloader?()   
    }
}
```

### Legacy...

```swift
class ViewController: UIViewController {
    private var dataSource = DataSource()
    private var callFirst = true

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if callFirst {
            reloadOnce()
            callFirst = falee
        }
    }

    func reloadOnce() {
        print("execute once")
        self.dataSource.reload()
    }    
}
```


## Features
- Execute closure just once.
- Don't need to have any flags that closure called or not.
- This function doesn't capture any objects by using `no-escaped` closure.
    - You don't have to use `[weak self], [unowned self]`.
- micro library!


## How to use

- 1. Import framework

`import Once`

- 2. Define `lazy var` instance.  
**Note**: Don't forget to write parameter: `OnceClosure`  

```swift
class ViewController: UIViewController {
    // as closure
    lazy var onceReloader: OnceClosure = execute_once {
        print("execute once")
        self.dataSource.reload()
    }

    // or function    
    lazy var onceReloader2: OnceClosure = self.reloadOnce()

    func reloadOnce() -> OnceClosure {
        return execute_once {
            print("execute once")
            self.dataSource.reload()
        }
    }
}
```

- 3. Execute once closure!! (need `?`)  

```swift
class ViewController: UIViewController {
    // ...
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onceReloader?()
    }
}
```

### Caution
Once-closure will not work anymore if it is assigned `nil` before executing.

```swift
import Once

class ViewController: UIViewController {
    private var dataSource = DataSource()
    lazy var onceReloader: OnceClosure = execute_once {
        print("execute once")
        self.dataSource.reload()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onceReloader = nil
        onceReloader?() // doesn't work.
    }
}
```

## Requirements
- iOS 8.0+
- Xcode 8+
- Swift 3

## Installation
You can install with carthage or SPM.

### Carthage

- Add the following to your *Cartfile*:

```bash
github 'sgr-ksmt/once'
```

- Then run command.

## Communication
- If you found a bug, please open an issue. :bow:
- Also, if you have a feature request, please open an issue. :thumbsup:
- If you want to contribute, submit a pull request.:muscle:

## License

**Once** is under MIT license. See the [LICENSE](LICENSE) file for more info.