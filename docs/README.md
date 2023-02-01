#### **Documentation Links**

Requiring the UAFramework Module

``` lua
local UAFramework = require(path.to.module)
```

### *Collecting Packages*

**DataManager**

``` lua
-- requiring the modules for the Database
local DataManager = UAFramework.DataManager
```

- [UserDatabase](./UserDatabase.md) - This is the Docs for managing the UserDatabase
``` lua
local ManageProfiles= DataManager.createUserDB(name)
```


[**IsServer**](./IsServer.md)
``` lua
local IsServer = UAFramework.IsServer
```

[**Event**](./Event.md)
``` lua
local Event = UAFramework.Event
```