So you may have wanted just to be able to print into console in different colors, fonts, sizes, etc. at some point maybe
but yeah there is no function that lets you do it easily (atleast one that i know of, if there actualy exist something, please just kill me)

So the main features:

Custom Colors ![img](https://i.imgur.com/GprYgbC.png)

RAINBOW ![img](https://i.imgur.com/bAsuLcu.gif)

Remove the time in front of the text ![img](https://i.imgur.com/0IILeLK.png)

Custom Fonts ![img](https://i.imgur.com/f2aYhBo.png)

Custom Text Size ![img](https://i.imgur.com/NzkqlVh.png)

Custom Icon (uh idk how to get the image asset link, but you can surely get it to work)

you can of course combine them
![img](https://i.imgur.com/PyzHi8T.gif)

Script\: 
```lua 
loadstring(game:HttpGet(('https://raw.githubusercontent.com/yafyz/customprint/master/main.lua'),true))().EasyInit("eP", true)
```

First parameter of EasyInit is the name to export the module as, second if you want to enable rainbow (of course you do, why do i even give you an option)
Also its autoexec safe

Usage: 
```lua
eP.print({
    --parameters
})
```
or
```lua
cprint({
    --parameters
})
```

Parameters:

    Text (string)
    TextSize (number)
    Color (color3)
    Font (string)
    BeforeText (string)
    KeepTime (bool)
    IsWarn (bool)
    Icon (string)

i hope i didnt miss anything

Examples: 
```lua
eP.print({
    Text = "text",
    Color = Color3.fromRGB(255,0,255)
})
```

```lua
eP.print({Text = "this is so cool",
    Rainbow = true,
    KeepTime = false,
    BeforeText = "~ ",
    Font = "GothamBlack",
    TextSize = 20})
```

Small Q&A:

Q: Dont you think that your method is quite bad ?

A: Yes, shut up, i got reasons.

Q: I dont like to type all the options all the time, could you make more specific functions ?

A: NO, make a f'in wrapper.

Q: Are you really that shit at lua ?

A: yes

Known issues:
1. ~~When applying filters in console the text's id is changed untill you remove the filter again, so it wont apply cool stuff on it~~ not anymore
2. ~~If there is being printed alot of stuff into the console, it will catch the wrong text id (pls gimmie ideas how to fix this one)~~ nah, also fixed
3. ~~Maybe performance issues, mainly when the print function is called~~ they are still there but not as bad
4. ~~If the the text is offscreen when it gets printed, it wont work~~ naaah also fixed

If you have any problems, ideas, etc. please post em
Also please rate my idea, i need to know how much did i waste my time on this
