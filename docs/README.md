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

- [UserDatabase](/docs/UserDatabase) - This is the Docs for managing the UserDatabase
``` lua
local ManageProfiles= DataManager.createUserDB(name)
```


[**IsServer**](/docs/IsServer)
``` lua
local IsServer = UAFramework.IsServer
```

[**Event**](/docs/Event)
``` lua
local Event = UAFramework.Event
```