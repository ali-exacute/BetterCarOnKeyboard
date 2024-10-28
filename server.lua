local currentVersion = GetResourceMetadata(GetCurrentResourceName(), "version", 0):sub(1, -1)
local color = {current = true, colors = { [1] = '^2', [2] = '^5' }}
CreateThread(function()
    PerformHttpRequest(
    "https://raw.githubusercontent.com/ali-exacute/VerCheck/master/BetterCarOnKeyboard.json",
    function(code, result, _)
        print('\n============== ^2Version Checker^0 ==============')
        if code ~= 200 then
            print("^3No information about latest stable version could be fetched\n^5Script will still work as normal^0")
            print('^0==============================================')
            return
        end
        local updateData = json.decode(result)[1]
        print('^0Current Version :^5', currentVersion)
        print('^0Latest  Version :^4', updateData.version)
        if updateData.version > currentVersion then
            print('\n^3!! New update available !!^0')
            print('^4Priority :^0 << '..updateData.priority.. '^0 >>')
            print('\n---- ^4ChangeLog ^0----')
            for i=1, #updateData.changelog do
                print(color.current and color.colors[1] or color.colors[2] , updateData.changelog[i])
                color.current = not color.current
            end

            print('\n^3Download:^8 https://github.com/ali-exacute/BetterCarOnKeyboard ^0')

        elseif updateData.version < currentVersion then
            print('^3You are running a newer version than latest stable release^0')
        else
            print('^2You are running the latest version !^0')
        end
        print('^0==============================================')

    end, "GET")
end)