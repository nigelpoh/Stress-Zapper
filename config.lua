if string.sub(system.getInfo("model"),1,4) == "iPad" then
    -- iPad 2 and iPad retina
    application = 
    {
        content =
        {
            width = 720,
            height = 1280,
            scale = "zoomStretch",
            xAlign = "center",
            yAlign = "center",
            imageSuffix = 
            {
                --["@2x"] = 1.6,
                --["@4x"] = 3.0,
            },
        },
        
        notification = 
        {
            iphone = {
                types = {
                    "badge", "sound", "alert"
                }
            }
        }
    }

elseif string.sub(system.getInfo("model"),1,2) == "iP" and display.pixelHeight > 960 then
    -- iPhone 5 & 5S
    application = 
    {
        content =
        {
            width = 720,
            height = 1280,
            scale = "letterBox",
            xAlign = "center",
            yAlign = "center",
            imageSuffix = 
            {
                --["@2x"] = 0.889,
                --["@4x"] = 3.0,
            },
        },
        

        notification = 
        {
            iphone = {
                types = {
                    "badge", "sound", "alert"
                }
            }
        }
    }

elseif string.sub(system.getInfo("model"),1,2) == "iP" then
    --iPhone 4, 4S, iPod older generations
    application = 
    {
        content =
        {
            width = 640,
            height = 960,
            scale = "letterBox",
            xAlign = "center",
            yAlign = "center",
            imageSuffix = 
            {
                --["@2x"] = 2.0,
                --["@4x"] = 3.0,
            },
        },

        

        notification = 
        {
            iphone = {
                types = {
                    "badge", "sound", "alert"
                }
            }
        }
    }
elseif (display.pixelHeight / display.pixelWidth > 1.75 and  display.pixelHeight / display.pixelWidth < 1.78 ) then
    -- Android higher resolution devices Samsung S3, S4, S5, Note 2, Note 3, etc
    application = 
    {
        content =
        {
            width = 720,
            height = 1280,
            scale = "letterbox",
            xAlign = "center",
            yAlign = "center",
            imageSuffix = 
            {
                --["@2x"] = 1.5,
                --["@4x"] = 3.0,
            },
        },

    }
elseif (display.pixelHeight / display.pixelWidth == 1.6) then
    -- Android devices like Samsung Tab
    application = 
    {
        content =
        {
            width = 800,
            height = 1280,
            scale = "letterbox",
            xAlign = "center",
            yAlign = "center",
            imageSuffix = 
            {
                --["@2x"] = 2.0,
                
                
            },
        },
    }
else
    -- android lower resolution devices
    application = 
    {
        content =
        {
            width = 720,
            height = 1280,
            scale = "zoomStretch",
            xAlign = "center",
            yAlign = "center",
            imageSuffix = 
            {
                --["@2x"] = 2.0,
                --["@4x"] = 3.0,
            },
        },

        
        notification = 
        {
            iphone = {
                types = {
                    "badge", "sound", "alert"
                }
            }
        }
    }
end
