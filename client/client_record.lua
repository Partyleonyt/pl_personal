if Config.useeditor then
    RegisterCommand(Config.recordcmd, function(source, args, raw)

        if args[1] == Config.startrec then
            StartRecording(1)
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('recordstart'), 3000, Config.infotype)
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', Config.infotype, _U('recordheader'), _U('recordstart'))
            elseif Config.notify == 'cs-hud' then
                exports['cs_hud']:showNotification(_U('recordheader'), _U('recordstart'), Config.infotype, 4000)
            else
                notify(_U('recordheader'), _U('recordstart'), Config.infotype, 4000)
            end
        elseif args[1] == Config.stoprec then
    		StartRecording(0)
            StopRecordingAndSaveClip()
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('recordstop'), 3000, Config.infotype)
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', Config.infotype, _U('recordheader'), _U('recordstop'))
            elseif Config.notify == 'cs-hud' then
                exports['cs_hud']:showNotification(_U('recordheader'), _U('recordstop'), Config.infotype, 4000)
            else
                notify(_U('recordheader'), _U('recordstop'), Config.infotype, 4000)
            end
        elseif args[1] == Config.editoropen then
            NetworkSessionLeaveSinglePlayer() -- https://docs.fivem.net/natives/?_0x3442775428FD2DAA
            ActivateRockstarEditor()
        else
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('recordcmdfail', Config.startrec, Config.stoprec, Config.editoropen), 3000, Config.errortype)
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', Config.errortype, _U('recordheader'), _U('recordcmdfail', Config.startrec, Config.stoprec, Config.editoropen))
            elseif Config.notify == 'cs-hud' then
                exports['cs_hud']:showNotification(_U('recordheader'), _U('recordcmdfail', Config.startrec, Config.stoprec, Config.editoropen), Config.errortype, 4000)
            else
                notify(_U('recordheader'), _U('recordstop'), Config.errortype, 4000)
            end
        end
    end, false)
end
if Config.usewatermark then
print(Config.watermark)
end
