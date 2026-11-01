-- What it says on the tin; go to next chapter or, if none available, next file.
-- for when you want a next/previous button to make a bit more sense!
--
-- usage: edit input.config and add something like:
-- NEXT         script-message next_chapter_or_file
-- PREV         script-message prev_chapter_or_file
-- MBTN_FORWARD script-message next_chapter_or_file
-- MBTN_BACK    script-message prev_chapter_or_file

mp.register_script_message("next_chapter_or_file", function()
    local chapter = mp.get_property_number("chapter")
    local chapters = mp.get_property_number("chapters")

    if chapter ~= nil and chapters ~= nil and chapter < (chapters - 1) then
        mp.command("add chapter 1")
    else
        mp.command("playlist-next")
    end
end)

mp.register_script_message("prev_chapter_or_file", function()
    local chapter = mp.get_property_number("chapter")
    local chapters = mp.get_property_number("chapters")

    if chapter ~= nil and chapters ~= nil and chapter > 0 then
        mp.command("add chapter -1")
    else
        mp.command("playlist-prev")
    end
end)
