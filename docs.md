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

- [UserDatabase](doc/UserDatabase) - This is the Docs for managing the UserDatabase
``` lua
local ManageProfiles= DataManager.createUserDB(name)
```


[**IsServer**](doc/IsServer)
``` lua
local IsServer = UAFramework.IsServer
```

[**Event**](doc/Event)
``` lua
local Event = UAFramework.Event
```