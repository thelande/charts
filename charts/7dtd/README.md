# 7dtd

![Version: 0.6.3](https://img.shields.io/badge/Version-0.6.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.1](https://img.shields.io/badge/AppVersion-0.6.1-informational?style=flat-square)

A Helm chart to deploy the 7 Days to Die Dedicated Server

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Tom Helander | <thomas.helander@gmail.com> |  |

## Source Code

* <https://github.com/thelande/7dtd>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://bjw-s-labs.github.io/helm-charts/ | common | 5.0.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| sdtd-exporter.apiUrl | string | `""` | URL of the game server dashboard service. |
| sdtd-exporter.authSecret | string | `""` | Name of the secret containing the keys `name` and `token` with the API token. |
| sdtd-exporter.enabled | bool | `false` | Enable the Prometheus exporter |
| sdtd-exporter.image.pullPolicy | string | `"Always"` |  |
| sdtd-exporter.image.repository | string | `"thelande/sdtd_exporter"` |  |
| sdtd-exporter.image.tag | string | `"v0.2.2"` |  |
| sdtd-exporter.serviceMonitor.enabled | bool | `false` | Enable the service monitor. |
| sdtd-exporter.serviceMonitor.scrapeInterval | string | `"60s"` | Scrape interval of the service monitor. |
| sdtd.allocsFixes.enabled | bool | `false` | Deploy Alloc's Fixes when `true`. |
| sdtd.allocsFixes.overrideVersion | string | `""` | Override the version to be installed. See https://illy.bz/fi/7dtd/ for a list of available versions. This field should be the `vXX_YY_ZZ` portion of the filename (example: `v30_38_52`). An empty value means to use the latest from https://illy.bz/fi/7dtd/server_fixes.tar.gz |
| sdtd.containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| sdtd.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| sdtd.containerSecurityContext.readOnlyRootFilesystem | bool | `false` |  |
| sdtd.containerSecurityContext.runAsGroup | int | `1000` |  |
| sdtd.containerSecurityContext.runAsNonRoot | bool | `true` |  |
| sdtd.containerSecurityContext.runAsUser | int | `1000` |  |
| sdtd.containerSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| sdtd.image.pullPolicy | string | `"Always"` |  |
| sdtd.image.repository | string | `"thelande/7dtd"` |  |
| sdtd.image.tag | string | `""` |  |
| sdtd.ingress | object | `{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}],"labels":{},"tls":[]}` | Ingress for the admin web dashboard |
| sdtd.persistence.data | object | `{"accessMode":"ReadWriteOnce","existingClaim":"","size":"20Gi","storageClass":""}` | Configuration for the game data file PVC storage. |
| sdtd.persistence.steam | object | `{"accessMode":"ReadWriteOnce","existingClaim":"","size":"500Mi","storageClass":""}` | Configuration for the steam client file PVC storage. |
| sdtd.podSecurityContext.fsGroup | int | `1000` |  |
| sdtd.podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| sdtd.podSecurityContext.runAsGroup | int | `1000` |  |
| sdtd.podSecurityContext.runAsNonRoot | bool | `true` |  |
| sdtd.podSecurityContext.runAsUser | int | `1000` |  |
| sdtd.probes.enabled | bool | `false` |  |
| sdtd.resources | object | `{}` |  |
| sdtd.route | object | `{"annotations":{},"enabled":false,"hostnames":[],"labels":{},"parentRefs":[]}` | HTTPRoute for the admin web dashboard |
| sdtd.serverConfig.admin.enableMapRendering | bool | `false` | Enable/disable rendering of the map to tile images while exploring it. This is used e.g. by the web dashboard to display a view of the map. |
| sdtd.serverConfig.admin.telnetEnabled | bool | `false` | Enable/Disable the telnet interface. |
| sdtd.serverConfig.admin.telnetFailedLoginLimit | int | `10` | After this many wrong passwords from a single remote client the client will be blocked from connecting to the Telnet interface |
| sdtd.serverConfig.admin.telnetFailedLoginsBlocktime | int | `10` | How long will the block persist (in seconds). |
| sdtd.serverConfig.admin.telnetPasswordSecret | string | `""` | Secret containing the password to gain entry to telnet interface. If no password is set the server will only listen on the local loopback interface. Must contain a value named "password" containing the password. |
| sdtd.serverConfig.admin.telnetPort | int | `8081` | Port of the telnet server. |
| sdtd.serverConfig.admin.webDashboardEnabled | bool | `false` | Enable/disable the web dashboard. |
| sdtd.serverConfig.admin.webDashboardPort | int | `8080` | Port of the web dashboard.  Should match the webDashboardService.port value above. |
| sdtd.serverConfig.admin.webDashboardUrl | string | `""` | External URL to the web dashboard if not just using the public IP of the server, e.g. if the web dashboard is behind a reverse proxy. Needs to be the full URL, like "https://domainOfReverseProxy.tld:1234/". Can be left empty if directly using the public IP and dashboard port.  Should match the ingress host and path above. |
| sdtd.serverConfig.gameplay.difficulty.playerSafeZoneHours | int | `5` | Hours in world time this safe zone exists. |
| sdtd.serverConfig.gameplay.difficulty.playerSafeZoneLevel | int | `5` | If a player is less than or equal to this level he will create a safe zone (no enemies) when spawned. |
| sdtd.serverConfig.gameplay.gameRules.allowSpawnNearFriend | int | `2` | Can new players joining the server for the first time select to join near any friend playing at the same time? 0 = Disabled, 1 = Always, 2 = Only near friends in forest biome. |
| sdtd.serverConfig.gameplay.gameRules.bedrollDeadZoneSize | int | `15` | Size (box "radius", so a box with 2 times the given value for each side's length) of bedroll deadzone, no zombies will spawn inside this area, and any cleared sleeper volumes that touch a bedroll deadzone will not spawn after they've been cleared. |
| sdtd.serverConfig.gameplay.gameRules.bedrollExpiryTime | int | `45` | Number of days a bedroll stays active after owner was last online. |
| sdtd.serverConfig.gameplay.gameRules.buildCreate | bool | `false` | Cheat mode on/off |
| sdtd.serverConfig.gameplay.gameRules.cameraRestrictionMode | int | `0` | 0 = Players can freely swap between first and third person camera modes, 1 = Restricted to first person, 2 = Restricted to third person. |
| sdtd.serverConfig.gameplay.landClaim.dynamicMeshEnabled | bool | `true` | Is Dynamic Mesh system enabled. |
| sdtd.serverConfig.gameplay.landClaim.dynamicMeshLandClaimBuffer | int | `3` | Dynamic Mesh LCB chunk radius. |
| sdtd.serverConfig.gameplay.landClaim.dynamicMeshLandClaimOnly | bool | `true` | Is Dynamic Mesh system only active in player LCB areas. |
| sdtd.serverConfig.gameplay.landClaim.dynamicMeshMaxItemCache | int | `3` | How many items can be processed concurrently, higher values use more RAM. |
| sdtd.serverConfig.gameplay.landClaim.landClaimCount | int | `3` | Maximum allowed land claims per player. |
| sdtd.serverConfig.gameplay.landClaim.landClaimDeadZone | int | `30` | Land claim blocks must be this many blocks apart (unless you are friends with the other player). |
| sdtd.serverConfig.gameplay.landClaim.landClaimDecayMode | int | `0` | Controls how offline players land claims decay. 0=Slow (Linear), 1=Fast (Exponential), 2=None (Full protection until claim is expired). |
| sdtd.serverConfig.gameplay.landClaim.landClaimExpiryTime | int | `7` | The number of days a player can be offline before their claims expire and are no longer protected. |
| sdtd.serverConfig.gameplay.landClaim.landClaimOfflineDelay | int | `0` | The number of minutes after a player logs out that the land claim area hardness transitions from online to offline. Default is 0. |
| sdtd.serverConfig.gameplay.landClaim.landClaimOfflineDurabilityModifier | int | `4` | How much protected claim area block hardness is increased when a player is offline. 0 means infinite (no damage will ever be taken). Default is 4x. |
| sdtd.serverConfig.gameplay.landClaim.landClaimOnlineDurabilityModifier | int | `4` | How much protected claim area block hardness is increased when a player is online. 0 means infinite (no damage will ever be taken). Default is 4x. |
| sdtd.serverConfig.gameplay.landClaim.landClaimSize | int | `41` | Size in blocks that is protected by a land claim block. |
| sdtd.serverConfig.gameplay.landClaim.twitchBloodMoonAllowed | bool | `false` | If the server allows twitch actions during a blood moon. This could cause server lag with extra zombies being spawned during blood moon. |
| sdtd.serverConfig.gameplay.landClaim.twitchServerPermission | int | `90` | Required permission level to use twitch integration on the server. |
| sdtd.serverConfig.gameplay.misc.sandboxCode | string | `"AAAJABJACJADJARFBNC"` | Currently set to the default difficulty of Adventurer. This code can be changed by starting the new game screen, clicking on the sandbox options button, adjusting the options, and then using the copy code button to paste it here. Code example: AAAJABJACJADJARFBNC  See https://7d2d.net/7-days-to-die-sandbox-code-generator for a code generator. |
| sdtd.serverConfig.gameplay.multiplayer.partySharedKillRange | int | `100` | The distance you must be within to receive party shared kill xp and quest party kill objective credit. |
| sdtd.serverConfig.gameplay.multiplayer.playerKillingMode | int | `3` | Player Killing Settings (0 = No Killing, 1 = Kill Allies Only, 2 = Kill Strangers Only, 3 = Kill Everyone). |
| sdtd.serverConfig.gameplay.performance.maxQueuedMeshLayers | int | `1000` | Maximum amount of Chunk mesh layers that can be enqueued during mesh generation. Reducing this will improve memory usage but may increase Chunk generation time. |
| sdtd.serverConfig.gameplay.performance.maxSpawnedAnimals | int | `50` | If your server has a large number of players you can increase this limit to add more wildlife. Animals don't consume as much CPU as zombies. NOTE: That this doesn't cause more animals to spawn arbitrarily: The biome spawning system only spawns a certain number of animals in a given area, but if you have lots of players that are all spread out then you may be hitting the limit and can increase it. Do not set this higher than 90. |
| sdtd.serverConfig.gameplay.performance.maxSpawnedZombies | int | `64` | This setting covers the entire map. There can only be this many zombies on the entire map at one time. Changing this setting has a huge impact on performance. It is not recommended to exceed 90 on recommended hardware, or 128 on high-end hardware. |
| sdtd.serverConfig.gameplay.performance.serverMaxAllowedViewDistance | int | `12` | Max viewdistance a client may request (6 - 12). High impact on memory usage and performance. |
| sdtd.serverConfig.gameplay.world.gameMode | string | `"GameModeSurvival"` | The game mode (only option now is `GameModeSurvival`) |
| sdtd.serverConfig.gameplay.world.gameName | string | `"MyGame"` | Whatever you want the game name to be. This affects the save game name as well as the seed used when placing decoration (trees etc) in the world. It does not control the generic layout of the world if creating an RWG world. |
| sdtd.serverConfig.gameplay.world.gameWorld | string | `"Navezgane"` | "RWG" (see WorldGenSeed and WorldGenSize options below) or any already existing world name in the Worlds folder (currently shipping with e.g. "Navezgane", "Pregen04k1", ...). |
| sdtd.serverConfig.gameplay.world.worldGenSeed | string | `"asdf"` | If RWG this is the seed for the generation of the new world. If a world with the resulting name already exists it will simply load it. |
| sdtd.serverConfig.gameplay.world.worldGenSize | int | `6144` | If RWG this controls the width and height of the created world. It is also used in combination with WorldGenSeed to create the internal RWG seed thus also creating a unique map name even if using the same WorldGenSeed. Has to be between 2048 and 16384, though large map sizes will take long to generate / download / load |
| sdtd.serverConfig.networking.serverDisabledNetworkProtocols | string | `""` | Networking protocols that should NOT be used. Separated by comma. Possible values: LiteNetLib, SteamNetworking. Dedicated servers should disable SteamNetworking if there is no NAT router in between your users and the server or when port-forwarding is set up correctly. LiteNetLib should only be disabled for temporary troubleshooting as doing so will greatly degrade network optimization in the server client. |
| sdtd.serverConfig.networking.serverMaxWorldTransferSpeedKiBs | int | `512` | Maximum (!) speed in kiB/s the world is transferred at to a client on first connect if it does not have the world yet. Maximum is about 1300 kiB/s, even if you set a higher value. 1300kiB/s is roughly equivalent to 10Mbps. |
| sdtd.serverConfig.networking.serverPort | int | `26900` | Port you want the server to listen on. Keep it in the ranges 26900 to 26905 or 27015 to 27020 if you want PCs on the same LAN to find it as a LAN server.  Should match the gameService.port value above. |
| sdtd.serverConfig.networking.serverVisibility | int | `2` | Visibility of this server: 2 = public, 1 = only shown to friends, 0 = not listed. As you are never friend of a dedicated server setting this to "1" will only work when the first player connects manually by IP. |
| sdtd.serverConfig.other.eacEnabled | bool | `true` | Enables/Disables EasyAntiCheat. |
| sdtd.serverConfig.other.hideCommandExecutionLog | int | `0` | Hide logging of command execution. 0 = show everything, 1 = hide only from Telnet/ControlPanel, 2 = also hide from remote game clients, 3 = hide everything |
| sdtd.serverConfig.other.ignoreEOSSanctions | bool | `false` | Ignore EOS sanctions when allowing players to join. (not 100% sure how this system functions currently. More details to come). |
| sdtd.serverConfig.other.maxChunkAge | int | `-1` | The number of in-game days which must pass since visiting a chunk before it will reset to its original state if not revisited or protected (e.g by a land claim or bedroll being in close proximity). |
| sdtd.serverConfig.other.maxUncoveredMapChunksPerPlayer | int | `131072` | Override how many chunks can be uncovered on the ingame map by each player. Resulting max map file size limit per player is (x * 512 Bytes), uncovered area is (x * 256 m²). Default 131072 means max 32 km² can be uncovered at any time. |
| sdtd.serverConfig.other.persistentPlayerProfiles | bool | `false` | If disabled a player can join with any selected profile. If true they will join with the last profile they joined with |
| sdtd.serverConfig.other.saveDataLimit | int | `-1` | The maximum disk space allowance for each saved game in megabytes (MB). Saved chunks may be forcibly reset to their original states to free up space when this limit is reached. Negative values disable the limit. |
| sdtd.serverConfig.other.serverAllowCrossplay | bool | `false` | Enables/Disables crossplay, crossplay servers will only be found in searches and joinable if sanctions are not ignored, and have a default or fewer player slot count. |
| sdtd.serverConfig.server.language | string | `"English"` | Primary language for players on this server. Values: Use any language name that you would users expect to search for. Should be the English name of the language, e.g. not "Deutsch" but "German" |
| sdtd.serverConfig.server.region | string | `"NorthAmericaEast"` | The region this server is in. Values: NorthAmericaEast, NorthAmericaWest, CentralAmerica, SouthAmerica, Europe, Russia, Asia, MiddleEast, Africa, Oceania. |
| sdtd.serverConfig.server.serverDescription | string | `"A 7 Days to Die server"` | Whatever you want the server description to be, will be shown in the server browser. |
| sdtd.serverConfig.server.serverLoginConfirmationText | string | `""` | If set, the user will see the message during joining the server and has to confirm it before continuing. For more complex changes to this window you can change the "serverjoinrulesdialog" window in XUi |
| sdtd.serverConfig.server.serverName | string | `"My Game Host"` | Whatever you want the name of the server to be. |
| sdtd.serverConfig.server.serverPasswordSecret | string | `""` | Secret containing the password to gain entry to the server. Must contain a value named "password" containing the password. |
| sdtd.serverConfig.server.serverWebsiteUrl | string | `""` | Website URL for the server, will be shown in the serverbrowser as a clickable link. |
| sdtd.serverConfig.slots.serverAdminSlots | int | `0` | This many admins can still join even if the server has reached MaxPlayerCount. |
| sdtd.serverConfig.slots.serverAdminSlotsPermission | int | `0` | Required permission level to use the admin slots above. |
| sdtd.serverConfig.slots.serverMaxPlayerCount | int | `8` | Maximum Concurrent Players |
| sdtd.serverConfig.slots.serverReservedSlots | int | `0` | Out of the MaxPlayerCount this many slots can only be used by players with a specific permission level. |
| sdtd.serverConfig.slots.serverReservedSlotsPermission | int | `100` | Required permission level to use reserved slots above. |
| sdtd.userConfig.allowlistGroups | list | `[]` | Groups allowed to login to the server. |
| sdtd.userConfig.allowlistUsers | list | `[]` | Users allowed to login to the server.  When empty, any users will be allowed to login (assuming there is no password or the users know the password). When not empty, only users listed in the whitelist, and admins, will be permitted to log in. |
| sdtd.userConfig.commands | list | `[]` | List of custom commands for which to set permissions. |
| sdtd.userConfig.denylist | list | `[]` | List of users banned from the server. |
| sdtd.userConfig.groups | list | `[]` | List of groups and permissions.  You can find the SteamID64 of any group by taking its address and adding   /memberslistxml/?xml=1 to the end. You will get the XML information of the group which should have an entry memberList->groupID64. Example: The 'Steam Universe' group has the address   https://steamcommunity.com/groups/steamuniverse So you point your browser to   https://steamcommunity.com/groups/steamuniverse/memberslistxml/?xml=1 And see that the groupID64 is 103582791434672565. |
| sdtd.userConfig.users | list | `[]` | List of users and permissions.  You can find the SteamID64 of any user with one of the following pages: https://steamdb.info/calculator/, https://steamid.io/lookup, http://steamid.co/ http://steamid.co/ instructions: Input the player's name in the search field. example: Kinyajuu If the name doesn't work, you can also use the url of their steam page. Also you may add/remove admins, mods, whitelist, blacklist using in game commands. You will want the STEAM64ID. example: 76561198021925107  Permission level: 0-1000, a user may run any command equal to or above their permission level. Users not given a permission level in this file will have a default permission level of 1000! |
| sdtd.validate | bool | `false` | Validate the game files on start up. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
