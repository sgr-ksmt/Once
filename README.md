# Once
Execute closure once!!! Once is a micro framework.

```swift
import Once

class ViewController: UIViewController {
    private var dataSource = DataSource()
    lazy var onceReloader: OnceClosure = execute_once { [unowned self] in
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


## HowTo

- 1. Import framework

`import Once`

- 2. Define `lazy var` instance.  
**Note**: Don't forget to write parameter: `OnceClosure`  
**Note**: Use `[unowned self]` to avoid 

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
