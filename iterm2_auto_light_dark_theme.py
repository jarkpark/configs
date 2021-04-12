#!/usr/bin/env python3

import asyncio
import iterm2


async def change_theme(theme_parts, connection):
    # my parameters
    profile_name = "James"
    dark_theme = "JetBrains Darcula"
    light_theme = "Night Owlish Light"

    # Themes have space-delimited attributes, one of which will be light or dark.
    if "dark" in theme_parts:
        preset = await iterm2.ColorPreset.async_get(connection, dark_theme)
    else:
        preset = await iterm2.ColorPreset.async_get(connection, light_theme)

    # Update the list of all profiles and iterate over them.
    profiles = await iterm2.PartialProfile.async_query(connection)
    partial_profile = next(p for p in profiles if p._Profile__props["Name"] == profile_name)

    # Fetch the full profile and then set the color preset in it.
    profile = await partial_profile.async_get_full_profile()
    await profile.async_set_color_preset(preset)


async def main(connection):
    # Set color scheme correctly at app start
    app = await iterm2.async_get_app(connection)
    parts = await app.async_get_theme()
    await change_theme(parts, connection)

    async with iterm2.VariableMonitor(connection, iterm2.VariableScopes.APP, "effectiveTheme", None) as mon:
        while True:
            # Block until theme changes
            theme = await mon.async_get()
            parts = theme.split(" ")
            await change_theme(parts, connection)


iterm2.run_forever(main)
