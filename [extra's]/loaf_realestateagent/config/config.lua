Config = {
    ESX = {
        Client = "esx:getSharedObject",
        Server = "esx:getSharedObject"
    },

    DefaultControl = 51, 
    Align = "top-right", -- where the menu is aligned
    Blip = false,
    HelpStyle = "3d", -- help style, valid options: "default" | "default-3d" | "3d"
    AllowTransferSelf = true, -- allow realtors to transfer a house to themselves
    ChoosePrice = true, -- choose price when creating a house? this price is never paid, unless Config.AllowCircle is enabled in housing. only used when reselling houses.

    Job = {
        Name = "realestateagent", -- the name of the job
        Boss = 2, -- grade required to view boss menu

        Create = 2, -- grade required to create houses
        Command = "reamenu", -- command for job menu
        MenuKey = "F6", -- the key to open the job menu (used for billing, creating houses, transferring houses etc.)
    },

    SocietyOptions = {
        wash = false,
    },

    Interior = {
        Entrance = vector4(-198.3, -575.41, 40.49, 71.07),
        Exit = vector4(-141.75, -617.61, 168.82, 271.78),
        BossActions = vector3(-125.81, -640.94, 168.84), -- the position of boss actions
    },
}